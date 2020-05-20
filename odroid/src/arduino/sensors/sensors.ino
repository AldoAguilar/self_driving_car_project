#include <Wire.h>

const unsigned int ENCODER_PIN   = A0;
const unsigned int DEBUG_PIN     = A6;
const unsigned int INTERRUPT_PIN = 2;
const unsigned int MOTOR_PIN     = 7;
const unsigned int SERVO_PIN     = 8;

const unsigned long BAUD_RATE = 2000000;

const    bool AUTO_MODE = HIGH;
volatile bool OPERATING_MODE;

const    byte I2C_ID   = 1;
volatile bool I2C_SEND = false;

volatile unsigned int SPEED = 0;
volatile unsigned long CNT   = 0;

const float WHEEL_RADIUS                     = 10.5;
const float MOTOR_COUNT_TO_WHEEL_TURNS_CONST = 115.0;

const    unsigned int SAMPLING_PERIOD_MS = 50;
volatile unsigned int TIMER_ELAPSED_MS   = 0;

const float ANGLE_CONV_ADD_CONST  = 164.23;
const float ANGLE_CONV_PROD_CONST = -0.0518;

volatile unsigned int CURR_SERVO_TIMER;
volatile unsigned int PREV_SERVO_TIMER;
volatile unsigned int MEAS_SERVO_COUNT;

volatile unsigned int CURR_MOTOR_TIMER;
volatile unsigned int PREV_MOTOR_TIMER;
volatile unsigned int MEAS_MOTOR_COUNT;


void setup() {
  pinMode(DEBUG_PIN, INPUT);
  pinMode(ENCODER_PIN, INPUT);
  pinMode(MOTOR_PIN, INPUT);
  pinMode(SERVO_PIN, INPUT);
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

// ENCODER TIMER
ISR(TIMER2_COMPA_vect){
  TIMER_ELAPSED_MS++;

  if(TIMER_ELAPSED_MS == SAMPLING_PERIOD_MS) {
    SPEED = (WHEEL_RADIUS * 2.0 * PI * ((float)CNT / MOTOR_COUNT_TO_WHEEL_TURNS_CONST)) / ((float)SAMPLING_PERIOD_MS / 1000.0);
    CNT = 0;

    I2C_SEND = true;

    TIMER_ELAPSED_MS = 0;
  }
}

// ENCODER
ISR(PCINT1_vect) {
  if(PINC & B00000001) CNT++;
}

// SERVO
ISR(PCINT0_vect) {
  CURR_SERVO_TIMER = micros();
  if(PINB & B00000001){
    PREV_SERVO_TIMER = CURR_SERVO_TIMER;
  }
  else{
    MEAS_SERVO_COUNT = CURR_SERVO_TIMER - PREV_SERVO_TIMER;
    CURR_SERVO_TIMER = 0;
    PREV_SERVO_TIMER = 0;
  }
}

// MOTOR
ISR(PCINT2_vect) {
  CURR_MOTOR_TIMER = micros();
  if(PIND & B10000000){
    PREV_MOTOR_TIMER = CURR_MOTOR_TIMER;
  }
  else{
    MEAS_MOTOR_COUNT = CURR_MOTOR_TIMER - PREV_MOTOR_TIMER;
    CURR_MOTOR_TIMER = 0;
    PREV_MOTOR_TIMER = 0;
  }
}

void serialEvent(){
  while(Serial.available()) Serial.read();

  int ANGLE = MEAS_SERVO_COUNT != 0 ? int(ANGLE_CONV_PROD_CONST * (MEAS_SERVO_COUNT) + ANGLE_CONV_ADD_CONST) : 0;

  char str[100];
  sprintf(str, "%c %d %d %d %d", OPERATING_MODE == AUTO_MODE ? 'A' : 'M', SPEED, ANGLE, MEAS_MOTOR_COUNT, MEAS_SERVO_COUNT);
  Serial.println(str);

  MEAS_SERVO_COUNT = 0;
  MEAS_MOTOR_COUNT = 0;
}

void send_i2c_speed_message(){
  if(!I2C_SEND) return;

  char speed_str[10];
  itoa(SPEED, speed_str, 10);

  Wire.beginTransmission(I2C_ID);
  Wire.write(speed_str);
  Wire.endTransmission();

  I2C_SEND = false;
}

void init_timer(){
  TCCR2A = _BV(WGM21);
  TCCR2B =  _BV(CS22) | _BV(CS20);
  OCR2A = 124;
  TIMSK2 = (1 << OCIE2A);
}

void init_pin_change_interrupt(){
  PCICR |= (1 << PCIE0); // SERVO
  PCICR |= (1 << PCIE1); // ENCODER
  PCICR |= (1 << PCIE2); // MOTOR

  PCMSK0 |= (1 << PCINT0); // SERVO
  PCMSK1 |= (1 << PCINT8); // ENCODER
  PCMSK2 |= (1 << PCINT23); // MOTOR
}

void set_operating_mode(){
  OPERATING_MODE = (PIND & B00000100);
}
