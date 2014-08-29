package com.elminster.retrieve.runnable;

public class PCGameRetriever extends GameRetriever {

  private static final String BASE_URL = "http://www.gamespot.com/pc/games/?page=%d&tab=1";
  
  public PCGameRetriever(int startPage, int endPage, int delay) {
    super(startPage, endPage, delay);
  }

  public PCGameRetriever(int startPage, int endPage) {
    super(startPage, endPage);
  }

  public PCGameRetriever(int startPage) {
    super(startPage);
  }

  @Override
  protected String getBaseURL() {
    return BASE_URL;
  }

}
