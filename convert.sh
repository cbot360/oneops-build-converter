#!/bin/sh
dir=`pwd`

# Grab all the separate OneOps repositories and put them in one tree
while read project; do
  echo $project
  git clone git@github.com:oneops/${project}.git
done < oneops.txt

# Provisio files for building distribution archives
cp -r provisio/* $dir

# Convert all the Maven POMs to build as a single Maven project
java -jar oneops-converter.jar

# Format all the POMs to be consistent
while read project; do
  echo $project
  (cd $project; xmllint --format pom.xml > foo.xml; mv foo.xml pom.xml)
done < oneops.txt
xmllint --format pom.xml > foo.xml
mv foo.xml pom.xml
