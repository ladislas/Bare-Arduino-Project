#ifndef _MY_AWESOME_PROJECT_BAR_LIB_
#define _MY_AWESOME_PROJECT_BAR_LIB_

/**
 * @file BarLib.h
 * @author John Doe
 * @version 1.0
 */

#include <Arduino.h>
#include "FooLib.h"

class BarClass {

	public:

		BarClass();

		void firstBarMethod() const;
		void secondBarMethod() const;

	private:

		//	VARIABLES

		//	CONSTANTS

		//	OBJECTS
		FooClass FooObject;
};

#endif
