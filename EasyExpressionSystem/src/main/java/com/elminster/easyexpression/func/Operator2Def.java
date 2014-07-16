package com.elminster.easyexpression.func;

import com.elminster.easyexpression.DataType;
import com.elminster.easyexpression.operator.IOperator;

/**
 * The binary operator.
 * 
 * @author jgu
 * @version 1.0
 */
public class Operator2Def extends FunctionDef {

  public Operator2Def(String name, int priority, DataType result,
      DataType left, DataType right, IOperator operator) {
    super(name, result, new DataType[] {left, right}, operator);
    this.setPriority(priority);
    this.setModule(FunctionModule.MODULE_STANDARD);
  }
}
