#!/bin/sh


git clone https://github.com/google/error-prone.git code-checkout
cd code-checkout
git checkout v2.1.3

cd annotations
rm -r target
mkdir -p target
javac -d target/classes `find src -name \*.java`

jar -c --file target/error-prone-2.1.3.jar -C target/classes .

cp target/error-prone-2.1.3.jar ../../../../lib/




