#!/bin/sh

copy_source () {
  for i in `find . -path $1`
  do
    mkdir -p  ../checker-qual/`dirname $i`
    cp $i ../checker-qual/$i
  done
}

copy_all_source() {
  cd $1 || exit
  copy_source FormatUtil.java
  copy_source NullnessUtil.java
  copy_source RegexUtil.java
  copy_source UnitsTools.java
  copy_source */compatqual/*.java
  cd ../
}


git clone https://github.com/typetools/checker-framework.git code-checkout
cd code-checkout
git checkout checker-framework-2.0.0

mkdir checker-qual

copy_all_source checker
copy_all_source dataflow
copy_all_source framework

cd checker-qual
rm -r target
mkdir -p target
javac -d target/classes `find src -name \*.java`

jar -c --file target/code-checker-qual-2.0.0.jar -C target/classes .

cp target/code-checker-qual-2.0.0.jar ../../../../lib/




