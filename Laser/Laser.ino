#include <Arduino.h>
#include <ArduinoJson.h>
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>

ESP8266WiFiMulti WiFiMulti;
#ifndef STASSID
#define STASSID "Supdeco Etudiant"
#define STAPSK  "SupdecoEtude2018++"
#endif
#define SERVER_IP  "http://172.27.6.122/api/measures/actions/"

int laserPin = 13;      // connect laser to pin D7
int laserDelay;
DynamicJsonDocument doc(512);

void setup(void) {
  Serial.begin(9600);   // We'll send debugging information via the Serial monitor
  pinMode(laserPin, OUTPUT);
  for (uint8_t t = 4; t > 0; t--) {
    Serial.printf("[SETUP] WAIT %d...\n", t);
    Serial.flush();
  }

  WiFi.mode(WIFI_STA);
  WiFiMulti.addAP(STASSID, STAPSK);
}

void loop(void) {
    
    int fsrReading;
    getValues();
    //int* values=readValues();
    size_t valuesArrSize=doc["data"].size();
    Serial.print("size: ");Serial.println(valuesArrSize);
    //Serial.print("Size valuesArrSize: ");Serial.println();
     for(size_t i = 0; i<valuesArrSize; i++){
      if(doc["data"][i]["fired"].as<int>()==0){
        
        fsrReading = doc["data"][i]["value"];
        
        if(fsrReading>20){
          Serial.print("Analog reading = ");Serial.print(fsrReading);
          laserDelay = map(fsrReading, 40, 1024, 0, 1000);
          Serial.print(" ");
          Serial.print(1000-laserDelay);
          Serial.print(" ");
          Serial.print("fire");
          digitalWrite(laserPin, HIGH);
          delay(laserDelay);
          digitalWrite(laserPin, LOW);
          delay(1000-laserDelay);
          feedback(doc["data"][i]["id"].as<int>());
          //analogWrite(laserPin,laserDelay);
          Serial.println();
        }
        
      }  
    }
  
  //delay(1000);
}

/*void deserializePayload(String input, doc ){
  DeserializationError error = deserializeJson(doc, input);

  if (error) {
    Serial.print(F("deserializeJson() failed: "));
    Serial.println(error.f_str());
  }
}*/

void getValues(){
  if ((WiFiMulti.run() == WL_CONNECTED)) {

    WiFiClient client;

    HTTPClient http;

    Serial.print("[HTTP] begin...\n");
    if (http.begin(client, SERVER_IP"/read.php")) {  // HTTP

      http.addHeader("Content-Type", "application/json");
      Serial.print("[HTTP] GET...\n");
      // start connection and send HTTP header
      int httpCode = http.GET();

      // httpCode will be negative on error
      if (httpCode > 0) {
        // HTTP header has been send and Server response header has been handled
        Serial.printf("[HTTP] GET... code: %d\n", httpCode);

        // file found at server
        if (httpCode == HTTP_CODE_OK || httpCode == HTTP_CODE_MOVED_PERMANENTLY) {
          String payload = http.getString();
          Serial.println(payload);
          DeserializationError error = deserializeJson(doc, payload);

          if (error) {
            Serial.print(F("deserializeJson() failed: "));
            Serial.println(error.f_str());
          }         
          
        }
      } else {
        Serial.printf("[HTTP] GET... failed, error: %s\n", http.errorToString(httpCode).c_str());
      }

      http.end();
    } else {
      Serial.printf("[HTTP} Unable to connect\n");
    }
    
  }
}

void feedback(int id){
  if ((WiFi.status() == WL_CONNECTED)) {

    WiFiClient client;
    HTTPClient http;

    Serial.print("[HTTP] begin...\n");
    // configure traged server and url
    http.begin(client,SERVER_IP "/laserUpdate.php"); //HTTP
    
    http.addHeader("Content-Type", "application/json");

    Serial.print("[HTTP] PUT...\n");
    // start connection and send HTTP header and body
    String str1 = "{\"id\":";
    String str2 = ",\"fired\":1}";
    String idStr = str1+id+str2 ;
    Serial.println(idStr);
    int httpCode = http.PUT(idStr);

    // httpCode will be negative on error
    if (httpCode > 0) {
      // HTTP header has been send and Server response header has been handled
      Serial.printf("[HTTP] PUT... code: %d\n", httpCode);

      // file found at server
      if (httpCode == HTTP_CODE_OK) {
        const String& payload = http.getString();
        Serial.println("received payload:\n<<");
        Serial.println(payload);
        Serial.println(">>");
      }
    } else {
      Serial.printf("[HTTP] PUT... failed, error: %s\n", http.errorToString(httpCode).c_str());
    }

    http.end();
  }
}

int* readValues(){
  size_t i = doc["data"].size();
  int result[i];
  for(size_t j = 0; j<i;j++){
    if((int)doc[j]["read"]==0){
      if((int)doc[j]["fired"]==0){
        result[j]=(int)doc[j]["value"];
      }      
    }
  }
  return result;
}
