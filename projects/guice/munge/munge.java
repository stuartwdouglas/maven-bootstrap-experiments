import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

class munge {

    public static Set<String> EXCLUDES = Set.of("InterceptorBinding.java"
            , "InterceptorBindingProcessor.java"
            , "InterceptorStackCallback.java"
            , "LineNumbers.java"
            , "MethodAspect.java,"
            , "ProxyFactory.java"
            , "BytecodeGenTest.java"
            , "IntegrationTest.java"
            , "MethodInterceptionTest.java"
            , "ProxyFactoryTest.java");

    public static void main(String... args) throws Exception {

        Pattern aop = Pattern.compile("/\\*if\\[AOP]\\*/.*?/*end\\[AOP]\\*/", Pattern.MULTILINE| Pattern.DOTALL);
        Pattern noAop = Pattern.compile("/\\*if\\[NO_AOP](.*?)end\\[NO_AOP]\\*/", Pattern.MULTILINE| Pattern.DOTALL);

        Files.walkFileTree(Paths.get(args[0]), new FileVisitor<Path>() {
            @Override
            public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
                return FileVisitResult.CONTINUE;
            }

            @Override
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                if (file.getFileName().toString().endsWith(".java")) {
                    if (!EXCLUDES.contains(file.getFileName().toString())) {
                        String contents = Files.readString(file);
                        contents = aop.matcher(contents).replaceAll("");
                        contents = noAop.matcher(contents).replaceAll(s -> s.group(1));
                        Files.writeString(file, contents);
                    }
                }
                return FileVisitResult.CONTINUE;
            }

            @Override
            public FileVisitResult visitFileFailed(Path file, IOException exc) throws IOException {
                return FileVisitResult.CONTINUE;
            }

            @Override
            public FileVisitResult postVisitDirectory(Path dir, IOException exc) throws IOException {
                return FileVisitResult.CONTINUE;
            }
        });
    }
}