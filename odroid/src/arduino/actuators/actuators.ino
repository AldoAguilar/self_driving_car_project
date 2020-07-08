#include <Wire.h>

const unsigned int DEBUG_PIN     = A6;
const unsigned int MOTOR_PIN     = 9;
const unsigned int SERVO_PIN     = 10;;

const unsigned long BAUD_RATE = 2000000;

const bool AUTO_MODE = HIGH;

const byte I2C_ID = 1;

volatile float PID_KP      = 0.4;
volatile float PID_KD	   = 0.006;
volatile float PID_KI      = 0.003;
volatile float PID_THRESH  = 100;
volatile float PID_IE      = 0;
volatile bool  PID_DIFF_EN = false;
volatile int   PREV_ERR    = 0;


const    unsigned int PID_SAMPLING_PERIOD_MS = 50;
volatile unsigned int PID_TIMER_ELAPSED_MS   = 0;

volatile bool RUN_PID_ROUTINE = false;
                                          
volatile int DESIRED_ANGLE = 90;
volatile int DESIRED_SPEED = 0;
volatile int CURRENT_SPEED;

const float ANGLE_CONV_ADD_CONST  = 164.23;
const float ANGLE_CONV_PROD_CONST = -0.0518;

const unsigned int TEST_CONST            = 11;
const unsigned int TEST_ROUTINE_DELAY_MS = 500;
const unsigned int TESTING_CNT_CONDITION = 11;

// ---------------------------------------
//  AUTO MODIFIED
//  (DO NOT MANUALLY CHANGE UNLESS YOU KNOW WHAT YOU'RE DOING!)
// ---------------------------------------
const unsigned int MOTOR_IDLE_CNT = 1464;
const unsigned int SERVO_IDLE_CNT = 1455;
const unsigned int MOTOR_MIN_CNT  = 1496;
const unsigned int SERVO_MIN_CNT  = 1082;
const unsigned int SERVO_MAX_CNT  = 1828;
// ----------------------------------------
const unsigned int MOTOR_MAX_CNT = MOTOR_IDLE_CNT + 500;

void setup() {
  pinMode(DEBUG_PIN, INPUT);
  pinMode(MOTOR_PIN, OUTPUT);
  pinMode(SERVO_PIN, OUTPUT);

  Serial.begin(BAUD_RATE);
  Serial.println(analogRead(DEBUG_PIN) > 100 ? 1 : 0);

  Wire.begin(I2C_ID);
  Wire.onReceive(receive_i2c_speed_message);

  init_pid_timer();
  init_pwm_timer();

  while (get_operating_mode() == AUTO_MODE) set_motor_pwm(0);
}

void loop() {
  Serial.println(CURRENT_SPEED);
  test_routine(); 
  //control_actuators();
}
    
ISR(TIMER2_COMPA_vect){
  PID_TIMER_ELAPSED_MS++;

  if(PID_TIMER_ELAPSED_MS == PID_SAMPLING_PERIOD_MS) {
    RUN_PID_ROUTINE = true;
    PID_TIMER_ELAPSED_MS = 0;
  }
}

void serialEvent() {
  unsigned int desired_speed;
  unsigned int desired_angle;

  char command[40];
  char input_char = -1;
  int id = 0;

  while(Serial.available()){
    input_char = Serial.read();
    command[id] = input_char;
    id++;
    command[id] = '\0';
  }

  sscanf(command, "%d %d", &desired_speed, &desired_angle);

  if(desired_angle != TEST_CONST && desired_speed != TEST_CONST){
    DESIRED_SPEED = desired_speed;
    DESIRED_ANGLE = desired_angle;
  }
  else{
    test_routine();
  }

  Serial.println(String(DESIRED_SPEED) + " " + String(DESIRED_ANGLE));

}


void receive_i2c_speed_message(int numBytes) {
  char speed_str[10];
  char input_char = -1;
  int id = 0;

  while (Wire.available()) {
    input_char = Wire.read();
    speed_str[id] = input_char;
    id++;
    speed_str[id] = '\0';
  }

  CURRENT_SPEED = atoi(speed_str);
}

