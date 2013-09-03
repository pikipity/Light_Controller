#define LED 3
byte Head;
int Light;

void setup(){
  Serial.begin(9600);
  analogWrite(LED,0);
}

void loop(){
  while(Serial.available()>0){
    Head=Serial.read();
    if (Head=='H'){
      while(Serial.available()<=0){}
      Light=Serial.read();
      analogWrite(LED,Light);
    }
  }
}
