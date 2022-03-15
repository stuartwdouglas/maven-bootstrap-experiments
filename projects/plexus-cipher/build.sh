#!/bin/sh

git clone https://github.com/codehaus-plexus/plexus-cipher.git code-checkout
cd code-checkout
git checkout plexus-cipher-2.0
mkdir -p target
javac -d target/classes -cp "../../../dist/lib/*" `find src/main/java/ -name \*.java`
jar -c --file target/plexus-cipher-2.0.jar -C target/classes .

cp target/plexus-cipher-2.0.jar ../../../dist/lib/
cp LICENSE.txt ../../../dist/lib/plexus-cipher.license
