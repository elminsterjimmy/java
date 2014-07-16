package com.elminster.easyexpression.func;

import com.elminster.easyexpression.DataType;
import com.elminster.easyexpression.operator.AndOperator;
import com.elminster.easyexpression.operator.DivOperator;
import com.elminster.easyexpression.operator.EqualCompareOperator;
import com.elminster.easyexpression.operator.GreaterEqualThanCompareOperator;
import com.elminster.easyexpression.operator.GreaterThanCompareOperator;
import com.elminster.easyexpression.operator.LessEqualThanCompareOperator;
import com.elminster.easyexpression.operator.LessThanCompareOperator;
import com.elminster.easyexpression.operator.MinusOperator;
import com.elminster.easyexpression.operator.NotEqualCompareOperator;
import com.elminster.easyexpression.operator.OrOperator;
import com.elminster.easyexpression.operator.PLSOperator;
import com.elminster.easyexpression.operator.PlusOperator;
import com.elminster.easyexpression.operator.SubOperator;

public class StandardOperation {
  public static final Operator1Def MINUS = new Operator1Def("-", 13, DataType.OBJECT, DataType.OBJECT, MinusOperator.INSTANCE);
  public static final Operator2Def EQ = new Operator2Def("=", 9, DataType.OBJECT, DataType.OBJECT, DataType.BOOLEAN, EqualCompareOperator.INSTANCE);
  public static final Operator2Def GET = new Operator2Def(">=", 9, DataType.OBJECT, DataType.OBJECT, DataType.BOOLEAN, GreaterEqualThanCompareOperator.INSTANCE);
  public static final Operator2Def GT = new Operator2Def(">", 9, DataType.OBJECT, DataType.OBJECT, DataType.BOOLEAN, GreaterThanCompareOperator.INSTANCE);
  public static final Operator2Def LET = new Operator2Def("<=", 9, DataType.OBJECT, DataType.OBJECT, DataType.BOOLEAN, LessEqualThanCompareOperator.INSTANCE);
  public static final Operator2Def LT = new Operator2Def("<", 9, DataType.OBJECT, DataType.OBJECT, DataType.BOOLEAN, LessThanCompareOperator.INSTANCE);
  public static final Operator2Def NEQ1 = new Operator2Def("<>", 9, DataType.OBJECT, DataType.OBJECT, DataType.BOOLEAN, NotEqualCompareOperator.INSTANCE);
  public static final Operator2Def NEQ2 = new Operator2Def("!=", 9, DataType.OBJECT, DataType.OBJECT, DataType.BOOLEAN, NotEqualCompareOperator.INSTANCE);
  public static final Operator2Def AND = new Operator2Def("and", 8, DataType.OBJECT, DataType.OBJECT, DataType.BOOLEAN, AndOperator.INSTANCE);
  public static final Operator2Def OR = new Operator2Def("or", 7, DataType.OBJECT, DataType.OBJECT, DataType.BOOLEAN, OrOperator.INSTANCE);
  public static final Operator2Def PLUS = new Operator2Def("+", 10, DataType.OBJECT, DataType.OBJECT, DataType.OBJECT, PlusOperator.INSTANCE);
  public static final Operator2Def SUB = new Operator2Def("-", 10, DataType.OBJECT, DataType.OBJECT, DataType.OBJECT, SubOperator.INSTANCE);
  public static final Operator2Def PLS = new Operator2Def("*", 11, DataType.OBJECT, DataType.OBJECT, DataType.OBJECT, PLSOperator.INSTANCE);
  public static final Operator2Def DIV = new Operator2Def("/", 11, DataType.OBJECT, DataType.OBJECT, DataType.OBJECT, DivOperator.INSTANCE);
}
