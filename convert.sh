#!/bin/sh
dir=`pwd`
./convert-reset.sh
cp -r provisio/* $dir
java -jar oneops-converter.jar
./convert-format.sh
