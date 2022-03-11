#!/bin/sh

git clone https://github.com/google/guava.git code-checkout
cd code-checkout
git checkout v25.1
cd android/guava
mkdir -p target

javac -Xlint:none  -cp "../../../../../lib/*" -d target/classes ../../../ParametersAreNonnullByDefault.java ../../../IgnoreJRERequirement.java `find src -name \*.java`
jar -c --file target/guava-25.1-android.jar -C target/classes .

cp target/guava-25.1-android.jar ../../../../../dist/lib/
cp ../../COPYING ../../../../../dist/lib/guava.license
