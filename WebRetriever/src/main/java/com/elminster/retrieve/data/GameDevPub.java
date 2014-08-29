package com.elminster.retrieve.data;

import com.elminster.common.util.ObjectUtil;

public class GameDevPub implements IGameDevPub {
  
  private String devPubName;
  
  private String devPubUrl;

  /**
   * @param devPubName the devPubName to set
   */
  public void setDevPubName(String devPubName) {
    this.devPubName = devPubName;
  }

  /**
   * @param devPubUrl the devPubUrl to set
   */
  public void setDevPubUrl(String devPubUrl) {
    this.devPubUrl = devPubUrl;
  }

  @Override
  public String getDevPubName() {
    return devPubName;
  }

  @Override
  public String getDevPubUrl() {
    return devPubUrl;
  }

  @Override
  public String toString() {
    return ObjectUtil.buildToStringByReflect(this);
  }
}
