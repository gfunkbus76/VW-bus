// CAN Send Example
//

#include <mcp_can.h> //coryjfowler build
#include <SPI.h>
#include <max6675.h>

MCP_CAN CAN0(53);     // Set CS to pin 10

// Settings for MAX6675 EGT
int thermoDO = 4;
int thermoCS = 5;
int thermoCLK = 6;
MAX6675 thermocouple(thermoCLK, thermoCS, thermoDO);
int vccPin = 3;
int gndPin = 2;

void setup()
{
  Serial.begin(115200);

  // EGT Stuff - power direct to 5v and GND then eliminate this?
  pinMode(vccPin, OUTPUT); digitalWrite(vccPin, HIGH);
  pinMode(gndPin, OUTPUT); digitalWrite(gndPin, LOW);

  // Initialize MCP2515 running at 8MHz with a baudrate of 500kb/s and the masks and filters disabled.
  if (CAN0.begin(MCP_ANY, CAN_500KBPS, MCP_8MHZ) == CAN_OK) Serial.println("MCP2515 Initialized Successfully!");
  else Serial.println("Error Initializing MCP2515...");

  CAN0.setMode(MCP_NORMAL);   // Change to normal mode to allow messages to be transmitted
  delay(500);
}

//byte data[8] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07};
unsigned char canMsg1[8] = {0, 0, 0, 0, 0, 0, 0, 0};
unsigned char canMsg2[8] = {0, 0, 0, 0, 0, 0, 0, 0};

void loop()
{ int32_t egtDataF = (thermocouple.readFahrenheit());
  int32_t egtDataC = (thermocouple.readCelsius());

  canMsg1[0] = egtDataF;
  canMsg1[1] = egtDataF >> 8;
  canMsg1[2] = egtDataF >> 16;
  canMsg1[3] = egtDataC;
  canMsg1[4] = egtDataC >> 8;
  canMsg1[5] = egtDataC >> 16;

  // send data:  ID = 0x100, Standard CAN Frame, Data length = 8 bytes, 'data' = array of data bytes to send
  byte sndStat = CAN0.sendMsgBuf(0x100, 0, 8, canMsg1);
  if (sndStat == CAN_OK) {
    Serial.println("Message Sent Successfully!");
  } else {
    Serial.println("Error Sending Message...");
  }

  Serial.print("F = ");
  Serial.println(egtDataF);//Print for debug
  Serial.print("C = ");
  Serial.println(egtDataC);//Print for debug
  // Serial.println(thermocouple.readFahrenheit());
  delay(500);

}

/*********************************************************************************************************
  END FILE
*********************************************************************************************************/
