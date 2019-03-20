#include <Arduino.h>
#include <Wire.h>
#include "BarLib.h"
#include "FooLib.h"

BarClass BarObject;

void setup() {

	Serial.begin(115200);
	delay(1000);

}

void loop() {

	BarObject.firstBarMethod();
	delay(1000);
	BarObject.secondBarMethod();
	delay(1000);

}

