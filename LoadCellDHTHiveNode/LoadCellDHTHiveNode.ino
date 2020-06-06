/*
 *
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
 * REVISION HISTORY
 * Version 1.0: Henrik EKblad
 * Version 1.1 - 2016-07-20: Converted to MySensors v2.0 and added various improvements - Torben Woltjen (mozzbozz)
 * 
 * DESCRIPTION
 * This sketch provides an example of how to implement a humidity/temperature
 * sensor using a DHT11/DHT-22.
 *  
 * For more information, please visit:
 * http://www.mysensors.org/build/humidity
 * 
 */

// Enable debug prints
//#define MY_DEBUG
//#define MY_LOCAL_DEBUG

// Enable and select radio type attached 
////#define MY_RADIO_RF24
//#define MY_RADIO_RFM69
//#define MY_RS485
#define MY_RADIO_RF24
#define MY_RF24_PA_LEVEL RF24_PA_HIGH
//#define MY_GATEWAY_SERIAL 1

// Enabled repeater feature for this node
#define MY_REPEATER_FEATURE
#define MY_NODE_ID 1

#include <config.h>
#include <HX711_ADC.h>
#include <SPI.h>
#include <MySensors.h>  
#include <DHT.h>

// Set this to the pin you connected the DHT's data pin to
#define DHT_DATA_PIN 5                                                                                                                                                                                                                                                                           

// Set this offset if the sensor has a permanent small offset to the real temperatures.
// In Celsius degrees (as measured by the device)
#define SENSOR_TEMP_OFFSET 0

// Sleep time between sensor updates (in milliseconds)
// Must be >1000ms for DHT22 and >2000ms for DHT11
static const uint64_t UPDATE_INTERVAL = 10000;

// Force sending an update of the temperature after n sensor reads, so a controller showing the
// timestamp of the last update doesn't show something like 3 hours in the unlikely case, that
// the value didn't change since;
// i.e. the sensor would force sending an update every UPDATE_INTERVAL*FORCE_UPDATE_N_READS [ms]
static const uint8_t FORCE_UPDATE_N_READS = 10;

#define CHILD_ID_HUM 0
#define CHILD_ID_TEMP 1
#define CHILD_ID_WEIGHT 2

float lastTemp;
float lastHum;
float lastLoad;
uint8_t nNoUpdatesTemp=0;
uint8_t nNoUpdatesHum=0;
uint8_t nNoUpdatesLoad=0;
bool metric = true;

MyMessage msgHum(CHILD_ID_HUM, V_HUM);
MyMessage msgTemp(CHILD_ID_TEMP, V_TEMP);
MyMessage msgLoad(CHILD_ID_WEIGHT, V_WEIGHT);
DHT dht;

//-------------------------------------------------------------------------------------
// HX711_ADC.h
// Arduino master library for HX711 24-Bit Analog-to-Digital Converter for Weigh Scales
// Olav Kallhovd sept2017
// Tested with      : HX711 asian module on channel A and YZC-133 3kg load cell
// Tested with MCU  : Arduino Nano, ESP8266
//-------------------------------------------------------------------------------------
// This is an example sketch on how to use this library
// Settling time (number of samples) and data filtering can be adjusted in the config.h file

//#include <EEPROM.h>

const int HX711_dout = 3; //mcu > HX711 dout pin, must be external interrupt capable!
const int HX711_sck = 4; //mcu > HX711 sck pin

//HX711 constructor:
HX711_ADC LoadCell(HX711_dout, HX711_sck);
//HX711_ADC LoadCell(4, 5);

const int eepromAdress = 0;
boolean newDataReady = 0;
unsigned long t=0;


void presentation()  
{ 
  sendSketchInfo("HiveNode", "1.1");

  // Register all sensors to gw (they will be created as child devices)
  present(CHILD_ID_HUM, S_HUM);
  present(CHILD_ID_TEMP, S_TEMP);
  present(CHILD_ID_WEIGHT, S_WEIGHT);

  metric = getControllerConfig().isMetric;
}

