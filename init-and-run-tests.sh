#!/bin/bash
set -e

GODOT_VERSION=$1

# Unit test path
if [ -z "$2" ]
then
  UNIT_TEST_PATH="res://tests/unit"
else
  UNIT_TEST_PATH=$2
fi

# Integration test path
if [ -z "$3" ]
then
  INTEGRATION_TEST_PATH=""
else
  INTEGRATION_TEST_PATH=",$3"
fi

# Download Godot
wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip

# Unzip it
unzip Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip
mv Godot_v${GODOT_VERSION}-stable_linux_headless.64 /usr/local/bin/godot

#
# Launch the tests
#

# This is needed to test this Docker image
if [ -f "test-project/project.godot" ]
then
  cd test-project
fi

echo UNIT_TEST_PATH = $UNIT_TEST_PATH
echo INTEGRATION_TEST_PATH = $INTEGRATION_TEST_PATH

/usr/local/bin/godot -d -s --path $PWD addons/gut/gut_cmdln.gd -gexit -gdir=$UNIT_TEST_PATH,$INTEGRATION_TEST_PATH
