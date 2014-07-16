package com.elminster.easyexpression.func;

import com.elminster.easyexpression.DataType;
import com.elminster.easyexpression.operator.IOperator;

/**
 * The unary operator.
 * 
 * @author jgu
 * @version 1.0
 */
public class Operator1Def extends FunctionDef {

  public Operator1Def(String name, int priority, DataType result,
      DataType left, IOperator operator) {
    super(name, result, new DataType[] {left}, operator);
    this.setPriority(priority);
    this.setModule(FunctionModule.MODULE_STANDARD);
  }
}
