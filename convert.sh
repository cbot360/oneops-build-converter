#!/bin/sh

./convert-reset.sh
java -jar oneops-coverter.jar
./convert-format.sh
