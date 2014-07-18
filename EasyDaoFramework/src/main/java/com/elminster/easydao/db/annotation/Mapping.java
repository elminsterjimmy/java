package com.elminster.easydao.db.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.elminster.easydao.db.mapping.DeletePolicy;
import com.elminster.easydao.db.mapping.InsertPolicy;
import com.elminster.easydao.db.mapping.MappingPolicy;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Mapping {

  MappingPolicy mappingPolicy();
  DeletePolicy deletePolicy() default DeletePolicy.NONE;
  InsertPolicy insertPolicy() default InsertPolicy.DIRECT_INSERT;
  String intermediaryTable() default "";
  String[] intermediaryControlColumn() default "";
  String[] intermediaryUncontrolColumn() default "";
  Class<?> entity();
}
