#!/bin/sh

rm -r dist lib
mkdir -p dist/boot
mkdir -p dist/lib
mkdir -p dist/bin
mkdir -p dist/conf
mkdir lib

build_project () {
echo "--------- BUILD $1 -----------"
cd $1
./build.sh
cd ..
}


cd projects

build_project commons-cli
build_project commons-io
build_project commons-lang3
build_project javax-inject
build_project checkerframework
build_project errorprone
build_project j2objc
build_project guarva
build_project plexus-classworlds
build_project slf4j
build_project guice
build_project sisu
build_project plexus-cipher
build_project plexus-containers
build_project plexus-interpolation
