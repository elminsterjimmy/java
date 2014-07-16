package com.elminster.easyexpression.evaluate;

import com.elminster.easyexpression.func.FunctionDef;

public interface IEvaluater {

  public void addVariable(String variableName, Object value);

  public void setVariableValue(String variableName, Object value);
  
  public void addFunction(String funcName, FunctionDef func);

  public Object evaluate(String expression);
}
