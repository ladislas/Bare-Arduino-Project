#include <Arduino.h>
#include <Wire.h>

#include "Config.h"

void setup() {

	Serial.begin(115200);
	delay(loopDelay);

}

void loop() {

	BarObject.firstBarMethod();
	delay(loopDelay);
	BarObject.secondBarMethod();
	delay(loopDelay);

}

