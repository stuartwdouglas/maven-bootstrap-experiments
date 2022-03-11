#!/bin/sh

git clone https://github.com/google/guice.git code-checkout
cd code-checkout
git checkout 4.2.2
cd core
mkdir -p target

javac -d target/classes -cp "../../../../dist/lib/*"  `find src/ -name \*.java | \
      grep -v InterceptorBinding.java | \
      grep -v InterceptorBindingProcessor.java | \
      grep -v InterceptorStackCallback.java | \
      grep -v LineNumbers.java | \
      grep -v MethodAspect.java | \
      grep -v ProxyFactory.java | \
      grep -v BytecodeGenTest.java | \
      grep -v IntegrationTest.java | \
      grep -v MethodInterceptionTest.java | \
      grep -v ProxyFactoryTest.java`
jar -c --file target/guice-4.2.2-no_aop.jar -C target/classes .

cp target/guice-4.2.2-no_aop.jar ../../../../dist/lib/
cp ../COPYING ../../../../dist/lib/guice.license
