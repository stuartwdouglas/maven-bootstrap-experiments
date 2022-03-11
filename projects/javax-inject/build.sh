#!/bin/sh

git clone https://github.com/javax-inject/javax-inject.git code-checkout
cd code-checkout
git checkout 1
mkdir -p target
javac -d target/classes `find src -name \*.java`
jar -c --file target/javax.inject-1.jar target/classes

cp target/javax.inject-1.jar ../../../dist/lib/
cp ../../../ASL-2.txt ../../../dist/lib/
