package com.elminster.retrieve.runnable;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.URI;
import org.apache.commons.httpclient.methods.GetMethod;

import com.elminster.retrieve.parser.GameParser;
import com.elminster.retrieve.parser.GameSpotLinksParser;
import com.elminster.retrieve.parser.IGameSpotLinkParser;

/**
 * Get game information from gamespot.com .
 * 
 * @author jgu
 * @version 1.0
 */
public abstract class GameRetriever extends BaseRetriever {

  protected int startPage;

  protected int endPage;
  
  private IGameSpotLinkParser gamespotLinkParser;
  
  public GameRetriever(int startPage, int endPage, int delay) {
    super(delay);
    this.startPage = startPage;
    this.endPage = endPage;
    this.gamespotLinkParser = new GameSpotLinksParser();
    this.subjectParser = new GameParser();
  }

  public GameRetriever(int startPage, int endPage) {
    super();
    this.startPage = startPage;
    this.endPage = endPage;
    this.gamespotLinkParser = new GameSpotLinksParser();
    this.subjectParser = new GameParser();
  }

  public GameRetriever(int startPage) {
    this(startPage, startPage);
  }

  abstract protected String getBaseURL();

  /**
   * {@inheritDoc}
   */
  @Override
  protected List<String> getURL() {
    HttpClient client = new HttpClient();
    HttpMethod method = new GetMethod();
    String baseURL = this.getBaseURL();
    List<String> urlList = new ArrayList<String>();
    try {
      for (int i = startPage; i <= endPage; i++) {
        String url = String.format(baseURL, i);
        method.setURI(new URI(url, false));
        client.executeMethod(method);
        String response = method.getResponseBodyAsString();
        int status = method.getStatusCode();
        if (200 != status) {
          System.err.println(url + ":" + status);
        } else {
          urlList.addAll(gamespotLinkParser.parserLinks(response));
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return urlList;
  }
}
