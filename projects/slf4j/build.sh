#!/bin/sh
#!/bin/sh
. ../common.sh
REPO=https://github.com/qos-ch/slf4j.git
TAG=v_1.7.32
JAR=slf4j-api-1.7.32.jar
BUILD_PATH=slf4j-api
LICENSE_TARGET_NAME=slf4j-api.license
LICENSE_FILE=../LICENSE.txt

build

JAR=jcl-over-slf4j-1.7.32.jar
BUILD_PATH=jcl-over-slf4j
LICENSE_TARGET_NAME=jcl-over-slf4j.license

build_jar

