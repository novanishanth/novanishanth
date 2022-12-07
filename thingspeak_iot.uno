#include <ESP8266WiFi.h>;
#include <WiFiClient.h>;
#include <ThingSpeak.h>;

const char* ssid = "Pavi"; 
const char* password = "01pavi01"; 
int val;
int LDRpin = A0; 

WiFiClient client;
unsigned long myChannelNumber = 1901346; 
const char * myWriteAPIKey = "JI5VH8M16JUMQWAZ"; 

void setup()
{
Serial.begin(115200);
delay(10);
WiFi.begin(ssid, password);
ThingSpeak.begin(client);
}

void loop()
{
val = analogRead(LDRpin); 
Serial.println(val); 
delay(1000);
ThingSpeak.writeField(myChannelNumber, 1,val, myWriteAPIKey); 
delay(100);
}
