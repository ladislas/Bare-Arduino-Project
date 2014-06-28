
#Moti Readme

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [About](#about)
	- [What is Moti](#what-is-moti)
	- [Why Github?](#why-github)
	- [Is Moti open source and/or open hardware](#is-moti-open-source-andor-open-hardware)
- [How to...](#how-to)
	- [How to install](#how-to-install)
	- [How to use](#how-to-use)
	- [How to make your own Moti](#how-to-make-your-own-moti)
- [Contributing](#contributing)
	- [How can I help?](#how-can-i-help)
	- [To do - Work flow](#to-do---work-flow)
	- [Branches](#branches)
- [Copyright and License](#copyright-and-license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

##About

![Moti](https://scontent-b.xx.fbcdn.net/hphotos-prn2/t31.0-8/1978378_640660259359885_9078537445630618389_o.jpg)

### What is Moti

Moti is a new kind of interactive smart toy: it's a spherical robot specially designed for children with communication and social disabilities.

### Why Github?

At first, we wanted to keep the code for ourselves. But then we thought "hey! our project is great, but wouldn't it be better if a lot of people could fork it, add their modifications, features, improvements, and then share it back to the community?"

For us, the answer is an absolute **YES**! We want people to be able to look at our code, use it for their projects, use it to build their own Moti and then get back to us to improve the awesomeness for a better world today!

### Is Moti open source and/or open hardware

**Short answer:** yes.

**Long answer:** yes, Moti's software is and will continue to be open source. Reasons are numerous, but the three main reasons are:

*	we love open source, we use it constantly, we use GPL libraries, we want to keep that going on
*	we truly believe we can create a community around our project, composed of parents, developers, researchers, doctors, carers
*	because we just want to

For the hardware, things are a little different. Today, we use Arduino as our prototype platform. The documentation to build your own Moti is a little outdated and will be updated soon. It will be available for anyone who wants to build it's own Moti. If we have enough time, we will also offer a way to download or order 3D printed pieces to assemble the robot.

In the meantime we are working on a *more robust, more powerful, more sensors* prototype. We haven't decided yet if this new version will be open hardware, but we are currently looking and the pros and cons.

## How to...

### How to install

The full procedure is detailed in [INSTALL.md](./INSTALL.md). It has been written for beginners as well as for advanced hackers.

### How to use

The full procedure on how to use everything you've just installed is described in [USE.md](./USE.md).

### How to make your own Moti

Moti is currently based on Arduino. That's why it is totally open hardware!

#### Bill of Materials

*	Arduino Mega2560 - [buy it here](http://www.dfrobot.com/index.php?route=product/product&filter_name=mega&page=2&product_id=655)
*	Motor Shield - [buy it here](http://www.dfrobot.com/index.php?route=product/product&filter_name=motor%20shield&product_id=69)
*	6DOF IMU Shield- [buy it here](http://www.dfrobot.com/index.php?route=product/product&filter_name=6%20dof&product_id=788)
*	Motors (x2)- [buy it here](http://www.pololu.com/product/2365)
*	Extended Brackets (x2)- [buy it here](http://www.pololu.com/product/989)
*	Wheels (x2)- [buy it here](http://www.pololu.com/product/1087)
*	Led (x1/x2)- [buy it here](http://www.dfrobot.com/index.php?route=product/product&filter_name=rgb%20led&product_id=900)
*	Wires - [buy it here](http://www.dfrobot.com/index.php?route=product/product&filter_name=jumper%20wires&product_id=130)
*	9v Batteries (x2) - buy it in your local retail store
*	Bluetooth Module - [buy it here](http://www.ebay.com/itm/JY-MCU-HC-06-V1-03-Bluetooth-Transeiver-RF-Module-Wireless-Serial-4p-Port-line-/121267662236?pt=LH_DefaultDomain_0&hash=item1c3c1dad9c)

The chassis is not yet ready to be 3D-printed, [we need your help for that](https://github.com/WeAreLeka/moti/issues/55).

The Arduino Mega2560 is becoming a little tight to suit our power and memory needs. We are currently benchmarking different alternatives. If you know anything about embedded Linux, please [email us](dev@weareleka.com).

## Contributing

### How can I help?

Help is always more than welcome. If you want to take part in this project, please, make sure you read our [Contributing guidelines](./CONTRIBUTING.md).

### Work flow/To do list

We use [waffle.io](http://waffle.io/WeAreLeka/moti) to manage our to do list and our work flow. Of course, [Github issues](https://github.com/weareleka/moti/issues?state=open) can also be used.

To know what we are working on and what needs to be done, you can click on the following link: [![Stories in Ready](https://badge.waffle.io/WeAreLeka/moti.png?label=ready)](http://waffle.io/WeAreLeka/moti)

### Branches

**IMPORTANT:** Our model is based on [A successful Git branching Model](http://nvie.com/posts/a-successful-git-branching-model/). PLEASE, take the time to read it carefully before starting. We don't want you to mess things up! :)

*	`master` is the stable branch for production.
*	`dev` (origin HEAD) is the development branch for unit/lab tests and behavior development. If the lab tests are concluding, a pull request to the master can be made.
*	`feature branches` are transitory branches used to develop new features to incorporate to the dev branch. When the feature is bug free, a pull request can be made to merge the concluding results inside the dev branch.
*	`oldies` branch keeps all the old code and libraries we used for the first prototype. It is deprecated now but could be helpful for beginners.

##Copyright and License

Moti, a free, as in speech, robotic spherical mobile robot for children with autism.

Copyright (C) 2013 Ladislas de Toldi (ladislas at weareleka dot com)

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see [http://www.gnu.org/licenses/].
