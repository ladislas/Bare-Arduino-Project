#ifndef _MY_AWESOME_PROJECT_FOO_LIB_
#define _MY_AWESOME_PROJECT_FOO_LIB_

/**
 * @file FooLib.h
 * @author John Doe
 * @version 1.0
 */

#include <Arduino.h>
#include <Wire.h>

class FooClass {

	public:

		FooClass();

		void firstFooMethod() const;
		void secondFooMethod() const;

	private:

		//	VARIABLES
		uint8_t _variableOne;
		uint8_t _variableTwo;

		//	CONSTANTS
};

#endif
