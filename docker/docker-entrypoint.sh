#!/bin/bash -e

if [ -z "$1" ] || [ ! -x "cmd/$1" ]; then
	echo "One of the following arguments is required:"
	ls -1 cmd/
	exit 1
fi

"$@"



