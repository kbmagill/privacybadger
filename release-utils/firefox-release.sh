#!/bin/bash

set -e
cd "$(dirname "$0")"

if [ $# -ne 1 ] ; then
  echo "Usage: $0 <version to release>"
  exit 1
fi
TARGET=$1

if ! git show release-"$TARGET" > /dev/null 2> /dev/null ; then
  echo "$TARGET is not a valid git target"
  exit 1
fi

if ! ./make-signed-xpi.sh "$TARGET" ; then
  echo "Failed to build target $TARGET XPI"
  exit 1
fi
