#!/bin/sh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh

SOURCE=$DIR/dot-editorconfig
TARGET=.editorconfig

copy_file $SOURCE $TARGET
