#include <Wire.h>

const float WHEEL_RADIUS_CM = 5.25;
const float ENCODER_COUNT_TO_WHEEL_TURNS_CONST = 20.0;
const unsigned int SAMPLING_PERIOD_MS = 200;
volatile unsigned int TIMER_ELAPSED_MS = 0;

const unsigned int DEBUG_PIN     = A6;
const unsigned int INTERRUPT_PIN = 2;
const unsigned int ENCODER1_PIN = 4;
const unsigned int ENCODER2_PIN = 5;
const unsigned int ENCODER3_PIN = 6;
const unsigned int ENCODER4_PIN = 7;
const unsigned int SERVO_PIN = 8;
const unsigned int MOTOR_PIN = 9;

const    bool AUTO_MODE = HIGH;
volatile bool OPERATING_MODE;

volatile bool SERVO_STATE = LOW;
volatile bool MOTOR_STATE = LOW;
volatile bool ENCODER1_STATE = LOW;
volatile bool ENCODER2_STATE = LOW;
volatile bool ENCODER3_STATE = LOW;
volatile bool ENCODER4_STATE = LOW;

volatile unsigned int PREV_ENCODER1_CNT = 0;
volatile unsigned int PREV_ENCODER2_CNT = 0;
volatile unsigned int PREV_ENCODER3_CNT = 0;
volatile unsigned int PREV_ENCODER4_CNT = 0;
volatile unsigned int ENCODER1_CNT = 0;
volatile unsigned int ENCODER2_CNT = 0;
volatile unsigned int ENCODER3_CNT = 0;
volatile unsigned int ENCODER4_CNT = 0;

volatile unsigned int SPEED = 0;
volatile float WHEEL1_SPEED = 0;
volatile float WHEEL2_SPEED = 0;
volatile float WHEEL3_SPEED = 0;
volatile float WHEEL4_SPEED = 0;
volatile unsigned int DESIRED_SPEED = 0;

volatile unsigned int WHEEL1_MEAS_SUCCESS = 0;
volatile unsigned int WHEEL2_MEAS_SUCCESS = 0;
volatile unsigned int WHEEL3_MEAS_SUCCESS = 0;
volatile unsigned int WHEEL4_MEAS_SUCCESS = 0;

volatile unsigned int PREV_SERVO_TIMER;
volatile unsigned int PREV_MOTOR_TIMER;
volatile unsigned int MEAS_SERVO_COUNT = 0;
volatile unsigned int MEAS_MOTOR_COUNT = 0;
volatile unsigned int NEW_MEAS_SERVO_COUNT;
volatile unsigned int NEW_MEAS_MOTOR_COUNT;

const float ANGLE_CONV_ADD_CONST  = 196.6265;
const float ANGLE_CONV_PROD_CONST = -0.07229;

const unsigned long BAUD_RATE = 2000000;

const    byte I2C_ID   = 1;
volatile bool I2C_SEND = false;

void setup() {
  pinMode(DEBUG_PIN, INPUT);

  pinMode(ENCODER1_PIN, INPUT);
  pinMode(ENCODER2_PIN, INPUT);
  pinMode(ENCODER3_PIN, INPUT);
  pinMode(ENCODER4_PIN, INPUT);

  pinMode(SERVO_PIN, INPUT);
  pinMode(MOTOR_PIN, INPUT);

  pinMode(INTERRUPT_PIN, INPUT);

  Serial.begin(BAUD_RATE);
  Serial.println(analogRead(DEBUG_PIN) > 100 ? 1 : 0);

  Wire.begin();

  init_timer();
  init_pin_change_interrupt();

  set_operating_mode();

  attachInterrupt(digitalPinToInterrupt(INTERRUPT_PIN), set_operating_mode, CHANGE);
}

void loop() {
  send_i2c_speed_message();
}

void serialEvent(){
  while(Serial.available()) Serial.read();

  MEAS_MOTOR_COUNT = NEW_MEAS_MOTOR_COUNT > 2000 ? MEAS_MOTOR_COUNT : NEW_MEAS_MOTOR_COUNT;
  MEAS_SERVO_COUNT = NEW_MEAS_SERVO_COUNT > 2000 ? MEAS_SERVO_COUNT : NEW_MEAS_SERVO_COUNT;

  int ANGLE = MEAS_SERVO_COUNT != 0 ? int(ANGLE_CONV_PROD_CONST * (MEAS_SERVO_COUNT) + ANGLE_CONV_ADD_CONST) : 0;

  char str[150];
  sprintf(str, "%s %d %d %d %d %d %d %d %d", OPERATING_MODE == AUTO_MODE ? "A" : "M", SPEED, ANGLE, MEAS_MOTOR_COUNT, MEAS_SERVO_COUNT, WHEEL1_MEAS_SUCCESS, WHEEL2_MEAS_SUCCESS, WHEEL3_MEAS_SUCCESS, WHEEL4_MEAS_SUCCESS);
  Serial.println(str);
}

void send_i2c_speed_message(){
  if(!I2C_SEND) return;
  char speed_str[10];
  itoa(SPEED, speed_str, 10);

  Wire.beginTransmission(I2C_ID);
  Wire.write(speed_str);
  Wire.endTransmission();

  // char input_char = -1;
  // int id = 0;
  //
  // while (Wire.available()) {
  //   input_char = Wire.read();
  //   speed_str[id] = input_char;
  //   id++;
  //   speed_str[id] = '\0';
  // }
  // DESIRED_SPEED = atoi(speed_str);
  I2C_SEND = false;
}

