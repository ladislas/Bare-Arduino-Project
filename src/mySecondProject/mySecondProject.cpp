#include <Arduino.h>
#include "MySecondLib.h"

MySecondClass MySecondObject;

void setup() {

	Serial.begin(115200);
	delay(1000);

}

void loop() {

	MySecondObject.methodCallNumberOne();
	delay(1000);
	MySecondObject.methodCallNumberTwo();
	delay(1000);

}

