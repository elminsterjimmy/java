package com.elminster.easyexpression.operator;

import com.elminster.easyexpression.IVariable;

public class LessThanCompareOperator extends CompareOperator {

  public static final IOperator INSTANCE = new LessThanCompareOperator();

  @SuppressWarnings({
      "unchecked", "rawtypes"
  })
  @Override
  protected boolean compare(IVariable leftVariable, IVariable rightVariable) {
    boolean rst = false;
    Object leftValue = leftVariable.getVariableValue();
    Object rightValue = rightVariable.getVariableValue();
    int c = -1;
    if (leftValue instanceof Comparable) {
      c = ((Comparable)leftValue).compareTo(rightValue);
    } else {
      c = (leftValue.toString().compareTo(rightValue.toString()));
    }
    if (0 > c) {
      rst = true;
    }
    return rst;
  }
  
  @Override
  public String getOperatorName() {
    return " < ";
  }
}
