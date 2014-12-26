#include <Arduino.h>
#include "MyFirstLib.h"

/**
 * @file MyFirstLib.cpp
 * @author Ladislas de Toldi
 * @version 1.0
 */

MyFirstClass::MyFirstClass() {
	// initialize variables
	_variableOne = 2;
	_variableTwo = 3;
}

void MyFirstClass::methodNumberOne() const {
	// print variable one
	Serial.println(_variableOne);
}

void MyFirstClass::methodNumberTwo() const {
	// print variable one
	Serial.println(_variableTwo);
}
