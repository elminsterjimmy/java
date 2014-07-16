package com.elminster.retrieve.runnable;

import java.util.ArrayList;
import java.util.List;

/**
 * The movie retriever.
 * 
 * @author jgu
 * @version 1.0
 */
public class MovieRetriever extends BaseRetriever {
  
  /** the URL of the API. */
  private static final String URL = "http://www.douban.com/v2/movie/subject/%d";

  private int startId;
  
  private int endId;
  
  public MovieRetriever(int startId, int endId, int delay) {
    super(delay);
    this.startId = startId;
    this.endId = endId;
  }

  public MovieRetriever(int startId, int endId) {
    super();
    this.startId = startId;
    this.endId = endId;
  }

  public MovieRetriever(int startId) {
    this(startId, startId);
  }

  /**
   * {@inheritDoc}
   */
  @Override
  protected List<String> getURL() {
    List<String> list = new ArrayList<String>(endId - startId + 1);
    for (int i = startId; i <= endId; i++) {
      list.add(String.format(URL, i));
    }
    return list;
  }
}
