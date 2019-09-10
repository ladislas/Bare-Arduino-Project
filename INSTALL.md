
# How to install and use the Bare-Arduino-Project

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [About](#about)
- [Installation Guide](#installation-guide)
  - [Important note about bugs and issues](#important-note-about-bugs-and-issues)
  - [Getting Ready - The Toolbox](#getting-ready---the-toolbox)
    - [OS X](#os-x)
    - [Linux](#linux)
  - [1. Install `avr-gcc`, `binutils`, `avr-libc` and `avrdude`](#1-install-avr-gcc-binutils-avr-libc-and-avrdude)
    - [OS X](#os-x-1)
    - [Linux](#linux-1)
  - [2. Clone `Bare-Arduino-Project` repository from Github](#2-clone-bare-arduino-project-repository-from-github)
  - [3. Install `pySerial`](#3-install-pyserial)
  - [4. Copy and edit a `Makefile`](#4-copy-and-edit-a-makefile)
  - [5. Compile and upload your code](#5-compile-and-upload-your-code)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## About

You will be guided during the installation and setup of the toolchain.

The toolchain gathers all the pieces of software you need to successfully write, compile, debug, recompile and upload the code of your Arduino projects.

It took us quite some time to figure out what to do, how to do it, which Homebrew `formula` to install, how to use the `Makefile` and so on. When we say quite some time, you can count full working weeks of reading, trying, trying again, cursing because nothing is working, dead ends, new ideas, clearer vision and finally a working toolchain.

> It's our present to the world!

Have fun! :)

## Installation Guide

### Important note about bugs and issues

If during or after the installation process, something **does not** work with the [Bare-Arduino-Project](https://github.com/ladislas/bare-arduino-project), please **first report the issue [here in this repo issue tracker](https://github.com/ladislas/bare-arduino-project/issues)** and **not in Arduino-Makefile**.

It will allow us to investigate first and not overflow the Arduino-Makefile issue tracker with unrelated issues.

### Getting Ready - The Toolbox

#### OS X

Before starting, please make sure you have those installed:

*	[Arduino IDE 1.0.x or 1.6.x](http://arduino.cc/en/main/software#toc2) - Download the app from the website
*	[Homebrew](http://mxcl.github.io/homebrew/) - Follow the instructions on their website
*	[Git](http://git-scm.com/) - use `brew install git` to install the latest version

#### Linux

Before starting we need to install `git` and `arduino`:

```Bash
# First add the git-core ppa
$ sudo add-apt-repository ppa:git-core/ppa

# Update list
$ sudo apt-get update && sudo apt-get upgrade

# Install git 2.x.x and Arduino 1.0.x
$ sudo apt-get install git arduino
```

### 1. Install `avr-gcc`, `binutils`, `avr-libc` and `avrdude`

#### OS X

We've made a [Homebrew](http://brew.sh/) `formula` that you can `tap` like [*dat ass*](https://www.youtube.com/watch?v=18gp_NBg43c):

```Bash
$ brew tap osx-cross/avr
$ brew install avr-gcc
$ brew install avrdude
```

Check that everything has been installed properly by running `avr-gcc -v` and `avrdude -v`.

#### Linux

```Bash
$ sudo apt-get install gcc-avr binutils avr-libc avrdude
```

Make sure everything is up and running by running `avr-gcc -v` and `avrdude -v`.

### 2. Clone `Bare-Arduino-Project` repository from Github

Simply clone the repo:

```Bash
$ cd ~
$ git clone https://github.com/ladislas/Bare-Arduino-Project MyArduinoProject
```

Initialize and update submodules:

```Bash
$ cd MyArduinoProject
$ git submodule update --init --recursive
```

[Create a Github repository](https://github.com/new) and push to it:

```Bash
$ git remote set-url origin https://github.com/{{YOUR GITHUB USERNAME}}/MyArduinoProject
$ git push --set-upstream origin master
```

### 3. Install `pySerial`

To upload the program, we need to reset the Arduino board. This is done using a `python script` stored in `./Arduino-Makefile/bin`

First, if you don't already have Python 2 & 3, you can install it using Homebrew on OS X:

```Bash
$ brew install python python@2
```

Then install `pySerial`:

```Bash
$ pip install pyserial & pip2 install pyserial
```

### 4. Copy and edit a `Makefile`

To make sure you're up and running to hack Arduino, we are going to compile some code. We need to have a Makefile for each project we want to compile.

`cd` to `src/FooProject` folder:

```Bash
$ cd MyArduinoProject
$ cd src/FooProject
```

Then copy the `Makefile-Example.mk`:

```Bash
# if you are on OS X
$ cp ../../Makefile-OSX.mk ./Makefile

# or if you're running Linux
$ cp ../../Makefile-Linux.mk ./Makefile
```

Modify the `Makefile` to suit your needs:

* `PROJECT_DIR` is the full path to the root project folder (ex. `PROJECT_DIR = $(HOME)/MyArduinoProject`).
* `BOARD_TAG` & `BOARD_SUB` define the target board you are compiling to. `BOARD_SUB` is only used in the most recent versions of the IDE (and not in Arduino 1.0.x). To find the proper values:
  * Open the board definitions file (see `BOARDS_TXT` path when `make` is launched)
  * Find for the board used (for example *"Arduino Pro or Pro Mini (3.3V, 8 MHz) w/ ATmega328"*)
  * Look at the config keys for this board (in this case `pro.menu.cpu.8MHzatmega328=ATmega...`)
  * So `BOARD_TAG = pro` and `BOARD_SUB = 8MHzatmega328`
* `MONITOR_PORT` is the device full path (required if you want to upload to the board). An example is `/dev/tty.usbserial-A20356BI`

### 5. Compile and upload your code

Then compile and upload your code to an **Arduino Uno**:

```Bash
$ make
$ make upload
```

If it's not working, make sure everything has been installed correctly and check your `Makefile` configuration. Also make sure you are using and `Arduino Uno`.

If nothing seems to help, you can fill an [issue here](https://github.com/ladislas/Bare-Arduino-Project/issues).
