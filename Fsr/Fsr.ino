#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>


#define SERVER_IP "172.27.6.122"

#ifndef STASSID
#define STASSID "Supdeco Etudiant"//"Supdeco Etudiant"
#define STAPSK  "SupdecoEtude2018++"//"SupdecoEtude2018++"
#endif

int fsrAnalogPin = A0; 
int fsrReading;

void setup() {

  Serial.begin(115200);

  Serial.println();
  Serial.println();
  Serial.println();

  WiFi.begin(STASSID, STAPSK);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected! IP address: ");
  Serial.println(WiFi.localIP());

}

String postValue(int value) {
String response = "null";
  
  //if ((WiFi.status() == WL_CONNECTED)) {

    WiFiClient client;
    HTTPClient http;

    Serial.print("[HTTP] begin...\n");
    http.begin(client, "http://" SERVER_IP "/api/measures/actions/create.php"); //HTTP
    http.addHeader("Content-Type", "application/json");

    Serial.print("[HTTP] POST...\n");

    String str1 = "{\"value\":";
    String str2 = "}";
    String valStr = str1+value+str2;
    Serial.println(valStr);
    int httpCode = http.POST(valStr);
Serial.printf("[HTTP] POST... code: %d\n", httpCode);
   
    if (httpCode > 0) {
     
      if (httpCode == HTTP_CODE_OK) {
        const String& payload = http.getString();
        Serial.println("received payload:\n<<");
        Serial.println(payload);
        response = payload;
        Serial.println(">>");
      }
    

    http.end();
  }
  return response;
}

void loop(void) {
  fsrReading = analogRead(fsrAnalogPin);
  

  if(fsrReading > 40){
    Serial.print("Analog reading = ");
    Serial.print(fsrReading);
    Serial.println(postValue(fsrReading));
    
  }
  delay(1000);
}
