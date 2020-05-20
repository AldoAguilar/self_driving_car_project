const byte ENCODER_PIN = A0;

const unsigned long BAUD_RATE = 2000000;

volatile int CNT = 0;


void setup(){
  pinMode(ENCODER_PIN, INPUT);

  Serial.begin(BAUD_RATE);
  
  init_pin_change_interrupt();

}

void loop(){}

void serialEvent(){
  while(Serial.available()){
    Serial.read();
  }
  Serial.println(String(CNT));
  CNT = 0;
}

void init_pin_change_interrupt(){
  PCICR |= (1 << PCIE1);
  PCMSK1 |= (1 << PCINT8);
}

ISR(PCINT1_vect) {
  if(PINC & B00000001) CNT++;
}
