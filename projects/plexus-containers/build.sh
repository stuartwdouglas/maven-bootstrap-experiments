#!/bin/sh

git clone https://github.com/codehaus-plexus/plexus-containers.git code-checkout
cd code-checkout
git checkout plexus-containers-2.1.0
cd plexus-component-annotations
mkdir -p target
javac -d target/classes -cp "../../../../dist/lib/*" `find src/main/java/ -name \*.java`
jar -c --file target/plexus-component-annotations-2.1.0.jar -C target/classes .

cp target/plexus-component-annotations-2.1.0.jar ../../../../dist/lib/
#cp LICENSE-2.0.txt ../../../../dist/lib/plexus-component-annotations.license
