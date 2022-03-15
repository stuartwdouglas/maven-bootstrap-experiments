#!/bin/sh

git clone https://github.com/codehaus-plexus/plexus-interpolation.git code-checkout
cd code-checkout
git checkout plexus-interpolation-1.26
mkdir -p target
javac -d target/classes -cp "../../../dist/lib/*" `find src/main/java/ -name \*.java`
jar -c --file target/plexus-interpolation-1.26.jar -C target/classes .

cp target/plexus-interpolation-1.26.jar ../../../dist/lib/
#cp LICENSE.txt ../../../dist/lib/plexus-interpolation.license
