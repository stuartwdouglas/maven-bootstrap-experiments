#!/bin/sh


git clone https://gitbox.apache.org/repos/asf/commons-cli.git code-checkout
cd code-checkout
git checkout cli-1.4

rm -r target
mkdir -p target
javac -d target/classes `find src/main/java -name \*.java`

jar -c --file target/commons-cli-1.4.jar -C target/classes .

cp target/commons-cli-1.4.jar ../../../dist/lib/
cp LICENSE.txt ../../../dist/lib/commons-cli.license





