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
#define MY_DEBUG
#define MY_LOCAL_DEBUG

// Enable and select radio type attached 
////#define MY_RADIO_RF24
//#define MY_RADIO_RFM69
//#define MY_RS485
#define MY_RADIO_RF24
#define MY_RF24_PA_LEVEL RF24_PA_HIGH
//#define MY_GATEWAY_SERIAL 1

// Enabled repeater feature for this node
//#define MY_REPEATER_FEATURE
#define MY_NODE_ID 1

#include <config.h>
#include <HX711_ADC.h>
#include <SPI.h>
#include <MySensors.h>  
#include <DallasTemperature.h>
#include <OneWire.h>
//#include "arduinoFFT.h"

#define COMPARE_TEMP 0 // Send temperature only if changed? 1 = Yes 0 = No

const int HX711_dout = 3; //mcu > HX711 dout pin, must be external interrupt capable!
const int HX711_sck = 4; //mcu > HX711 sck pin
#define ONE_WIRE_BUS 5 // Pin where dallase sensor is connected 

int SAMPLING_PIN = A0;  // select the input pin for the Sound sense point

#define MAX_ATTACHED_DS18B20 3
unsigned long SLEEP_TIME = 10000; // Sleep time between reads (in milliseconds)
OneWire oneWire(ONE_WIRE_BUS); // Setup a oneWire instance to communicate with any OneWire devices (not just Maxim/Dallas temperature ICs)
DallasTemperature sensors(&oneWire); // Pass the oneWire reference to Dallas Temperature. 
float lastTemperature[MAX_ATTACHED_DS18B20];
int numSensors;
bool receivedConfig = false;
bool metric = true;

// Set this offset if the sensor has a permanent small offset to the real temperatures.
// In Celsius degrees (as measured by the device)
#define SENSOR_TEMP_OFFSET 0

// Sleep time between sensor updates (in milliseconds)
// Must be >1000ms for DHT22 and >2000ms for DHT11
static const uint64_t UPDATE_INTERVAL = 3000;

// Force sending an update of the temperature after n sensor reads, so a controller showing the
// timestamp of the last update doesn't show something like 3 hours in the unlikely case, that
// the value didn't change since;
// i.e. the sensor would force sending an update every UPDATE_INTERVAL*FORCE_UPDATE_N_READS [ms]
static const uint8_t FORCE_UPDATE_N_READS = 10;

#define CHILD_ID_WEIGHT MAX_ATTACHED_DS18B20
#define CHILD_ID_SOUND_SAMPLE (MAX_ATTACHED_DS18B20 +1)

float lastLoad;

uint8_t nNoUpdatesLoad=0;

// Initialize  messages
MyMessage msgTemp(0,V_TEMP);
MyMessage msgLoad(CHILD_ID_WEIGHT, V_WEIGHT);
MyMessage soundSample(CHILD_ID_SOUND_SAMPLE, V_TEXT);	// message for Sending Text to Controller


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



//HX711 constructor:
HX711_ADC LoadCell(HX711_dout, HX711_sck);

//Sound
#define SOUND_SAMPLES 128        //Must be a power of 2
#define SAMPLING_FREQUENCY 5000 //Hz, must be less than 10000 due to ADC
#define SAMPLING_SERIE 100      // 100 Series per wakeup

//arduinoFFT FFT = arduinoFFT();
 
unsigned int sampling_period_us;
unsigned long microseconds;
 
double vReal[SOUND_SAMPLES];
double vImag[SOUND_SAMPLES];

const int eepromAdress = 0;
boolean newDataReady = 0;
unsigned long t=0;
float calValue;


