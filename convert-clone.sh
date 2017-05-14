#!/bin/sh

while read project; do
  echo $project
  git clone git@github.com:oneops/${project}.git
done < oneops.txt
