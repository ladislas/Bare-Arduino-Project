#include <Arduino.h>
#include "BarLib.h"

/**
 * @file BarLib.cpp
 * @author Ladislas de Toldi
 * @version 1.0
 */

BarClass::BarClass() {
	// initialize variables
}

void BarClass::firstBarMethod() const {
	// call FooObject methode
	FooObject.firstFooMethod();
}

void BarClass::secondBarMethod() const {
	// call FooObject methode
	FooObject.secondFooMethod();
}
