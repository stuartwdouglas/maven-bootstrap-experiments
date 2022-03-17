BUILD_PATH=.
LICENSE_FILE=LICENSE.txt
checkout () {
  git clone $1 code-checkout
  cd code-checkout
}


build () {
    CUR=`pwd`
    checkout $REPO
    git checkout $TAG
    cd $BUILD_PATH

    rm -r target
    mkdir -p target
    javac -d target/classes `find src/main/java -name \*.java`
    jar -c --file target/$JAR -C target/classes .
    cp target/$JAR $CUR/../../dist/lib/
    cp $LICENSE_FILE $CUR/../../dist/lib/$LICENSE_TARGET_NAME
}