void presentation()  
{ 
  sendSketchInfo("HiveNode", "1.1");

  // Present all sensors to controller
  // Startup up the OneWire library
  sensors.begin();  

  // Fetch the number of attached temperature sensors  
  numSensors = sensors.getDeviceCount();
#ifdef MY_LOCAL_DEBUG 
  Serial.println("Number of temperature Sensors");   
  Serial.println(numSensors);
#endif  
  for (int i=0; i<numSensors && i<MAX_ATTACHED_DS18B20; i++) {   
     present(i, S_TEMP);
  }

  present(CHILD_ID_WEIGHT, S_WEIGHT);
  present(CHILD_ID_SOUND_SAMPLE, S_INFO);
  metric = getControllerConfig().isMetric;
}

void setup() 
{
#ifdef MY_LOCAL_DEBUG 
  Serial.println(calValue);   
  Serial.println();
  Serial.println("Starting...");
#endif  

  
  // requestTemperatures() will not block current thread
  sensors.setWaitForConversion(false);
  
  calValue=loadState(eepromAdress);

  //Sampling Sound    
  sampling_period_us = round(1000000*(1.0/SAMPLING_FREQUENCY));

  //LoadCell
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
  static bool samplingLoop = false;
  static int samplingCount=0;

  if (!samplingLoop)
  {
    samplingLoop = true;
  }
  else
  {
    /*SAMPLING*/
    for(int i=0; i<SOUND_SAMPLES; i++)
    {
        microseconds = micros();    //Overflows after around 70 minutes!
      
        vReal[i] = analogRead(SAMPLING_PIN);
        vImag[i] = 0;
      
        while(micros() < (microseconds + sampling_period_us)){
        }
    }

    /*FFT*/
    //FFT.Windowing(vReal, SOUND_SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
    //FFT.Compute(vReal, vImag, SOUND_SAMPLES, FFT_FORWARD);
    //FFT.ComplexToMagnitude(vReal, vImag, SOUND_SAMPLES);
   // double peak = FFT.MajorPeak(vReal, SOUND_SAMPLES, SAMPLING_FREQUENCY);

    /*PRINT RESULTS*/
    //Serial.println(peak);     //Print out what frequency is the most dominant.
    #define SOUND_SAMPLES_SEND 2
    char payload[(9*SOUND_SAMPLES_SEND)+1];
    send(soundSample.set(">>>"));
    for(int i=0; i<(SOUND_SAMPLES); i++)
    {
        sprintf(payload+((i%SOUND_SAMPLES_SENDlingCount<SAMPLING_SERIE)
    {
      samplingCount++;
      return;
    }
    else
    {
       samplingCount=0;
       samplingLoop = false;
    }
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

   // Fetch temperatures from Dallas sensors
  sensors.requestTemperatures();

  // query conversion time and sleep until conversion completed
  int16_t conversionTime = sensors.millisToWaitForConversion(sensors.getResolution());
  // sleep() call can be replaced by wait() call if node need to process incoming messages (or if node is repeater)
  ///sleep(conversionTime);

  // Read temperatures and send them to controller 
  for (int i=0; i<numSensors && i<MAX_ATTACHED_DS18B20; i++) {

    // Fetch and round temperature to one decimal
    float temperature = static_cast<float>(static_cast<int>((getControllerConfig().isMetric?sensors.getTempCByIndex(i):sensors.getTempFByIndex(i)) * 10.)) / 10.;
    // Only send data if temperature has changed and no error
    #if COMPARE_TEMP == 1
    if (lastTemperature[i] != temperature && temperature != -127.00 && temperature != 85.00) {
    #else
    if (temperature != -127.00 && temperature != 85.00) {
    #endif

      // Send in the new temsssssssperature
      send(msgTemp.setSensor(i).set(temperature,1));
      // Save new temperatures for next compare
      lastTemperature[i]=temperature;
    }
  }

  // Initialize Sleep for a while to save energy
  t = millis();
  sleepTime = UPDATE_INTERVAL;
  do {
    //sleep(sleepTime);
    sleep(digitalPinToInterrupt(2),CHANGE,sleepTime);
    sleepTime = sleepTime + t - millis();
  } while (sleepTime>0);


  
}