void setup() {
  dht.setup(DHT_DATA_PIN); // set data pin of DHT sensor
  if (UPDATE_INTERVAL <= dht.getMinimumSamplingPeriod()) {
#ifdef MY_LOCAL_DEBUG    
    Serial.println("Warning: UPDATE_INTERVAL is smaller than supported by the sensor!");
#endif    
  }
  // Sleep for the time of the minimum sampling period to give the sensor time to powesr up
  // (otherwise, timeout errors might occure for the first reading)
  sleep(dht.getMinimumSamplingPeriod());

  float calValue; // calibration value
#ifdef MY_LOCAL_DEBUG 
  Serial.println(calValue); 
#endif
  calValue=loadState(eepromAdress);
#ifdef MY_LOCAL_DEBUG 
  Serial.println(calValue);   
  Serial.println();
  Serial.println("Starting...");
#endif  

  LoadCell.begin();
  long stabilisingtime = 2000; // tare preciscion can be improved by adding a few seconds of stabilising time
  LoadCell.start(stabilisingtime);
  if(LoadCell.getTareTimeoutFlag()) {
#ifdef MY_LOCAL_DEBUG    
    Serial.println("Tare timeout, check MCU>HX711 wiring and pin designations");
#endif    
  }
  else {
    LoadCell.setCalFactor(calValue); // set calibration value (float)
#ifdef MY_LOCAL_DEBUG    
    Serial.println("Startup + tare is complete");
#endif  
  }
  attachInterrupt(digitalPinToInterrupt(HX711_dout), dataReadyISR, FALLING);
}
static int count=0;
//interrupt routine:
void dataReadyISR() {
  count++;
  if (LoadCell.update()) {
    newDataReady = 1;
  }
}

void loop() {
  static long t = 0;
  static long sleepTime = 0;

  // Sleep for a while to save energy
  sleep(sleepTime);
  sleepTime = sleepTime + t - millis();
  if (sleepTime>0) 
  {
    return;
  }


#ifdef MY_LOCAL_DEBUG
#if !defined(MY_DEBUG)
  Serial.begin(115200); delay(10);
#endif
#endif
  static int delay=0;
#ifdef MY_LOCAL_DEBUG 
  Serial.print("Load_cell int count: ");
  Serial.println(count); 
#endif

    // get smoothed value from the dataset:
  if (newDataReady) {
    float load = LoadCell.getData();
    float loadDiff = fabs(load - lastLoad);
    nNoUpdatesLoad++;
    if ((loadDiff>10.0) || (nNoUpdatesLoad == FORCE_UPDATE_N_READS)) {
#ifdef MY_LOCAL_DEBUG      
    Serial.print("Load_cell output val: ");
    Serial.println(load);
#endif    
   
      nNoUpdatesLoad=0;
      send(msgLoad.set(load, 1));  
    }
    lastLoad = load;
  }

  //receive from serial terminal
  if (Serial.available() > 0) {
    char inByte = Serial.read();
    Serial.println(inByte);      
    if (inByte == 't') 
    {
      Serial.println("Tare start");      
      LoadCell.tareNoDelay();
    }
  }

  //check if last tare operation is complete
  if (LoadCell.getTareStatus() == true) {
    Serial.println("Tare complete");
  }  

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
    // >
#ifdef MY_LOCAL_DEBUG
    Serial.print("H: ");
    Serial.println(humidity);
#endif
  } else {
    // Increase no update counter if the humidity stayed the same
    nNoUpdatesHum++;
  }

  // Initialize Sleep for a while to save energy
  t = millis();
  sleepTime = UPDATE_INTERVAL;
  #if 0
  do {
    sleep(sleepTime);
    sleepTime = sleepTime + t - millis();
  } while (sleepTime>0);
  #endif
}
