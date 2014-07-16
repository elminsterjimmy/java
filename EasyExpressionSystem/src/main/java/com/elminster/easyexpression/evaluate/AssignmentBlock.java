package com.elminster.easyexpression.evaluate;

public class AssignmentBlock extends Block {

  public AssignmentBlock(Block parent) {
    super(parent);
  }

  @Override
  public String getOperatorName() {
    return "AssignmentBlock";
  }
}
