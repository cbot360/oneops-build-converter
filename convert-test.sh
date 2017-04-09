#!/bin/sh
./convert-clean.sh
./convert-clone.sh
./convert.sh
./mvnw clean package
