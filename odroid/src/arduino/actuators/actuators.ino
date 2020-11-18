#include <Wire.h>

volatile float PID_KP      = 0.12;
volatile float PID_KI      = 0.22;
volatile float PID_THRESH  = 100;
volatile float PID_IE      = 0;

volatile int DESIRED_ANGLE = 0;
volatile int DESIRED_SPEED = 0;
volatile int CURRENT_SPEED = 0;
unsigned int CURRENT_MOTOR_CNT;
unsigned int CURRENT_SERVO_CNT;

volatile unsigned int PID_SAMPLING_PERIOD_MS = 0;
volatile unsigned int PID_ELAPSED_MS   = 0;

volatile bool RUN_PID_ROUTINE = false;

// const float ANGLE_CONV_ADD_CONST  = 196.6265;
// const float ANGLE_CONV_PROD_CONST = -0.07229;

const float ANGLE_CONV_ADD_CONST  = 1478.5;
const float ANGLE_CONV_PROD_CONST = -13.95;

const unsigned int DEBUG_PIN     = A6;
const unsigned int INTERRUPT_PIN = 8;
const unsigned int MOTOR_PIN     = 9;
const unsigned int SERVO_PIN     = 10;;

const bool AUTO_MODE = HIGH;

const unsigned long BAUD_RATE = 2000000;

const byte I2C_ID = 1;

const unsigned int TEST_CONST            = 11;
const unsigned int TEST_ROUTINE_DELAY_MS = 500;

// ---------------------------------------
//  AUTO MODIFIED
//  (DO NOT MANUALLY CHANGE UNLESS YOU KNOW WHAT YOU'RE DOING!)
// ---------------------------------------
const unsigned int MOTOR_IDLE_CNT = 1478;
const unsigned int SERVO_IDLE_CNT = 1475;
const unsigned int MOTOR_MIN_CNT  = 1546; //1534
const unsigned int SERVO_MIN_CNT  = 1060;
const unsigned int SERVO_MAX_CNT  = 1897;
// ----------------------------------------
const unsigned int MOTOR_MAX_CNT = MOTOR_IDLE_CNT + 500;

enum states {INIT, SUM, STAY, RESTART, START, STOP};
states state = INIT;
long test_init_time;
unsigned int test_motor_cnt = 0;
unsigned int test_motor_cnt_2 = 1574;

unsigned int test_motor_min_cnt = 1561;
unsigned int test_motor_max_cnt = 1580;

void setup() {
  pinMode(DEBUG_PIN, INPUT);
  pinMode(INTERRUPT_PIN, INPUT);
  pinMode(MOTOR_PIN, OUTPUT);
  pinMode(SERVO_PIN, OUTPUT);

  Serial.begin(BAUD_RATE);
  Serial.println(analogRead(DEBUG_PIN) > 100 ? 1 : 0);

  PID_ELAPSED_MS = millis();
  Wire.begin(I2C_ID);
  Wire.onReceive(receive_i2c_speed_message);

  init_pwm_timer();
  while(get_operating_mode() == AUTO_MODE) set_motor_pwm(0);
  randomSeed(analogRead(0));
}

void loop() {
  digitalWrite(LED_BUILTIN, get_operating_mode());
  // control_actuators();
  control_actuators_test();
}

void experiment_routine(){
  switch(state){
    case INIT:
    if(get_operating_mode() == AUTO_MODE){
      test_motor_cnt = 1525;
      state = SUM;
      test_init_time = millis();
    }
    break;
    case SUM:
    if(CURRENT_SPEED > 0){
      state = STAY;
      test_init_time = millis();
    }
    else{
      if(millis() - test_init_time > 2000){
        test_motor_cnt = test_motor_cnt < 1550 ? test_motor_cnt + 1 : test_motor_cnt;
        test_init_time = millis();
      }
    }
    break;
    case STAY:
    if(millis() - test_init_time > 6000){
      test_motor_cnt = 0;
      state = RESTART;
    }
    break;
    case RESTART:
    if(get_operating_mode() != AUTO_MODE){
      state = INIT;
    }
    break;
    default:
    break;
  }
  set_motor_pwm(test_motor_cnt);
}

