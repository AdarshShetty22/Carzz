package com.validator;

import java.lang.annotation.Annotation;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

@Documented
@Constraint(validatedBy={UsernameValidator.class})
@Target({java.lang.annotation.ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface IsUnique
{
  String message() default "Email is  already Being Used";
  
  Class<?>[] groups() default {};
  
  Class<? extends Payload>[] payload() default {};
}
