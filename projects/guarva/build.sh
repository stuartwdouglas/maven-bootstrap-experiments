#!/bin/sh

git clone https://github.com/google/guava.git code-checkout
cd code-checkout
git checkout v25.1
cd android/guava
mkdir -p target
javac -d target/classes `find src -name \*.java`
jar -c --file target/guava-25.1-android.jar target/classes

cp target/guava-25.1-android.jar ../../../../dist/lib/
cp ../LICENSE.txt ../../../../dist/lib/guava.license
