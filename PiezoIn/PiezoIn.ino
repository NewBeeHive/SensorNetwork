//Henry's Bench
//Arduino Sound Detection Sensor Module

void setup ()
{
  Serial.begin(115200); 
}
int ar[256];

void loop ()
{

    ar[0]=analogRead(A0);


    Serial.println(ar[0]);
    delay(10);

    
}
