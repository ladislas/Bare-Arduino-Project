
# How to install and use the Bare-Arduino-Project

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [About](#about)
- [Installation Guide](#installation-guide)
	- [Toolbox](#toolbox)
		- [OS X](#os-x)
		- [Linux](#linux)
	- [1. Install `avr-gcc`, `binutils`, `avr-libc` and `avrdude`](#1-install-avr-gcc-binutils-avr-libc-and-avrdude)
		- [OS X](#os-x-1)
		- [Linux](#linux-1)
	- [2. Clone `Bare-Arduino-Project` repository from Github](#2-clone-bare-arduino-project-repository-from-github)
	- [3. Install `pySerial`](#3-install-pyserial)
	- [4. Test that evrything is up and running](#4-test-that-evrything-is-up-and-running)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## About

You will be guided during the installation and setup of our toolchain.

The toolchain gathers all the pieces of software you need to successfully write, compile, debug, recompile and upload your code to our Arduino based Moti.

It took us quite some time to figure out what to do, how to do it, which Homebrew `formula` to install, how to use the `Makefile` and so on. When we say quite some time, you can count full working weeks of reading, trying, trying again, cursing because nothing is working, dead ends, new ideas, clearer vision and finally a working toolchain.

>It's our present to the world!

Have fun! :)

## Installation Guide

### Toolbox

#### OS X

Before starting, please make sure you have those installed:

*	[Arduino IDE](http://arduino.cc/en/main/software) - Download the app from the website
*	[Homebrew](http://mxcl.github.io/homebrew/) - Follow the instructions on their website
*	[Git](http://git-scm.com/) - use `brew install git` to install the latest version

#### Linux

Before starting we need to install `git` and `arduino`:

```Bash
$ sudo apt-get update && sudo apt-get upgrade
$ sudo apt-get install git arduino
```

### 1. Install `avr-gcc`, `binutils`, `avr-libc` and `avrdude`

#### OS X

We've made a [Homebrew](http://brew.sh/) `formula` that you can `tap` like [*dat ass*](https://www.youtube.com/watch?v=18gp_NBg43c):

```Bash
$ brew tap WeAreLeka/avr
$ brew install avr-libc
```

Check that everything has been installed properly by running `avr-gcc -v` and `avrdude -v`. If `avrdude` is missing, install it with:

```Bash
$ brew install avrdude
```

#### Linux

```Bash
$ sudo apt-get install gcc-avr binutils avr-libc avrdude
```

Make sure everything is up and running by running `avr-gcc -v` and `avrdude -v`.

### 2. Clone `Bare-Arduino-Project` repository from Github

Simply clone the repo:

```Bash
$ git clone https://github.com/WeAreLeka/Bare-Arduino-Project path/to/MyAwesomeProject
```

Initialize and update submodules:

```Bash
$ cd path/to/MyAwesomeProject
$ git submodule update --init --recursive
```

Create a Github repository and push to it:

```Bash
$ cd path/to/MyAwesomeProject
$ git remote set-url origin https://github.com/{{YOUR GITHUB USERNAME}}/MyAwesomeProject
$ git push origin master
```

### 3. Install `pySerial`

To upload the program, we need to reset the Arduino board. This is done using a `python script` stored in `./Arduino-Makefile/bin`

First, if you don't already have Python, you can install it using Homebrew on OS X:

```Bash
$ brew install python
```

Then install `pySerial`:

```Bash
$ pip install pyserial
```

### 4. Test that evrything is up and running

To make sure you're up and running to hack autism, we are going to compile some code.

First `cd` to `src/myProject` folder:

```Bash
$ cd path/to/MyAwesomeProject
$ cd src/myProject
```

Then copy the `Makefile-Example.mk`:

```Bash
$ cp ../../Makefile-OSX.mk ./Makefile

# or if you're running Linux

$ cp ../../Makefile-Linux.mk ./Makefile
```

**Don't forget** to modify the `Makefile` to suit your needs.

Then compile and upload your code to an **Arduino Uno**:

```Bash
$ make
$ make upload
```

If it's not working, make sure everything has been installed correctly and check your `Makefile` configuration. Also make sure you are using and `Arduino Uno`.

If nothing seems to help, you can fill an [issue here](https://github.com/WeAreLeka/Bare-Arduino-Project/issues).
