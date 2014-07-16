package com.elminster.easyexpression.operator;

import java.util.Stack;

import com.elminster.easyexpression.evaluate.IResult;
import com.elminster.easyexpression.exception.OperateException;

/**
 * The interface of operator.
 * 
 * @author jgu
 * @version 1.0
 */
public interface IOperator {
  /**
   * Get the operator name.
   * @return the operator name
   */
  public String getOperatorName();

  /**
   * Operate the stack.
   * @param stack the stack
   * @return the operate result
   */
  public IResult operate(Stack<Object> stack) throws OperateException;
}
