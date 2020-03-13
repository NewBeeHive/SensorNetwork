#include <Servo.h>

//Henry's Bench
//Arduino Sound Detection Sensor Module

Servo myServo;

void setup ()
{
  Serial.begin(115200); 
  myServo.attach(9);
  myServo.write(180);
}
int ar[256];

void loop ()
{

  myServo.write(40);
  delay(1000);
  myServo.write(10);
  delay(1000);
  myServo.write(-10);
  delay(1000);
  myServo.write(-40);
  delay(1000);
  myServo.write(-90);
  delay(1000);  
      
}
