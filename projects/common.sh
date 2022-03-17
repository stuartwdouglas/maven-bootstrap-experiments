BUILD_PATH=.
LICENSE_FILE=LICENSE.txt
checkout () {
  git clone $1 code-checkout
}

build_jar() {

    CUR=`pwd`
    cd code-checkout
    cd $BUILD_PATH
    rm -r target
    mkdir -p target
    javac  -cp "$CUR/../../dist/lib/*" -d target/classes `find src/main/java -name \*.java`
    jar -c --file target/$JAR -C target/classes .
    cp target/$JAR $CUR/../../dist/lib/
    cp $LICENSE_FILE $CUR/../../dist/lib/$LICENSE_TARGET_NAME
    cd $CUR
}

build () {
    CUR=`pwd`
    checkout $REPO
    cd code-checkout
    git checkout $TAG
    cd ..
    build_jar
    cd ..
    cd $CUR
}

