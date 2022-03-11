#!/bin/sh

git clone https://github.com/codehaus-plexus/plexus-classworlds.git code-checkout
cd code-checkout
git checkout plexus-classworlds-2.6.0
mkdir -p target
javac -d target/classes `find src/main/java/ -name \*.java`
jar -c --file target/plexus-classworlds-2.6.0.jar -C target/classes .

cp target/plexus-classworlds-2.6.0.jar ../../../dist/boot/
cp LICENSE-2.0.txt ../../../dist/boot/plexus-classworlds.license
