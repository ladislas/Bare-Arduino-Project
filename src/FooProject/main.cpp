#include <Arduino.h>
#include <Wire.h>
#include "FooLib.h"

FooClass FooObject;

void setup() {

	Serial.begin(115200);
	delay(1000);

}

void loop() {

	Serial.println("Hello world");
	FooObject.firstFooMethod();
	delay(1000);
	FooObject.secondFooMethod();
	delay(1000);

}

