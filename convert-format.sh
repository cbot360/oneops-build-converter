#!/bin/sh

while read project; do
  echo $project
  (cd $project; xmllint --format pom.xml > foo.xml; mv foo.xml pom.xml)
done < oneops.txt

xmllint --format pom.xml > foo.xml
mv foo.xml pom.xml
