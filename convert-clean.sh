#!/bin/sh

while read project; do
  echo $project
  rm -rf $project
done < oneops.txt
rm -f pom.xml
