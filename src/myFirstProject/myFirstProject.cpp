#include <Arduino.h>
#include "FooLib.h"

FooClass FooObject;

void setup() {

	Serial.begin(115200);
	delay(1000);

}

void loop() {

	FooObject.firstFooMethod();
	delay(1000);
	FooObject.secondFooMethod();
	delay(1000);

}

