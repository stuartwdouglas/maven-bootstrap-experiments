#!/bin/sh

git clone https://github.com/eclipse/sisu.inject.git code-checkout
cd code-checkout
git checkout releases/0.3.5
cd org.eclipse.sisu.inject
mkdir -p target
javac -d target/classes -cp "../../../../dist/lib/*" `find src -name \*.java`
jar -c --file target/org.eclipse.sisu.inject-0.3.5.jar -C target/classes .

cp target/org.eclipse.sisu.inject-0.3.5.jar ../../../../dist/lib/
cp ../LICENSE.txt ../../../../dist/lib/org.eclipse.sisu.inject.license
