#!/bin/sh

while read project; do
  echo $project
  (cd $project; git pull)
done < oneops.txt
