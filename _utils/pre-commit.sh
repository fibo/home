#!/bin/sh

if command -v rumdl > /dev/null
then
	rumdl check .
	exit $?
else
	echo Cannot check markdown files, rumdl is missing.
fi
