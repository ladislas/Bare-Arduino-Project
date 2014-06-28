
# Installation Guide

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [About](#about)
- [Quick Installation Guide](#quick-installation-guide)
	- [OS X - 10.9.2](#os-x---1092)
		- [Toolbox](#toolbox)
		- [1. Install `avr-gcc`, `binutils`, `avr-libc` and `avrdude`](#1-install-avr-gcc-binutils-avr-libc-and-avrdude)
		- [2. Clone `moti` repository from Github](#2-clone-moti-repository-from-github)
		- [3. Install `pySerial`](#3-install-pyserial)
		- [4. Test if your code is compiled and uploaded correctly](#4-test-if-your-code-is-compiled-and-uploaded-correctly)
	- [Ubuntu](#ubuntu)
		- [1. Install the toolbox](#1-install-the-toolbox)
		- [1. Install `avr-gcc`, `binutils`, `avr-libc` and `avrdude`](#1-install-avr-gcc-binutils-avr-libc-and-avrdude-1)
		- [2. Clone `moti` repository from Github](#2-clone-moti-repository-from-github-1)
		- [3. Install `pySerial`](#3-install-pyserial-1)
		- [4. Test if your code is compiled and uploaded correctly](#4-test-if-your-code-is-compiled-and-uploaded-correctly-1)
- [Full installation Guide for OS X 10.9.2](#full-installation-guide-for-os-x-1092)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## About

Here after, you will be guided during the installation and setup of our toolchain.

The toolchain gathers all the pieces of software you need to successfully write, compile, debug, recompile and upload your code to our Arduino based Moti.

It took us quite some time to figure out what to do, how to do it, which Homebrew `formula` to install, how to use the `Makefile` and so on. When we say quite some time, you can count full working weeks of reading, trying, trying again, cursing because nothing is working, dead ends, new ideas, clearer vision and finally a working toolchain.

>It's our present to the world!

You'll find two sets of instructions:

*	[Quick Installation Guide](#quick-install-guide)
	*	OS X
	*	Ubuntu
*	[Full Installation Guide for OS X](#detailed-install-guide) - WIP

Have fun! :)

## Quick Installation Guide

### OS X - 10.9.2

#### Toolbox

Before starting, please make sure you have those installed:

*	[Arduino IDE](http://arduino.cc/en/main/software) - Download the app from the website
*	[Homebrew](http://mxcl.github.io/homebrew/) - Follow the instructions on their website
*	[Git](http://git-scm.com/) - use `brew install git` to install the latest version

#### 1. Install `avr-gcc`, `binutils`, `avr-libc` and `avrdude`

We've made a [Homebrew](http://brew.sh/) `formula` that you can `tap` like [*dat ass*](https://www.youtube.com/watch?v=18gp_NBg43c):

```Bash
$ brew tap WeAreLeka/avr
$ brew install avr-libc
```

Check that everything has been installed properly by running `avr-gcc -v` and `avrdude -v`. If `avrdude` is missing, install it with:

```Bash
$ brew install avrdude
```

#### 2. Clone `moti` repository from Github

Simply clone the repo:

```Bash
$ git clone https://github.com/WeAreLeka/moti.git path/to/moti
```

Initialize and update submodules:

```Bash
$ cd path/to/moti
$ git checkout dev && git submodule update --init --recursive
```

#### 3. Install `pySerial`

To upload the program, we need to reset the Arduino board. This is done using a `python script` stored in `./arduino-mk/bin`

First, if you don't already have Python, you can install it using Homebrew:

```Bash
$ brew install python
```

Then install `pySerial`:

```Bash
$ pip install pyserial
```

#### 4. Test if your code is compiled and uploaded correctly

To make sure you're up and running to hack autism, we are going to compile some code.

First `cd` to one of the `src` folders:

```Bash
$ cd path/to/moti
$ cd src/driveSystem
```

Then copy the `Makefile` from `arduino-mk`:

```Bash
$ cp ../../arduino-mk/examples/MakefileExample/Makefile-example.mk ./Makefile
```

You need to customize the `Makefile` to work on your pc. Open it and change the following line:

```Makefile
# change line 8 from
PROJECT_DIR = /Users/Ladislas/dev/leka/moti
# according to your path to
PROJECT_DIR = path/to/moti
```

Then compile and upload your code to an **Arduino Mega2560**:

```Bash
$ make
$ make upload
```

If it's not working, make sure everything has been installed correctly and check your `Makefile` configuration. Also make sure you are using an `Arduino Mega2560`.

### Ubuntu

#### 1. Install the toolbox

Before starting we need to install `git` and `arduino`:

```Bash
$ sudo apt-get update && sudo apt-get upgrade
$ sudo apt-get install git arduino
```

#### 1. Install `avr-gcc`, `binutils`, `avr-libc` and `avrdude`

```Bash
$ sudo apt-get install gcc-avr binutils avr-libc avrdude
```

Make sure everything is up and running by running `avr-gcc -v` and `avrdude -v`.

#### 2. Clone `moti` repository from Github

Simply clone the repo:

```Bash
$ git clone https://github.com/WeAreLeka/moti.git path/to/moti
```

Initialize and update submodules:

```Bash
$ cd path/to/moti
$ git checkout dev && git submodule update --init --recursive
```

#### 3. Install `pySerial`

To upload the program, we need to reset the Arduino board. This is done using s `python script` stored in `./arduino-mk/bin`

First, if you don't already have Python, you can install it:

```Bash
$ sudo apt-get install python python-pip
```

Then install `pySerial`:

```Bash
$ sudo pip install pyserial --upgrade
```

#### 4. Test if your code is compiled and uploaded correctly

To make sure you're up and running to hack autism, we are going to compile some code.

First `cd` to one of the `src` folders, i.e.:

```Bash
$ cd path/to/moti
$ cd src/driveSystem
```

Then copy the `Makefile` from `arduino-mk`:

```Bash
$ cp ../../arduino-mk/examples/MakefileExample/Makefile-example.mk ./Makefile
```

You need to customize the `Makefile` to work on your pc. Open it and change the following line:

```Makefile
# change line 8 from
PROJECT_DIR = /Users/Ladislas/dev/leka/moti
# according to your path to
PROJECT_DIR = path/to/moti

# change line 16 from
ARDUINO_DIR = /Applications/Arduino.app/Contents/Resources/Java
# to
ARDUINO_DIR = /usr/share/arduino

# change line 32 from
AVR_TOOLS_DIR     = /usr/local
# according to your path to
AVR_TOOLS_DIR     = /usr

# change line 36 from
AVRDDUDE          = /usr/local/bin/avrdude
# according to your path to
AVRDDUDE          = /usr/bin/avrdude
```

Then compile and upload your code to an **Arduino Mega2560**:

```Bash
$ make
$ make upload
```

If it's not working, make sure everything has been installed correctly and check your `Makefile` configuration. Also make sure you are using and `Arduino Mega2560`.

## Full installation Guide for OS X 10.9.2

**Workin in progress... stay tuned!**

#### Toolbox

Before starting, we need to install different **mandatory** softwares:

*	[Arduino IDE](http://arduino.cc/en/main/software) - this software is used to develop the source code and to upload it to your Arduino board. We recommend going for the 1.0.5 version. If you are a little more advanced user feel free to try the new beta version 1.5. Please note that you may encounter strange behaviors (we do sometimes), so please, take the time to report them in the [Due Forum](http://forum.arduino.cc/index.php?board=87.0) and/or here.
*	[Homebrew](http://mxcl.github.io/homebrew/) - Homebrew is the best package manager for OS X (a Linux version is under development). Homebrew helps you download and install packages to do whatever your need to do, without compromising your computer and the weird stuff going on in `/usr/local/`
*	[Git](http://git-scm.com/) - Of course, you need to have git install but we assume that if you are reading this, you know what it is and how to use it. If you're not really comfortable with the `Command Line`, you can use a Git GUI. [Try this list](http://git-scm.com/download/gui/mac), test them and stick to the one you prefer! :)
*	[Github account](https://github.com/signup/free) - Sign up for free, fork the project, improve the awesomeness and pull it back!

With these tools, you should be up and running and ready to hack autism with Moti!

### Advanced & Recommended

Okay, so you started with the Arduino IDE, you're now familiar with the language, you've already read and write something like a thousand lines of code and you would really love some new tools to speed up your coding and improve your coding experience. Here are some solutions for you that we, at Leka, are using on a daily basis with great pleasure!

*	[Sublime Text 2](http://www.sublimetext.com/2) - ST2 is our favorite prose/code editor. It takes some time to familiarize but once you get used to it, you'll have some hard time finding a replacement! The great thing with ST2 is that you can install or develop your own packages to improve your coding experience. Here after are some of theme :)
*	[ST2 Package Controler](http://wbond.net/sublime_packages/package_control) - First start with this one! It will allow you to manage and install great packages. Follow the instruction provided by the link and you'll be good to go!
*	[Sublime - Arduino](https://github.com/theadamlt/Sublime-Arduino) - This package is really usefull because it provides syntax highlighting for Arduino code!
*	[SublimeClang](https://github.com/qnarster/SublimeClang) - This package is a must have to write serious code. It provides code completion and syntax checking in real time. We've set up and customized a [`moti.sublime-project`](#link) to suit our needs. Please note that the package manager might not work, so you'll have to clone and build it yourself. You'll find detailed instructions on the [Github page](#link).

## Installing, Updating & Removing

### Hacker's guide - Mac OS X Edition

For you people working on Max OS X, it should be pretty easy.

Make sure you've installed the Arduino IDE.

#### 3. Clone the Arduino-Makefile repo from Github - *NOT REQUIRED ANYMORE*

**Important Note:** *the Arduino-Makefile is now part of the project as a submodule. So the good news is you don't need to clone it before use. The other good news is that the Makefile_example now reflects thoses changes and is already configured to look for the right files at the right place.*

#### 4. Install the `perl` dependencies needed to use the `Makefile`

You need `Device::SerialPort` to upload the `.hex` file on the board. Simply type:

```Bash
$ sudo perl -MCPAN -e 'install +Device::SerialPort'
```

#### 5. Using the `Makefile` to compile your code

Everywhere your `.ino` files are, you want to put a `Makefile` to compile the code. That said, your `.ino` files should be in `/path/to/moti/src/YOUR_DIRECTORY`.

In you command line, do the following: (`new-project` should be the name of you behavior, like `stabilization`, `happy`, etc.)

```Bash
$ cd /path/to/moti/src && mkdir new-project && cd $_ && touch new-project.ino && cp ../../arduino-mk/examples/MakefileExample/Makefile-example.mk Makefile
```

**Don't forget to configure it to suit your needs**, because it **won't** work right outside the box. On OS X, you need to change: `BOARD_TAG`, `PROJECT_DIR` and `MONITOR_PORT`.

Then, simply run `make` from `/path/to/moti/src/YOUR_DIRECTORY` and it should compile. To upload, use `make upload`. For further information, visit [sudar's Arduino-Makefile repo](https://github.com/sudar/Arduino-Makefile).

### Hacker's guide - Linux Edition

For you Linux users, the recipe is pretty much the same as for OS X, except that you can't use `Homebrew` so you need to use `apt-get`, `yum` or `synaptic` all the following:

*	`avr-gcc 4.8.2` or higher and all the dependencies
*	`binutils 2.23.1`
*	`avr-libc 1.8.0`
*	`gmp`
*	`libmpc`
*	`mpfr`
*	`avrdude`

Then, you need to:

```Bash
apt-get install libdevice-serialport-perl
```

And finally follow from [here](#2-Clone-moti-repository-from-Github)

Inside the [Makefile_example](arduino-mk/examples/MakefileExample/Makefile-example.mk), you will find all you need to customize it.

### Beginner's guide - Installing from scratch on OS X/Unix

**IMPORTANT:**

> When asked to enter `Terminal/Shell` command in the `command line`, **do not** type the `$`. It here to show we are using a `command line prompt`.

#### Downloading and installing Sublime Text 2

Go visit the [Sublime Text 2 website](http://www.sublimetext.com/), download the package and install it as you would do with any other application.


#### Downloading and installing the Arduino IDE

Go visit the [Arduino website](http://arduino.cc/en/Main/Software), download the package and install it as you would do with any other application.


#### Downloading and installing a Git GUI

For comfort, we like like to use a Git GUI. For beginners, we recommend the Github Git GUI. Go visit the [Github for Mac website](http://mac.github.com/), download the package and install it as you would do with any other application.

For those on Linux or Windows, there are [apps](http://git-scm.com/downloads/guis) for you as well but we assume that if you are using Linux, you don't need one of them.


#### Installing Homebrew

As we said earlier, Homebrew is a package manager. It's not a standard application with a graphical user interface (GUI). You have to open the Terminal.app to use Homebrew and type some command lines. If you're afraid, fear not my friend! We will guide you all along the way and you will eventually feel all the power of your computer!
If command line is really not your cup of tea, maybe you should just give up because we are going to use plenty of those later on! Come back when you're ready.

For those who want to fight, go visit the [Homebrew website](http://mxcl.github.io/homebrew/) and follow all the instructions. And because we are so generous, we also put them here: open Terminal.app, copy/paste the following line and let the magic begin (**don't copy the `$` sign**, it is used to say we are using the command line...):

```Bash
$ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
```

For troubleshooting, [Google](http://lmgtfy.com/?q=homebrew) is your best friend. You can also try typing `brew doctor` in your `Terminal.app` to see what is wrong. Please don't fill issues on Github regarding the installation of Homebrew, we won't read them.

#### Installing Git with Homebrew

Now we are going to install/update Git with Homebrew.

Open the Terminal.app and then type:

```Bash
$ brew install git
```

And that's it! It will download the source and compile it. Everything should be OK.
Now you have the last Git version on your system which is pretty awesome you must say!

#### Check Git version and amend `$PATH` if necessary

Now we're going to do a quick test to check that everything is up and running. In your terminal, type:

```Bash
$ git --version
```

And it should output something like that:

```Bash
$ git --version
$ git version 1.8.3.1
```

If you have the 1.8.X version, it means that your are using the most recent version. If not, say you have 1.7.X, it "means" you are using the system version of Git because of a "path issue". But don't worry, we're going to fix this.

In your Terminal type:

```Bash
$ open /etc
```

The finder should open a new window to `/private/etc`, look for a file called `paths`. Right click on the file, choose `Open With` and choose Sublime Text 2 (if ST2 is not in the list, click `Other`... and look for it).

Sublime Text should open and display the content of `paths`. It should look like this but it may vary:

```Bash
/usr/local/bin
/usr/bin
/usr/local/sbin
/usr/bin
/bin
/sbin
```

Make sure that `/usr/local/bin` is before `/usr/bin`. In doubt you can copy and paste mine to replace yours and it will work fine.

Type `cmd+s` to save the file, you should be prompted to enter your password, so enter it, and voilà! You have just amended your `$PATH`, congratulations!

Quit (`cmd+q`) the Terminal.app, reopen the Terminal.app and type:

```Bash
$ git --version
```

To check your version. If it's not working, do the `$PATH` part again.

#### Getting ready for the next part

**IMPORTANT: From here, things get a little more complex. If you follow up and take your time, everything should work fine. Please, before starting, read the whole procedure so you'll know where we are going.**

Remember that you installed the Arduino IDE, maybe you even started coding with it. We hope you didn't like it because, guess what! We're not going to use it! Yes, you've heard me, we think the Arduino IDE is not as good as it should be (for now, it may become awesome one day, but we're waiting...) so we want to compile and upload everything on our own. Don't leave! It's not as complicated as it looks, plus some great minds have done most of the work for us! Ready? Let's get going! :)

#### Installing `avr-gcc` and co

In this part, we are going to install `avr-gcc`, `binutils`, `avr-libc` and `avrdude`. To be brief, the three firt are used to compile your code for you Arduino microcontroller and the last one is used to upload the code on the Arduino.

To do this, we are going to use Homebrew, one more time! Type each of the following lines one by one:

```Bash
$ brew tap WeAreLeka/avr
$ brew install avr-libc
```

This should install all you need. It may take some time to compile (up to one hour), so grab a coffee and a book and be patient. It is also normal, if you are using a laptop, to hear the fan. Compiling needs a lot of power.

Once it's done, you can check everything is fine by typing:

```Bash
$ avr-gcc -v
$ avrdude -v
```

You should get something like that:

```Bash
$ avr-gcc -v
Using built-in specs.
... //	lots of stuff...
	Thread model: single
gcc version 4.8.1 (GCC)
	```

and

```Bash
$ avrdude -v
avrdude: Version 5.11.1, compiled on Jun 20 2013 at 11:55:07
...	// lots of stuff
```

If `avrdude` was not installed, you can do so by typing:

```Bash
$ brew install avrdude
```

And that's it! If something went wrong, fill an issue on Github using [this page](https://github.com/WeAreLeka/moti/issues).

#### Cloning the moti repository from Github

If you just want to download the repo and use the code, get updates but don't contribute, you can clone the repo from Github. To do so, there are two ways :

*	first, you can use your favorite Git GUI and follow **their** instructions.
*	second, you can use the command line to feel like a boss.

For the second way, first, create a directory where you will clone all of our repos. We highly recommend to use something like that: `~/dev/leka` but anything should do, just write this path somewhere, we are going to use it.
	Then, open the Terminal and type:

```Bash
$ cd path/to/wherever/you/want/to/clone/the/repo # e.g. cd ~/dev/leka
$ git clone https://github.com/WeAreLeka/moti.git
$ cd moti
$ git checkout dev
```

You can also `git checkout master` but this branch may be a lot behind `dev`. However, changes in this branch are frequent and things might work one day but not the next day. If you can't fix, fill an issue.

So now, you have all the files needed for programming your own moti.

#### Cloning the Arduino-makefile - **NOT REQUIRED ANYMORE, just for information**

**Important Note:** *the Arduino-Makefile is now part of the project as a submodule. So the good news is you don't need to clone it before use. The other good news is that the Makefile_example now reflects thoses changes and is already configured to look for the right files at the right place.*

As we said, we won't use the Arduino IDE, instead we are going to compile everything on our own. This is where things get interesting. To compile, you need a compiler. We do have one, remember, we installed `avr-gcc` earlier today. `avr-gcc` is derived from `gcc` a world famous compiler for C/C++ (our code will be written mostly in C/C++) and we will even use C++11, the latest version of C++ which simplify a lot of things (we won't get into the details, but you can read all the documentation you need [here](http://en.wikipedia.org/wiki/C%2B%2B11) and [here](http://gcc.gnu.org/)). We could use pure command line to tell the computer how to compile the code using avr-gcc but as your code gets bigger, it becomes nearly impossible.

That's why some people invented the Makefiles. Makefiles are like a recipe for the compiler which explains what to do with what and in which order. Writing a makefile on your own is like climbing Mont Everest: with no training, it's impossible and you'll die alone and exhausted.

But here comes the open source community! Some great guys have written a working makefile for Arduino doing exactly what we intend to. You can thank [Sudar](http://hardwarefun.com/tutorials/compiling-arduino-sketches-using-makefile) and [Martin Oldfield](http://www.mjoldfield.com/atelier/2009/02/arduino-cli.html) and all the people who have contributed.

This makefile will be used as our reference, the one makefile to rule them all. We will also have smaller Makefiles later, we'll get to it.

We forked [Sudar's repo](https://github.com/sudar/Arduino-Makefile) to customize the makefile to our needs.

To clone the makefile, the process is quite the same: use your Git GUI or command line.

For the command line:

```Bash
$ cd path/to/wherever/you/want/to/clone/the/repo # e.g. cd ~/dev/leka
$ git clone https://github.com/WeAreLeka/Arduino-Makefile
$ cd Arduino-Makefile
```

By now, in your local project directory, you should have two directories: `moti` and `Arduino-Makefile`. If not, make sure you're looking at the right place...


#### Let's use some Perl to get things up and running

The makefile we use is great, but on its own, it's not sufficient to upload the sketch and configure everything (say like knowing what kind of board you are using and finding its specs for the compiler). To do that, the same Sudar as before has written some perl scripts for us.

But we need to install some perl modules to get them working. Once again, it's quite easy! Open the Terminal and type line by line (you will be asked for you password because of `sudo`) :

```Bash
$ sudo perl -MCPAN -e 'install +YAML'
$ sudo perl -MCPAN -e 'install +Device::SerialPort'
```

It may take some time and you may be asked questions, always answer `y` for "yes".

#### Let's take a break, you earned it!

By now, things are pretty close to being up and running. We've done a lot of crazy things. It might look a little mysterious now, but as you get used to it, you'll finally understand why we did all that. Feel free to take looks into the different files, repos, folders and stuff we've done, ask Google about everything. You'll need to be a little aware of everything if you really want to enjoy our work.

#### Let's take a look the moti directory tree

The moti directory tree looks like that:

```Bash
.
|____lib
| |____FreeSixIMU
| |____Moti
| |____RGBLED
| |____etc...
|____sketch
|____src
| |____Behaviors
| |____blink
| |____driveSystem
| | |____Makefile
| | |____driveSystem.ino
| |____etc...
|____test
```

Some explanations:

*	`lib` - all the libraries we use
*	`sketch` - the Fritzing sketches for moti, not up-to-date
*	`src` - the different behaviors we are working on
*	`test` - unit tests

The Makefile is used to set some parameters for the compiler:

*	`BOARD_TAG` - the board you want to compile your code for (we will use uno or mega2560)
*	`MONITOR_BAUDRATE` - the Serial speed to `make monitor` the robot
*	`PROJECT_DIR` - the actual directory of moti
*	`ARDMK_DIR` - the path to the Arduino-Makefile directory
*	`ARDUINO_DIR` - the path to the important Arduino components used by the compiler (you can use `/Applications/Arduino.app/Contents/Resources/Java`)
*	`AVR_TOOLS_DIR` - path to `avr-gcc` and co, use `/usr/local`
*	`MONITOR_PORT` - usb port where your arduino is connected. Connect your board to the computer, open the Arduino IDE, go to `Tools -> Serial Port` and look for the port starting with `/dev/tty.usbmodemXXXX` and replace `XXX` by your value.
*	`CURRRENT_DIR` - the current directory of the makefile, do not touch
*	`include /path/to/Arduino-Makefile/arduino-mk/Arduino.mk` - use yours as above, it will include the `master Makefile`

#### Use the makefile to make sure everything is up and running!

Now big time! We are **actually** going to compile our code, get ready!

Open Terminal and type:

```Bash
$ cd path/to/moti/src/moti_3
$ make
```

The code should compile!

#### Upload the code

Now type:

```Bash
$ make upload
```

And your code should upload! :)
