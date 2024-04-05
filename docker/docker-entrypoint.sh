#!/bin/bash -e

if [ -z "$1" ] || [ ! -x "cmd/$1" ]; then
	echo "One of the following arguments is required:"
	ls -1 cmd/
	echo "Pass --help as a second parameter for more details"
	exit 1
fi

"$@"