float get_wheel_speed(unsigned int encoder_cnt) {
  return((WHEEL_RADIUS_CM * 2.0 * PI) * (float)encoder_cnt / ENCODER_COUNT_TO_WHEEL_TURNS_CONST) / ((float)SAMPLING_PERIOD_MS / 1000.0);
}

ISR(TIMER2_COMPA_vect){
  TIMER_ELAPSED_MS++;

  if(TIMER_ELAPSED_MS == SAMPLING_PERIOD_MS) {
    unsigned int encoder1_cnt = ENCODER1_CNT - PREV_ENCODER1_CNT;
    unsigned int encoder2_cnt = ENCODER2_CNT - PREV_ENCODER2_CNT;
    unsigned int encoder3_cnt = ENCODER3_CNT - PREV_ENCODER3_CNT;
    unsigned int encoder4_cnt = ENCODER4_CNT - PREV_ENCODER4_CNT;

    WHEEL1_MEAS_SUCCESS = encoder1_cnt != 0 ? 1 : 0;
    WHEEL2_MEAS_SUCCESS = encoder2_cnt != 0 ? 1 : 0;
    WHEEL3_MEAS_SUCCESS = encoder3_cnt != 0 ? 1 : 0;
    WHEEL4_MEAS_SUCCESS = encoder4_cnt != 0 ? 1 : 0;

    digitalWrite(LED_BUILTIN, WHEEL1_MEAS_SUCCESS && WHEEL2_MEAS_SUCCESS && WHEEL3_MEAS_SUCCESS && WHEEL4_MEAS_SUCCESS);

    unsigned int WHEEL_SUCCESS_MEAS_CNT = WHEEL1_MEAS_SUCCESS + WHEEL2_MEAS_SUCCESS + WHEEL3_MEAS_SUCCESS + WHEEL4_MEAS_SUCCESS;

    unsigned int encoder_cnt = (encoder1_cnt + encoder2_cnt + encoder3_cnt + encoder4_cnt) / WHEEL_SUCCESS_MEAS_CNT;

    SPEED = WHEEL_SUCCESS_MEAS_CNT > 0 ? get_wheel_speed(encoder_cnt) : 0;

    PREV_ENCODER1_CNT = ENCODER1_CNT;
    PREV_ENCODER2_CNT = ENCODER2_CNT;
    PREV_ENCODER3_CNT = ENCODER3_CNT;
    PREV_ENCODER4_CNT = ENCODER4_CNT;
    I2C_SEND = true;
    TIMER_ELAPSED_MS = 0;
  }
}

ISR(PCINT2_vect) {
  if((PIND & B00010000) >> 4 != ENCODER1_STATE){
    ENCODER1_CNT++;
    ENCODER1_STATE = !ENCODER1_STATE;
  }
  if((PIND & B00100000) >> 5 != ENCODER2_STATE){
    ENCODER2_CNT++;
    ENCODER2_STATE = !ENCODER2_STATE;
  }
  if((PIND & B01000000) >> 6 != ENCODER3_STATE){
    ENCODER3_CNT++;
    ENCODER3_STATE = !ENCODER3_STATE;
  }
  if((PIND & B10000000) >> 7 != ENCODER4_STATE){
    ENCODER4_CNT++;
    ENCODER4_STATE = !ENCODER4_STATE;
  }
}

ISR(PCINT0_vect) {
  unsigned int CURR_TIMER = micros();
  if((PINB & B00000001) >> 0 != SERVO_STATE){
    if((PINB & B00000001) >> 0 == HIGH){
      PREV_SERVO_TIMER = CURR_TIMER;
    }
    else{
      NEW_MEAS_SERVO_COUNT = CURR_TIMER - PREV_SERVO_TIMER;
      PREV_SERVO_TIMER = 0;
    }
    SERVO_STATE = !SERVO_STATE;
  }
  if((PINB & B00000010) >> 1 != MOTOR_STATE){
    if((PINB & B00000010) >> 1 == HIGH){
      PREV_MOTOR_TIMER = CURR_TIMER;
    }
    else{
      NEW_MEAS_MOTOR_COUNT = CURR_TIMER - PREV_MOTOR_TIMER;
      PREV_MOTOR_TIMER = 0;
    }
    MOTOR_STATE = !MOTOR_STATE;
  }
}

void init_timer(){
  TCCR2A = _BV(WGM21);
  TCCR2B =  _BV(CS22) | _BV(CS20);
  OCR2A  = 124;
  TIMSK2 = (1 << OCIE2A);
}

void init_pin_change_interrupt(){
  PCICR  |= (1 << PCIE0);
  PCMSK0 |= (1 << PCINT0);
  PCMSK0 |= (1 << PCINT1);

  PCICR  |= (1 << PCIE2);
  PCMSK2 |= (1 << PCINT20);
  PCMSK2 |= (1 << PCINT21);
  PCMSK2 |= (1 << PCINT22);
  PCMSK2 |= (1 << PCINT23);
}

void set_operating_mode(){
  OPERATING_MODE = (PIND & B00000100);
}

