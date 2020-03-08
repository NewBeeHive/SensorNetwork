//#define _DEBUG
#ifdef _DEBUG
#include <app_api.h>
#include <avr8-stub.h>



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
const int sensorPin=A0;
const float baselineTemp = 20.0;
// the setup function runs once when you press reset or power the board
void setup() {
#ifdef _DEBUG
  debug_init();
#else  
  Serial.begin(115200);
#endif
  // initialize digital pin LED_BUILTIN as an output.
  for (int pinNumber=3;pinNumber<6;pinNumber++)
  {
    pinMode(pinNumber, OUTPUT);
    digitalWrite(pinNumber, LOW);
  }
}

// the loop function runs over and over again forever
void loop() {
  float sensorVal= 0.0;
  sensorVal=analogRead(sensorPin);   // Get the Sensor Value
#ifndef _DEBUG
  Serial.print("Sensor Value: ");
  Serial.print(sensorVal);
#endif
  float voltage = (sensorVal/1024.0) * 5.0;
#ifndef _DEBUG
  Serial.print(". Volts: ");
  Serial.print(voltage);
#endif
  float temperature = (voltage - 0.5) * 100;
#ifndef _DEBUG
  Serial.print(". Temperature: ");
  Serial.println(temperature);
#endif
  if (temperature < baselineTemp+2)
  {
    digitalWrite(3, HIGH);
    digitalWrite(4, LOW);
    digitalWrite(5, LOW);
  }
  else if (temperature>=baselineTemp && temperature<baselineTemp+3)
  {
    digitalWrite(3, HIGH);
    digitalWrite(4, HIGH);
    digitalWrite(5, LOW);
  }
  else
  {

    digitalWrite(3, HIGH);
    digitalWrite(4, HIGH);
    digitalWrite(5, HIGH);
  }
  
  delay(1000);                       // wait for a  second
}
