package javax.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;


//hack, as there seems to be no authorative source for this
@Documented
@Retention(RetentionPolicy.RUNTIME)
public @interface ParametersAreNonnullByDefault {
}