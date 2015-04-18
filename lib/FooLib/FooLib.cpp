#include <Arduino.h>
#include "FooLib.h"

/**
 * @file FooLib.cpp
 * @author Ladislas de Toldi
 * @version 1.0
 */

FooClass::FooClass() {
	// initialize variables
	_variableOne = 2;
	_variableTwo = 3;
}

void FooClass::firstFooMethod() const {
	// print variable one
	Wire.begin();
	Serial.println(_variableOne);
}

void FooClass::secondFooMethod() const {
	// print variable one
	Serial.println(_variableTwo);
}
