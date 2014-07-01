#ifndef _MY_AWESOME_PROJECT_FIRST_LIB_
#define _MY_AWESOME_PROJECT_FIRST_LIB_

/**
 * @file MyFirstLib.h
 * @author John Doe
 * @version 1.0
 */

#include <Arduino.h>

class MyFirstClass {

	public:

		MyFirstClass();

		void methodNumberOne() const;
		void methodNumberTwo() const;

	private:

		//	VARIABLES
		uint8_t _variableOne;
		uint8_t _variableTwo;

		//	CONSTANTS
};

#endif
