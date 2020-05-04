#include "Arduino.h"
#include "Wire.h"
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

	addFunctionReference(2, 40, Serial);
	delay(loopDelay);

	addFunctionPointer(40, 2, &Serial);
	delay(loopDelay);

}

