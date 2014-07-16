package com.elminster.retrieve.runnable;

import java.io.IOException;
import java.util.List;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.URI;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.elminster.retrieve.data.ISubject;
import com.elminster.retrieve.exception.ParserException;
import com.elminster.retrieve.parser.ISubjectParser;

/**
 * The base retriever.
 * 
 * @author jgu
 * @version 1.0
 */
public abstract class BaseRetriever implements Runnable {
  
  /** the default delay. */
  private static final int DEFAULT_DELAY = 100;
  
  /** the logger. */
  private static final Log logger = LogFactory.getLog(BaseRetriever.class);

  /** the delay time. */
  private int delay;
  
  /** the subject parser. */
  protected ISubjectParser subjectParser;
  
  /**
   * Constructor.
   */
  public BaseRetriever() {
    this(DEFAULT_DELAY);
  }
  
  /**
   * Constructor.
   * @param delay the delay
   */
  public BaseRetriever(int delay) {
    this.delay = delay;
  }
  
  /**
   * Get the URL.
   * @return the URL
   */
  abstract protected List<String> getURL();

  /**
   * {@inheritDoc}
   */
  @Override
  public void run() {
    HttpClient client = new HttpClient();  
    HttpMethod method = new GetMethod();
    for (String url : getURL()) {
      try {
        method.setURI(new URI(url, false));
        client.executeMethod(method);
        int status = method.getStatusCode();
        if (200 != status) {
          logger.warn(url + ":" + status);
        } else {
          String response = method.getResponseBodyAsString();
          ISubject subject = subjectParser.parserSubject(response);
        }
        // deal with html
        Thread.sleep(delay);
      } catch (NullPointerException | IOException | InterruptedException | ParserException e) {
        throw new RuntimeException(e);
      }
    }
  }

}
