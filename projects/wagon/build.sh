#!/bin/sh

git clone https://github.com/qos-ch/slf4j.git code-checkout
cd code-checkout
git checkout v_1.7.32
cd slf4j-api
mkdir -p target
javac -d target/classes `find src/main/java/ -name \*.java`
jar -c --file target/slf4j-api-1.7.32.jar -C target/classes .

cp target/slf4j-api-1.7.32.jar ../../../../dist/lib/
cp ../LICENSE.txt ../../../../dist/lib/slf4j-api.license
