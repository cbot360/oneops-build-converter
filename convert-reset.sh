#!/bin/sh

while read project; do
  echo $project
  (cd $project; git reset --hard head)
done < oneops.txt

cp pom.xml.template pom.xml
