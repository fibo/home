#!/bin/sh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh

copy_file $DIR/init.lua .config/nvim/init.lua
