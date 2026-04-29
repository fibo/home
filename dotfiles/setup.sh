#!/bin/sh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh

SOURCE=$DIR/ripgreprc
TARGET=.ripgreprc
copy_file $SOURCE $TARGET