void init_pid_timer(){
  TCCR2A = _BV(WGM21);
  TCCR2B =  _BV(CS22) | _BV(CS20);
  OCR2A = 124;
  TIMSK2 = (1 << OCIE2A);
}

void init_pwm_timer() {
  TCCR1A = _BV(COM1A1) | _BV(COM1B1) | _BV(WGM11);
  TCCR1B = _BV(WGM13) | _BV(CS11);
  ICR1 = 20000;
}

bool get_operating_mode(){
  return PINB & B00000001;
}

void output_motors_pwm(unsigned int motor_cnt, unsigned int servo_cnt){
  motor_cnt = motor_cnt <= MOTOR_IDLE_CNT ? MOTOR_IDLE_CNT : motor_cnt <= MOTOR_MIN_CNT ? MOTOR_MIN_CNT : motor_cnt >= MOTOR_MAX_CNT ? MOTOR_MAX_CNT : motor_cnt;
  servo_cnt = servo_cnt <= SERVO_MIN_CNT ? SERVO_MIN_CNT : (servo_cnt >= SERVO_MAX_CNT ? SERVO_MAX_CNT : servo_cnt);
  set_motor_pwm(motor_cnt);
  set_servo_pwm(servo_cnt);
}

void set_motors_pwm_output(int motor_pwm_cnt, int servo_pwm_cnt){
  set_motor_pwm(motor_pwm_cnt);
  set_servo_pwm(servo_pwm_cnt);
}

void set_motor_pwm(int motor_pwm_cnt) {
  OCR1A = motor_pwm_cnt;
}

void set_servo_pwm(int servo_pwm_cnt) {
  OCR1B = servo_pwm_cnt;
}

void control_actuators(){
  int speed_error;
  unsigned int motor_cnt;
  unsigned int servo_cnt;
  float PID_DE;
  float PID_PE;

  if (DESIRED_SPEED <= 0){
    motor_cnt = MOTOR_IDLE_CNT;
  }

  else{
    speed_error = DESIRED_SPEED - CURRENT_SPEED;
  
    PID_PE = PID_KP * speed_error;
  
    PID_DE =  PID_DIFF_EN ? PID_KD * ((float)(speed_error - PREV_ERR) / ((float)PID_SAMPLING_PERIOD_MS / 1000.0)) : 0;
    PREV_ERR = speed_error;
    PID_DIFF_EN = true;
  
    PID_IE = max(- PID_THRESH , min(PID_IE + PID_KI * ((float)PID_SAMPLING_PERIOD_MS / 1000.0) * speed_error, PID_THRESH));
  
    motor_cnt = PID_PE + PID_IE + PID_DE + MOTOR_MIN_CNT ;
  }
  servo_cnt = ((float)DESIRED_ANGLE -  ANGLE_CONV_ADD_CONST) / ANGLE_CONV_PROD_CONST;

  output_motors_pwm(motor_cnt, servo_cnt);
}

void test_routine(){
  output_motors_pwm(MOTOR_IDLE_CNT, SERVO_IDLE_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  output_motors_pwm(MOTOR_MIN_CNT, SERVO_IDLE_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  output_motors_pwm(MOTOR_MIN_CNT, SERVO_MAX_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  output_motors_pwm(MOTOR_MIN_CNT, SERVO_IDLE_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  output_motors_pwm(MOTOR_MIN_CNT, SERVO_MIN_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  output_motors_pwm(MOTOR_MIN_CNT, SERVO_IDLE_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  output_motors_pwm(MOTOR_MIN_CNT, SERVO_MAX_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  output_motors_pwm(MOTOR_MIN_CNT, SERVO_MIN_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  output_motors_pwm(MOTOR_MIN_CNT, SERVO_MAX_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  output_motors_pwm(MOTOR_MIN_CNT, SERVO_IDLE_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  output_motors_pwm(MOTOR_IDLE_CNT, SERVO_IDLE_CNT);
  delay(TEST_ROUTINE_DELAY_MS);
}
