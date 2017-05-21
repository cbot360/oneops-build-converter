#!/bin/sh

rm -f merge.txt > /dev/null 2>&1
rm -rf merged-repo > /dev/null 2>&1
while read project; do
  remote=git@github.com:oneops/${project}.git
  echo "$remote:$project" >> merge.txt
done < oneops.txt
./git-merge-repos/run.sh `cat merge.txt`
