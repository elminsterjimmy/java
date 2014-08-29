package com.elminster.retrieve.runnable;

public class MicrosoftXBoxGameRetriever extends GameRetriever {

  private static final String BASE_URL = "http://www.gamespot.com/microsoft-xbox/games/?page=%d&tab=1";
  
  public MicrosoftXBoxGameRetriever(int startPage, int endPage, int delay) {
    super(startPage, endPage, delay);
  }

  public MicrosoftXBoxGameRetriever(int startPage, int endPage) {
    super(startPage, endPage);
  }

  public MicrosoftXBoxGameRetriever(int startPage) {
    super(startPage);
  }

  @Override
  protected String getBaseURL() {
    return BASE_URL;
  }

}
