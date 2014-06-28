#define serial Serial

#include <Arduino.h>
#include <Wire.h>

#include "ChibiOS_AVR.h"
#include "Serial.h"
#include "Tools.h"

#include "CommunicationUtils.h"
#include "DebugUtils.h"
#include "ADXL345.h"
#include "ITG3200.h"
#include "FreeIMU.h"

#include "Sensors.h"
#include "Led.h"
#include "DriveSystem.h"
#include "Motor.h"


#include "./lib/Arbitrer.h"
#include "./lib/Cruise.h"
#include "./lib/Bump.h"
#include "./lib/Stabilization.h"

void chSetup() {
	chThdSleepMilliseconds(5000);

	chThdCreateStatic(waArbitrerThread, sizeof(waArbitrerThread),
			NORMALPRIO + 10, ArbitrerThread, NULL);
	chThdCreateStatic(waStabilizationThread, sizeof(waStabilizationThread),
			NORMALPRIO, StabilizationThread, NULL);
	chThdCreateStatic(waCruiseThread, sizeof(waCruiseThread),
			NORMALPRIO + 1, CruiseThread, NULL);
	chThdCreateStatic(waBumpThread, sizeof(waBumpThread),
			NORMALPRIO + 2, BumpThread, NULL);

	/* chThdSleepMilliseconds(6000);
	   Serial.println("YOLO");
	   robot.spin(sensors, RIGHT, 160, 90);

	   chThdSleepMilliseconds(600);

	   robot.go(FORTH, 130, 3000, 350);
	   robot.stop(500);

	//chThdSleepMilliseconds(1000);

	robot.spin(sensors, LEFT, 160, 90);

	chThdSleepMilliseconds(600);

	robot.go(BACK, 130, 3000, 350);
	robot.stop(500);

	Serial.println("SWAG");
	robot.stop();*/
}

void setup() {
	Serial.begin(115200);
	sensors.init();

	Serial.println("111");

	chBegin(chSetup);

	while(1) {
		// nothing to do here
	}
}

void loop() {
	// nothing to do here
}

