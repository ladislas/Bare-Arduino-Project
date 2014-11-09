#!/usr/bin/env bash

failures=()
successes=()

cd "$SRC"
for dir in *; do

	if [ -d "${dir}" ]; then

		echo "Compiling $dir..."

		echo $CWD
		cd $dir

		cp $CWD/Makefile-CI.mk Makefile

		make PROJECT_DIR=$CWD ARDUINO_DIR=$ARDUINO AVR_TOOLS_DIR=$AVR_GCC

		if [[ $? -ne 0 ]]; then
			failures+=("$dir")
			echo "Source $dir failed"
		else
			successes+=("$dir")
			echo "Source $dir succeeded"
		fi

		cd ..

	fi

done

cd "$TEST"
for dir in *; do

	if [ -d "${dir}" ]; then

		echo "Compiling $dir..."

		cd $dir

		cp $CWD/Makefile-CI.mk Makefile

		make PROJECT_DIR=$CWD ARDUINO_DIR=$ARDUINO AVR_TOOLS_DIR=$AVR_GCC

		if [[ $? -ne 0 ]]; then
			failures+=("$dir")
			echo "Test $dir failed"
		else
			successes+=("$dir")
			echo "Source $dir succeeded"
		fi

		cd ..

	fi

done

if [[ ${#failures[@]} -ne 0 ]]; then
	echo "The following builds succeeded:"
	for success in "${successes[@]}"; do
		echo "- Building $success succeeded"
	done

	echo "The following builds failed:"
	for failure in "${failures[@]}"; do
		echo "- Building $failure failed"
	done
fi

if [[ ${#failures[@]} -eq 0 ]]; then
	echo "All tests passed."
else
	exit 1
fi
