#ifndef _CONFIG_H_
#define _CONFIG_H_

#include "Arduino.h"
#include "BarLib.h"

BarClass BarObject;

const int loopDelay = 1000;

int addFunctionReference(int a, int b, Stream & port){
	int sum = a + b;
	port.print("sum = ");
	port.println(sum);
	return a + b;
}

int addFunctionPointer(int a, int b, Stream * port){
	int sum = a + b;
	port->print("sum = ");
	port->println(sum);
	return a + b;
}

#endif

