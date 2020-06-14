
/*
 * Interfacing Arduino with BME280 temperature, humidity and pressure sensor.
 * Temperature, humidity and pressure values are displayed on 20x4 LCD.
 * This is a free software with NO WARRANTY.
 * https://simple-circuit.com/
 */
 
#include <Wire.h>             // include Wire library, required for I2C devices
#include <Adafruit_Sensor.h>  // include Adafruit sensor library
#include <Adafruit_BME280.h>  // include adafruit library for BME280 sensor
#include <LiquidCrystal.h>    // include LCD library
 
// define device I2C address: 0x76 or 0x77 (0x77 is library default address)
#define BME280_I2C_ADDRESS  0x76
#define LCD_ON_OFF  8

Adafruit_BME280 bme280;
 
// LCD module connections (RS, E, D4, D5, D6, D7)
LiquidCrystal lcd(2, 3, 4, 5, 6, 7);
 
void setup()
{
  Serial.begin(9600);
 
  // set up the LCD's number of columns and rows
  lcd.begin(20, 4);

  pinMode(LCD_ON_OFF, INPUT);    // sets the digital pin 7 as input
  
  Serial.println(F("Arduino + BME280 sensor"));
  
  if (!bme280.begin(BME280_I2C_ADDRESS))
  {  
    Serial.println("Could not find a valid BME280 sensor, check wiring!");
    //while (1);
  }
 

}
 
 char text[13]; 
 void loop1 ()
 {

  byte error, address; //variable for error and I2C address
  int nDevices;

  Serial.println("Scanning...");

  nDevices = 0;
  for (address = 1; address < 127; address++ )
  {
    // The i2c_scanner uses the return value of
    // the Write.endTransmisstion to see if
    // a device did acknowledge to the address.
    Wire.beginTransmission(address);
    error = Wire.endTransmission();

    if (error == 0)
    {
      Serial.print("I2C device found at address 0x");
      if (address < 16)   Serial.print("0");
      Serial.print(address, HEX);
      Serial.println("  !");
      nDevices++;
    }
    else if (error == 4)
    {
      Serial.print("Unknown error at address 0x");
      if (address < 16)
        Serial.print("0");
      Serial.println(address, HEX);
    }
  }
  if (nDevices == 0)
    Serial.println("No I2C devices found\n");
  else
    Serial.println("done\n");

  delay(5000); // wait 5 seconds for the next I2C scan
  } 
// main loop
void loop()
{
  static int i=0;
  if (i<-3) i=0;
  // get temperature, pressure and altitude from library
  float temperature = bme280.readTemperature();  // get temperature
  float humidity    = bme280.readHumidity();     // get humidity
  float pressure    = bme280.readPressure();     // get pressure
  float altitude_   = bme280.readAltitude(1013.25); // get altitude (this should be adjusted to your local forecast)
  int val = digitalRead(LCD_ON_OFF);
  if (val)
  {
    lcd.display();
    lcd.clear();
    lcd.setCursor(2, (i%2));
    lcd.print("Arduino + BME280");
    lcd.setCursor(0, (i+1));
    lcd.print("Temp =");
    lcd.setCursor(0, (i+2));
    lcd.print("Humi =");
    lcd.setCursor(0, (i+3));
    lcd.print("Pres =");
    lcd.setCursor(0, (i+4));
    lcd.print("Alt  =");  
    // print data on the LCD screen
    // 1: print temperature
    sprintf(text, "%d.%02u%cC  ", (int)temperature, (int)(temperature * 100)%100, 223);
    lcd.setCursor(7, (i+1));
    lcd.print(text);
    // 2: print humidity
    sprintf(text, "%d.%02u %%  ", (int)humidity, (int)(humidity * 100)%100);
    lcd.setCursor(7, (i+2));
    lcd.print(text);
    // 3: print pressure
    sprintf(text, "%u.%02u hPa ", (int)(pressure / 100), (int)((uint32_t)pressure % 100));
    lcd.setCursor(7, (i+3));
    lcd.print(text);
    // 4: print altitude
    sprintf(text, "%u.%02u m ", (int)(altitude_), (int)((uint32_t)altitude_ % 100));
    lcd.setCursor(7, (i+4));
    lcd.print(text);
    i--;
  }
  else
  {
    lcd.noDisplay();
  }
  

  // print data on the serial monitor software
  // 1: print temperature
  Serial.print("Temperature = ");
  Serial.print(temperature);
  Serial.println(" °C");
  // 1: print humidity
  Serial.print("Humidity    = ");
  Serial.print(humidity);
  Serial.println(" %");
  // 3: print pressure
  Serial.print("Pressure    = ");
  Serial.print(pressure / 100);
  Serial.println(" hPa");
  // 4: print altitude
  Serial.print("Approx Altitude = ");
  Serial.print(altitude_);
  Serial.println(" m");
    
  Serial.println();  // start a new line
  delay(2000);       // wait 2 seconds
  
}
// end of code.