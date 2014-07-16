package com.elminster.easyexpression.operator;

import java.util.Stack;

import com.elminster.easyexpression.DataType;
import com.elminster.easyexpression.IVariable;
import com.elminster.easyexpression.evaluate.IResult;
import com.elminster.easyexpression.evaluate.OperationResult;
import com.elminster.easyexpression.exception.OperateException;

public class MinusOperator implements IOperator {
  
  public static final IOperator INSTANCE = new MinusOperator();

  @Override
  public String getOperatorName() {
    return "-";
  }

  @Override
  public IResult operate(Stack<Object> stack) {
    IVariable val = (IVariable) stack.peek();
    DataType dt = val.getVariableType();

    Object obj = val.getVariableValue();
    if (null == obj) {
      throw new OperateException("the operand cannot be null.");
    }
    String command = getOperatorName() + String.valueOf(val.getVariableValue());
    IVariable rst = null;
    if (DataType.INTEGER.equals(dt)) {
      Integer i = (Integer) obj;
      val.setVariableValue(-i);
    } else if (DataType.LONG.equals(dt)) {
      Long l = (Long) obj;
      val.setVariableValue(-l);
    } else if (DataType.DOUBLE.equals(dt)) {
      Double d = (Double) obj;
      val.setVariableValue(-d);
    } else {
      throw new OperateException("cannot process current operation: " + command);
    }
    return new OperationResult(command, rst);
  }

}
