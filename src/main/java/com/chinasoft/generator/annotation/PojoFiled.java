package com.chinasoft.generator.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface PojoFiled {
    boolean isPrimaryKey() default false;
    String column();
    String mysqlType() default "varchar";
}