void experiment_routine_2(){
  switch(state){
    case INIT:
    if(get_operating_mode() == AUTO_MODE){
      test_motor_cnt = 0;
      state = START;
      test_init_time = millis();
    }
    break;
    case START:
    if (millis() - test_init_time > 3000){
      test_motor_cnt = MOTOR_IDLE_CNT;
      state = STOP;
      test_init_time = millis();
    }
    break;
    case STOP:
    if (millis() - test_init_time > 5000){
      test_motor_cnt = test_motor_cnt_2;
      state = STAY;
      test_init_time = millis();
    }
    case STAY:
    if(millis() - test_init_time > 10000){
      test_motor_cnt = 0;
      state = RESTART;
    }
    break;
    case RESTART:
    if(get_operating_mode() != AUTO_MODE){
      state = INIT;
      test_motor_cnt_2 = test_motor_cnt_2 + 1;
    }
    break;
    default:
    break;
  }
  set_motor_pwm(test_motor_cnt);
}

void experiment_routine_3(){
  switch(state){
    case INIT:
    if(get_operating_mode() == AUTO_MODE){
      test_motor_cnt = 0;
      state = START;
      test_init_time = millis();
    }
    break;
    case START:
    if (millis() - test_init_time > 3000){
      test_motor_cnt = MOTOR_IDLE_CNT;
      state = STOP;
      test_init_time = millis();
    }
    break;
    case STOP:
    if (millis() - test_init_time > 5000){
      unsigned int new_test_motor_cnt = random(test_motor_min_cnt, test_motor_max_cnt);
      // while(new_test_motor_cnt < test_motor_cnt + 15 && new_test_motor_cnt > test_motor_cnt - 15) new_test_motor_cnt = random(test_motor_min_cnt, test_motor_max_cnt);
      while(new_test_motor_cnt == test_motor_cnt) new_test_motor_cnt = random(test_motor_min_cnt, test_motor_max_cnt);
      test_motor_cnt = new_test_motor_cnt;
      state = STAY;
      test_init_time = millis();
    }
    case STAY:
    if(get_operating_mode() != AUTO_MODE){
      state = INIT;
      test_motor_cnt = 0;
    }
    if(millis() - test_init_time >= 6000){
      unsigned int new_test_motor_cnt = random(test_motor_min_cnt, test_motor_max_cnt);
      // while(new_test_motor_cnt < test_motor_cnt + 5 && new_test_motor_cnt > test_motor_cnt - 5) new_test_motor_cnt = random(test_motor_min_cnt, test_motor_max_cnt);
      while(new_test_motor_cnt == test_motor_cnt) new_test_motor_cnt = random(test_motor_min_cnt, test_motor_max_cnt);
      test_motor_cnt = new_test_motor_cnt;
      test_init_time = millis();
    }
    break;
    default:
    break;
  }
  set_motor_pwm(test_motor_cnt);
}

void serialEvent() {
  char command[40];
  char input_char = -1;
  int id = 0;

  while(Serial.available()){
    input_char = Serial.read();
    command[id] = input_char;
    id++;
    command[id] = '\0';
  }

  if (strcmp(command, "GET\r\n") == 0){
    Serial.println(String(CURRENT_MOTOR_CNT) + " " + String(CURRENT_SERVO_CNT));
    return;
  }

  int desired_speed;
  int desired_angle;

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

// void serialEvent() {
//   char command[40];
//   char input_char = -1;
//   int id = 0;
//   while(Serial.available()){
//     input_char = Serial.read();
//     command[id] = input_char;
//     id++;
//     command[id] = '\0';
//   }
//   if(strcmp(command, "GET\r\n") == 0){
//     Serial.println(String(CURRENT_MOTOR_CNT) + " " + String(CURRENT_SERVO_CNT));
//     return;
//   }
//   sscanf(command, "%f %f %f %f", &DESIRED_SPEED, &PID_KP, &PID_KI, &PID_THRESH);
//   Serial.println(String(PID_SAMPLING_PERIOD_MS) + " " + String(CURRENT_SPEED) + " " + String(DESIRED_SPEED) + " " + String(PID_KP) +  " " + String(PID_KI) + " " + String(PID_THRESH));
// }


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

  // itoa(DESIRED_SPEED, speed_str, 10);
  //
  // Wire.beginTransmission(I2C_ID);
  // Wire.write(speed_str);
  // Wire.endTransmission();

  PID_SAMPLING_PERIOD_MS = millis() - PID_ELAPSED_MS;
  PID_ELAPSED_MS = millis();
  RUN_PID_ROUTINE = true;

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
  motor_cnt = motor_cnt <= MOTOR_IDLE_CNT || DESIRED_SPEED <= 0 ? MOTOR_IDLE_CNT : motor_cnt <= MOTOR_MIN_CNT ? MOTOR_MIN_CNT : motor_cnt >= MOTOR_MAX_CNT ? MOTOR_MAX_CNT : motor_cnt;
  servo_cnt = servo_cnt <= SERVO_MIN_CNT ? SERVO_MIN_CNT : (servo_cnt >= SERVO_MAX_CNT ? SERVO_MAX_CNT : servo_cnt);
  set_motor_pwm(motor_cnt);
  set_servo_pwm(servo_cnt);
}

