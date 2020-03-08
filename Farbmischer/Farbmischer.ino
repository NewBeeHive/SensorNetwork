//#define _DEBUG
#ifdef _DEBUG
#include <app_api.h>
#include <avr8-stub.h>
#endif

/*
MEGA and ZERO
  it is attached to digital pin 13, on MKR1000 on pin 6. LED_BUILTIN is set to
  the correct LED pin independent of which board is used.
  If you want to know what pin the on-board LED is connected to on your Arduino
  model, check the Technical Specs of your board at:
  https://www.arduino.cc/en/Main/Products

  modified 8 May 2014
  by Scott Fitzgerald
  modified 2 Sep 2016
  by Arturo Guadalupi
  modified 8 Sep 2016
  by Colby Newman

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/Blink
*/
const int redSensorPin=A0;
const int greenSensorPin=A1;
const int blueSensorPin=A2;
const int greenLEDPin=12;
const int blueLEDPin=11;
const int redLEDPin=10;

int redSensorValue=0;
int greenSensorValue=0;
int blueSensorValue=0;

int redValue=0;
int greenValue=0;
int blueValue=0;

// the setup function runs once when you press reset or power the board
void setup() {
#ifdef _DEBUG
  debug_init();
#else  
  Serial.begin(115200);
#endif
  // initialize digital pin LED_BUILTIN as an output.
  for (int pinNumber=10;pinNumber<13;pinNumber++)
  {
    pinMode(pinNumber, OUTPUT);
  analogWrite(pinNumber, 0);
  }
}

// the loop function runs over and over again forever
void loop() {
  float sensorVal= 0.0;
  redSensorValue=analogRead(redSensorPin);   // Get the Sensor Value for red
  delay(5);
  greenSensorValue=analogRead(greenSensorPin);   // Get the Sensor Value for green
  delay(5);
  blueSensorValue=analogRead(blueSensorPin);   // Get the Sensor Value for blue
  delay(5);
#ifndef _DEBUG
  Serial.print("Raw Sensor Values:\tRed: ");
  Serial.print(redSensorValue);
  Serial.print("\tGreen: ");
  Serial.print(greenSensorValue);
  Serial.print("\tBlue: ");
  Serial.println(blueSensorValue);
#endif
  redValue = redSensorValue/4;
  blueValue = blueSensorValue/4;
  greenValue = greenSensorValue/4;
#ifndef _DEBUG
  Serial.print("Mapped Sensor Values:\tRed: ");
  Serial.print(redValue);
  Serial.print("\tGreen: ");
  Serial.print(greenValue);
  Serial.print("\tBlue: ");
  Serial.println(blueValue);
#endif
  analogWrite(redLEDPin, redValue);
  analogWrite(greenLEDPin, greenValue);
  analogWrite(blueLEDPin, blueValue);
  delay(10);
}
