package com.elminster.retrieve.client;

import org.apache.log4j.xml.DOMConfigurator;

import com.elminster.retrieve.runnable.SonyPlaystationGameRetriever;

/**
 * The retrieve client.
 * 
 * @author jgu
 * @version 1.0
 */
public class RetrieveClient {

  /**
   * @param args
   */
  public static void main(String[] args) {
    DOMConfigurator.configure("log4j.xml");
    Runnable runnable = new SonyPlaystationGameRetriever(1);
    Thread t = new Thread(runnable);
    t.start();
  }

}
