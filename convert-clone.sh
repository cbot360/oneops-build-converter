#!/bin/sh

while read project; do
  echo $project
  git clone https://github.com/oneops/${project}.git
done < oneops.txt
