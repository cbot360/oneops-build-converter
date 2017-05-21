#!/bin/sh

dir=`pwd`
oneops=`pwd`/oneops

rm -f merge.txt > /dev/null 2>&1
rm -rf $oneops > /dev/null 2>&1
while read project; do
  remote=git@github.com:oneops/${project}.git
  echo "$remote:$project" >> merge.txt
done < oneops.txt
./git-merge-repos/run.sh `cat merge.txt`

# Parent POM template
cp pom.xml.template $oneops

# Provisio files for building distribution archives
cp -r provisio/* $oneops
# Oneops Distribution
cp -r oneops-distribution $oneops
(cd $oneops; git add .; git commit -m 'Add provisio distribution mechanism.')

# Convert all the Maven POMs to build as a single Maven project
java -jar oneops-converter.jar $oneops
rm $oneops/pom.xml.template
(cd $oneops; git add .; git commit -m 'Align all OneOps pom.xml files.')

(
cd $oneops
# Format all the POMs to be consistent
while read project; do
  echo $project
  (cd $project; xmllint --format pom.xml > foo.xml; mv foo.xml pom.xml)
done < $dir/oneops.txt
xmllint --format pom.xml > foo.xml
mv foo.xml pom.xml
git add .; git commit -m 'Format all OneOps pom.xml files.'
)

cp -r .mvn $oneops
cp mvnw $oneops
cp mvnw.cmd $oneops
(cd $oneops; git add .; git commit -m 'Add Maven Wrapper.')
