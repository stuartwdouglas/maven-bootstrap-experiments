#!/bin/sh

rm -r dist
mkdir -p dist/boot
mkdir -p dist/lib
mkdir -p dist/bin
mkdir -p dist/conf

build_project () {
cd $1
./build.sh
cd ..
}


cd projects

build_project plexus-classworlds
build_project javax-inject
build_project slf4j
build_project guice
build_project sisu