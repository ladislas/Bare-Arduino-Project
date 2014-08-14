#ifndef _MY_AWESOME_PROJECT_SECOND_LIB_
#define _MY_AWESOME_PROJECT_SECOND_LIB_

/**
 * @file MyFirstLib.h
 * @author John Doe
 * @version 1.0
 */

#include <Arduino.h>
#include "MyFirstLib.h"

class MySecondClass {

	public:

		MySecondClass();

		void methodCallNumberOne() const;
		void methodCallNumberTwo() const;

	private:

		//	VARIABLES

		//	CONSTANTS
		
		//	OBJECTS
		MyFirstClass MyFirstObject;	
};

#endif
