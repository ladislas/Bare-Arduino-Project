#include <Arduino.h>
#include "MySecondLib.h"

/**
 * @file MyFirstLib.cpp
 * @author Ladislas de Toldi
 * @version 1.0
 */

MySecondClass::MySecondClass() {
	// initialize variables
}

void MySecondClass::methodCallNumberOne() const {
	// call MyFirstObject methode
	MyFirstObject.methodNumberOne();
}

void MySecondClass::methodCallNumberTwo() const {
	// call MyFirstObject methode
	MyFirstObject.methodNumberTwo();
}
