#!/bin/bash
set -e
if ! /system/internal/test/test.sh "$@"; then
	echo
	echo "---------------------------------------------"
	if $DEBUG_CONSOLE; then
		echo "*** Test failed. A debugging console will now be opened for you."
		echo
		if [[ -e /tmp/passenger ]]; then
			cd /tmp/passenger
		fi
		echo "PS1='\\u@testbox:\\w\\\$ '" >> /root/.bashrc
		bash -l
	else
		echo "*** Test failed. If you want a debugging console to be launched, re-run the test with -D."
	fi
	exit 1
fi