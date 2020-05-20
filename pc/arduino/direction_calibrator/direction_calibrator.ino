const byte SERVO_PIN = 10;

const unsigned int SERVO_LEFT_CNT = 1830;
const unsigned int SERVO_RIGHT_CNT = 1080;
const unsigned int SAMPLES = 15;
int CNT_DELTA = (SERVO_LEFT_CNT - SERVO_RIGHT_CNT) / SAMPLES;

unsigned int SERVO_CURR_CNT = SERVO_RIGHT_CNT;

const unsigned long BAUD_RATE = 2000000;
const unsigned int TIMER_TOP_COUNT = 20000;

void setup() {
  pinMode(SERVO_PIN, OUTPUT);

  Serial.begin(BAUD_RATE);

  init_pwm_timer();

  set_servo_pwm();
}

void loop() {}

void serialEvent() {
  while(Serial.available()){
    Serial.read();
  }
  set_servo_pwm();
}

void init_pwm_timer() {
  TCCR1A = _BV(COM1A1) | _BV(COM1B1) | _BV(WGM11);
  TCCR1B = _BV(WGM13) | _BV(CS11);
  ICR1 = TIMER_TOP_COUNT;
}

void set_servo_pwm() {
  Serial.println(String(SERVO_CURR_CNT));
  OCR1B = SERVO_CURR_CNT;
  if(SERVO_CURR_CNT + CNT_DELTA > SERVO_LEFT_CNT || SERVO_CURR_CNT + CNT_DELTA < SERVO_RIGHT_CNT) CNT_DELTA = -CNT_DELTA;
  SERVO_CURR_CNT = SERVO_CURR_CNT + CNT_DELTA;
}
