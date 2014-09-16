#!/usr/bin/env bash

#!/usr/bin/env bash

failures=()

for dir in "$SRC/*/"
do
	dir=${dir%*/}
	src=${dir##*/}

	pushd $dir

	echo "Compiling $src..."

	cp $CWD/Makefile-CI.mk Makefile

	make_output=`make clean`
	make_output=`make PROJECT_DIR=$CWD ARDUINO_DIR=$ARDUINO AVR_TOOLS_DIR=$AVR_GCC`

	if [[ $? -ne 0 ]]; then
		failures+=("$src")
		echo "Example $src failed"
	fi

	popd

done

for dir in "$TEST/*/"
do
	dir=${dir%*/}
	test=${dir##*/}

	pushd $dir

	echo "Compiling $test..."

	cp $CWD/Makefile-CI.mk Makefile

	make_output=`make clean`
	make_output=`make PROJECT_DIR=$CWD ARDUINO_DIR=$ARDUINO AVR_TOOLS_DIR=$AVR_GCC`

	if [[ $? -ne 0 ]]; then
		failures+=("$test")
		echo "Example $test failed"
	fi

	popd

done

for failure in "${failures[@]}"; do
	echo "Example $failure failed"
done

if [[ ${#failures[@]} -eq 0 ]]; then
	echo "All tests passed."
else
	exit 1
fi
