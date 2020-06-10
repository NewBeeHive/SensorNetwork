#define PINOUT 2

// Initial Sequence
void setup() {
    Serial.begin(112500);
    pinMode(PINOUT, OUTPUT);
    return;
}
 
// Loop forever
void loop() {
   
    Serial.println("AN");       //Print out what frequency is the most dominant.
    digitalWrite(PINOUT, HIGH); // sets the digital pin 13 on
    delay(1000);                // waits for a second

    Serial.println("AUS");      //Print out what frequency is the most dominant.
    digitalWrite(PINOUT, LOW);  // sets the digital pin 13 off
    delay(1000);                // waits for a second
}