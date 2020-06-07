/**
 * The MySensors Arduino library handles the wireless radio link and protocol
 * between your home built sensors/actuators and HA controller of choice.
 * The sensors forms a self healing radio network with optional repeaters. Each
 * repeater and gateway builds a routing tables in EEPROM which keeps track of the
 * network topology allowing messages to be routed to nodes.
 *
 * Created by Henrik Ekblad <henrik.ekblad@mysensors.org>
 * Copyright (C) 2013-2015 Sensnology AB
 * Full contributor list: https://github.com/mysensors/Arduino/graphs/contributors
 *
 * Documentation: http://www.mysensors.org
 * Support Forum: http://forum.mysensors.org
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * version 2 as published by the Free Software Foundation.
 *
 *******************************
 *
 * DESCRIPTION
 *
 * Example sketch showing how to send in DS1820B OneWire temperature readings back to the controller
 * http://www.mysensors.org/build/temp
 */


// Enable debug prints to serial monitor
#define MY_DEBUG 

// Enable and select radio type attached
#define MY_RADIO_RF24
//#define MY_RADIO_RFM69

#define MY_NODE_ID 2
//#define MY_PARENT_NODE_ID 1
//#define MY_PARENT_NODE_IS_STATIC

#include <MySensors.h>  
#include <DHT.h>

// Set this to the pin you connected the DHT's data pin to
#define DHT_DATA_PIN 4                                                                                                                                                                                                                                                                           

// Set this offset if the sensor has a permanent small offset to the real temperatures.
// In Celsius degrees (as measured by the device)
#define SENSOR_TEMP_OFFSET 0
#include <Adafruit_BMP085.h>

/*************************************************** 
  This is an example for the BMP085 Barometric Pressure & Temp Sensor

  Designed specifically to work with the Adafruit BMP085 Breakout 
  ----> https://www.adafruit.com/products/391

  These displays use I2C to communicate, 2 pins are required to  
  interface
  Adafruit invests time and resources providing this open source code, 
  please support Adafruit and open-source hardware by purchasing 
  products from Adafruit!

  Written by Limor Fried/Ladyada for Adafruit Industries.  
  BSD license, all text above must be included in any redistribution
 ****************************************************/

// Connect VCC of the BMP085 sensor to 3.3V (NOT 5.0V!)
// Connect GND to Ground
// Connect SCL to i2c clock - on '168/'328 Arduino Uno/Duemilanove/etc thats Analog 5
// Connect SDA to i2c data - on '168/'328 Arduino Uno/Duemilanove/etc thats Analog 4
// EOC is not used, it signifies an end of conversion
// XCLR is a reset pin, also not used here

// Sleep time between sensor updates (in milliseconds)
// Must be >1000ms for DHT22 and >2000ms for DHT11
static const uint64_t UPDATE_INTERVAL = 3000;

// Force sending an update of the temperature after n sensor reads, so a controller showing the
// timestamp of the last update doesn't show something like 3 hours in the unlikely case, that
// the value didn't change since;
// i.e. the sensor would force sending an update every UPDATE_INTERVAL*FORCE_UPDATE_N_READS [ms]
static const uint8_t FORCE_UPDATE_N_READS = 10;

#define CHILD_ID_HUM 0
#define CHILD_ID_TEMP 1
#define CHILD_ID_TEMPBMP 2
#define CHILD_ID_PRESSURE 3
#define CHILD_ID_ALTITUDE 4

float lastTemp;
float lastHum;
float lastTempBMP;
float lastPressure;
uint8_t nNoUpdatesTemp=0;
uint8_t nNoUpdatesHum=0;
uint8_t nNoUpdatesTempBMP=0;
uint8_t nNoUpdatesPressure=0;
bool metric = true;

MyMessage msgHum(CHILD_ID_HUM, V_HUM);
MyMessage msgTemp(CHILD_ID_TEMP, V_TEMP);
MyMessage msgTempBMP(CHILD_ID_TEMPBMP, V_TEMP);
MyMessage msgPressure(CHILD_ID_PRESSURE, V_PRESSURE);
MyMessage msgAltitude(CHILD_ID_ALTITUDE, V_POSITION);

int BATTERY_SENSE_PIN = A0;  // select the input pin for the battery sense point
int oldBatteryPcnt = 0;

Adafruit_BMP085 bmp;
DHT dht;

void before()
{

}


void setup()  
{ 
  dht.setup(DHT_DATA_PIN); // set data pin of DHT sensor
  if (UPDATE_INTERVAL <= dht.getMinimumSamplingPeriod()) {
#ifdef MY_LOCAL_DEBUG    
    Serial.println("Warning: UPDATE_INTERVAL is smaller than supported by the sensor!");
#endif    
  }
  // Sleep for the time of the minimum sampling period to give the sensor time to powesr up
  // (otherwise, timeout errors might occure for the first reading)
  sleep(dht.getMinimumSamplingPeriod());

  // use the 1.1 V internal reference for the Battery
#if defined(__AVR_ATmega2560__)
    analogReference(INTERNAL1V1);
#else
    analogReference(INTERNAL);
#endif  
  if (!bmp.begin()) {
#ifdef MY_LOCAL_DEBUG     
	Serial.println("Could not find a valid BMP085 sensor, check wiring!");
#endif
  }  
}  

void presentation() {
  // Send the sketch version information to the gateway and Controller
  sendSketchInfo("Frame Node", "1.0");

  // Register all sensors to gw (they will be created as child devices)
  present(CHILD_ID_HUM, S_HUM);
  present(CHILD_ID_TEMP, S_TEMP);
  present(CHILD_ID_TEMPBMP, S_TEMP);
  present(CHILD_ID_PRESSURE, S_BARO);
  present(CHILD_ID_ALTITUDE, S_GPS);

  metric = getControllerConfig().isMetric;
}

