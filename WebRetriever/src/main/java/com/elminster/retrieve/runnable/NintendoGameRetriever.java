package com.elminster.retrieve.runnable;

public class NintendoGameRetriever extends GameRetriever {

  private static final String BASE_URL = "http://www.gamespot.com/nintendo/games/?page=%d&tab=1";
  
  public NintendoGameRetriever(int startPage, int endPage, int delay) {
    super(startPage, endPage, delay);
  }

  public NintendoGameRetriever(int startPage, int endPage) {
    super(startPage, endPage);
  }

  public NintendoGameRetriever(int startPage) {
    super(startPage);
  }

  @Override
  protected String getBaseURL() {
    return BASE_URL;
  }

}
