package com.elminster.retrieve.runnable;

public class SonyPlaystationGameRetriever extends GameRetriever {

  private static final String BASE_URL = "http://www.gamespot.com/sony-playstation/games/?alphaPage=%d&tab=3";
  
  public SonyPlaystationGameRetriever(int startPage, int endPage, int delay) {
    super(startPage, endPage, delay);
  }

  public SonyPlaystationGameRetriever(int startPage, int endPage) {
    super(startPage, endPage);
  }

  public SonyPlaystationGameRetriever(int startPage) {
    super(startPage);
  }

  @Override
  protected String getBaseURL() {
    return BASE_URL;
  }
}