void loop()     
{     
  // Force reading sensor, so it works also after sleep()
  dht.readSensor(true);

  // Get temperature from DHT library
  float temperature = dht.getTemperature();
  if (isnan(temperature)) {
#ifdef MY_LOCAL_DEBUG    
    Serial.println("Failed reading temperature from DHT!");
#endif    
  } else if (temperature != lastTemp || nNoUpdatesTemp == FORCE_UPDATE_N_READS) {
    // Only send temperature if it changed since the last measurement or if we didn't send an update for n times
    lastTemp = temperature;

    // apply the offset before converting to something different than Celsius degrees
    temperature += SENSOR_TEMP_OFFSET;

    if (!metric) {
      temperature = dht.toFahrenheit(temperature);
    }
    // Reset no updates counter
    nNoUpdatesTemp = 0;
    send(msgTemp.set(temperature, 1));

#ifdef MY_LOCAL_DEBUG
    Serial.print("T: ");
    Serial.println(temperature);
#endif
  } else {
    // Increase no update counter if the temperature stayed the same
    nNoUpdatesTemp++;
  }

  // Get humidity from DHT library
  float humidity = dht.getHumidity();
  if (isnan(humidity)) {
#ifdef MY_LOCAL_DEBUG    
    Serial.println("Failed reading humidity from DHT");
#endif    
  } else if (humidity != lastHum || nNoUpdatesHum == FORCE_UPDATE_N_READS) {
    // Only send humidity if it changed since the last measurement or if we didn't send an update for n times
    lastHum = humidity;
    // Reset no updates counter
    nNoUpdatesHum = 0;
    send(msgHum.set(humidity, 1));

#ifdef MY_LOCAL_DEBUG
    Serial.print("H: ");
    Serial.println(humidity);
#endif
  } else {
    // Increase no update counter if the humidity stayed the same
    nNoUpdatesHum++;
  }

  int sensorValue = analogRead(BATTERY_SENSE_PIN);
  // 1M, 470K divider across battery and using internal ADC ref of 1.1V
  // Sense point is bypassed with 0.1 uF cap to reduce noise at that point
  // ((1e6+470e3)/470e3)*1.1 = Vmax = 3.44 Volts
  // 3.44/1023 = Volts per bit = 0.003363075

  int batteryPcnt = sensorValue / 10;

#ifdef MY_DEBUG
  Serial.print("Battery SensorValue: ");
  Serial.println(sensorValue);
  float batteryV  = sensorValue * 0.003363075;
  Serial.print("Battery Voltage: ");
  Serial.print(batteryV);
  Serial.println(" V");

  Serial.print("Battery percent: ");
  Serial.print(batteryPcnt);
  Serial.println(" %");
#endif

  if (oldBatteryPcnt != batteryPcnt) {
      // Power up radio after sleep
      sendBatteryLevel(batteryPcnt);
      oldBatteryPcnt = batteryPcnt;
  }

  // Get temperature from BMP library
  float temperatureBMP = bmp.readTemperature();
  if (isnan(temperatureBMP)) {
#ifdef MY_LOCAL_DEBUG    
    Serial.println("Failed reading temperatureBMP from BMP!");
#endif    
  } else if (temperatureBMP != lastTempBMP || nNoUpdatesTempBMP == FORCE_UPDATE_N_READS) {
    // Only send temperatureBMP if it changed since the last measurement or if we didn't send an update for n times
    lastTempBMP = temperatureBMP;

    // Reset no updates counter
    nNoUpdatesTempBMP = 0;
    send(msgTempBMP.set(temperatureBMP, 1));

#ifdef MY_LOCAL_DEBUG
    Serial.print("T: ");
    Serial.println(temperatureBMP);
#endif
  } else {
    // Increase no update counter if the temperature stayed the same
    nNoUpdatesTempBMP++;
  }
    

  // Get pressure from BHP library
  float pressure = bmp.readPressure();
  int altitude = bmp.readAltitude();
  float sealevelPressure = bmp.readSealevelPressure();
  if (isnan(pressure)) {
#ifdef MY_LOCAL_DEBUG    
    Serial.println("Failed reading pressure from BMP!");
#endif    
  } else if (pressure != lastPressure || nNoUpdatesPressure == FORCE_UPDATE_N_READS) {
    // Only send temperature if it changed since the last measurement or if we didn't send an update for n times
    lastPressure = pressure;

    // Reset no updates counter
    nNoUpdatesPressure = 0;
    Serial.print(altitude);

    send(msgPressure.set(pressure, 1));
    Serial.print(altitude);
    char payloadAltitude [15];
    sprintf(payloadAltitude, "0;0;%d", altitude);
    send(msgAltitude.set(payloadAltitude));
#ifdef MY_LOCAL_DEBUG
    Serial.print("Pressure = ");
    Serial.print(pressure);
    Serial.println(" Pa");
    // Calculate altitude assuming 'standard' barometric
    // pressure of 1013.25 millibar = 101325 Pascal
    Serial.print("Altitude = ");
    Serial.print(altitude);
    Serial.println(" meters");

    Serial.print("Pressure at sealevel (calculated) = ");
    Serial.print(sealevelPressure());
    Serial.println(" Pa");

#endif
  } else {
    // Increase no update counter if the temperature stayed the same
    nNoUpdatesPressure++;
  }

  sleep(UPDATE_INTERVAL);
}