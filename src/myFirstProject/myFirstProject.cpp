#include <Arduino.h>
#include "MyFirstLib.h"

MyFirstClass MyFirstObject;

void setup() {

	Serial.begin(115200);
	delay(1000);

}

void loop() {

	MyFirstObject.methodNumberOne();
	delay(1000);
	MyFirstObject.methodNumberTwo();
	delay(1000);

}

