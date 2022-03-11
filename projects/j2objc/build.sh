#!/bin/sh


git clone https://github.com/google/j2objc.git code-checkout
cd code-checkout
git checkout 1.1

cd annotations
rm -r target
mkdir -p target
javac -d target/classes `find src -name \*.java`

jar -c --file target/j2objc.jar -C target/classes .

cp target/j2objc.jar ../../../../lib/