void set_motors_pwm_output(int motor_pwm_cnt, int servo_pwm_cnt){
  set_motor_pwm(motor_pwm_cnt);
  set_servo_pwm(servo_pwm_cnt);
}

void set_motor_pwm(int motor_pwm_cnt) {
  CURRENT_MOTOR_CNT = motor_pwm_cnt;
  OCR1A = motor_pwm_cnt;
}

void set_servo_pwm(int servo_pwm_cnt) {
  CURRENT_SERVO_CNT = servo_pwm_cnt;
  OCR1B = servo_pwm_cnt;
}

void control_actuators(){
  if (!RUN_PID_ROUTINE) return;

  if (get_operating_mode() != AUTO_MODE) {
    PID_IE = 0;
    return;
  }

  RUN_PID_ROUTINE = false;

  unsigned int motor_cnt;
  // unsigned int servo_cnt = ((float)DESIRED_ANGLE -  ANGLE_CONV_ADD_CONST) / ANGLE_CONV_PROD_CONST;
  unsigned int servo_cnt = ((float) DESIRED_ANGLE * ANGLE_CONV_PROD_CONST) +  ANGLE_CONV_ADD_CONST;
  float speed_error = (float)(DESIRED_SPEED - CURRENT_SPEED);
  float PID_PE = PID_KP * speed_error;
  PID_IE = max(- PID_THRESH , min(PID_IE + PID_KI * ((float)PID_SAMPLING_PERIOD_MS / 1000.0) * speed_error, PID_THRESH));
  motor_cnt = PID_PE + PID_IE + MOTOR_MIN_CNT;
  output_motors_pwm(motor_cnt, servo_cnt);
}

void control_actuators_test(){
  // unsigned int servo_cnt = ((float)DESIRED_ANGLE -  ANGLE_CONV_ADD_CONST) / ANGLE_CONV_PROD_CONST;
  unsigned int servo_cnt = ((float) DESIRED_ANGLE * ANGLE_CONV_PROD_CONST) +  ANGLE_CONV_ADD_CONST;
  output_motors_pwm(MOTOR_MIN_CNT, servo_cnt);
}

void test_routine(){
  set_motor_pwm(MOTOR_IDLE_CNT);
  set_servo_pwm(SERVO_IDLE_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  set_motor_pwm(MOTOR_MIN_CNT);
  set_servo_pwm(SERVO_IDLE_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  set_motor_pwm(MOTOR_MIN_CNT);
  set_servo_pwm(SERVO_MAX_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  set_motor_pwm(MOTOR_MIN_CNT);
  set_servo_pwm(SERVO_IDLE_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  set_motor_pwm(MOTOR_MIN_CNT);
  set_servo_pwm(SERVO_MIN_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  set_motor_pwm(MOTOR_MIN_CNT);
  set_servo_pwm(SERVO_IDLE_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  set_motor_pwm(MOTOR_MIN_CNT);
  set_servo_pwm(SERVO_MAX_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  set_motor_pwm(MOTOR_MIN_CNT);
  set_servo_pwm(SERVO_MIN_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  set_motor_pwm(MOTOR_MIN_CNT);
  set_servo_pwm(SERVO_MAX_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  set_motor_pwm(MOTOR_MIN_CNT);
  set_servo_pwm(SERVO_IDLE_CNT);
  delay(TEST_ROUTINE_DELAY_MS);

  set_motor_pwm(MOTOR_IDLE_CNT);
  set_servo_pwm(SERVO_IDLE_CNT);
  delay(TEST_ROUTINE_DELAY_MS);
}

