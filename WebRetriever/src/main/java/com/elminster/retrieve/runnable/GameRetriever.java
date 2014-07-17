package com.elminster.retrieve.runnable;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.URI;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.elminster.easydao.db.manager.DAOSupportManager;
import com.elminster.easydao.db.manager.DAOSupportSession;
import com.elminster.easydao.db.manager.DAOSupportSessionFactory;
import com.elminster.retrieve.dao.IGameInfoDao;
import com.elminster.retrieve.data.IGame;
import com.elminster.retrieve.data.ISubject;
import com.elminster.retrieve.parser.GameParser;
import com.elminster.retrieve.parser.GameSpotLinksParser;
import com.elminster.retrieve.parser.IGameSpotLinkParser;
import com.elminster.retrieve.service.GameInfoService;
import com.elminster.retrieve.service.IGameInfoService;
import com.elminster.retrieve.util.SessionFactoryUtil;

/**
 * Get game information from gamespot.com .
 * 
 * @author jgu
 * @version 1.0
 */
public abstract class GameRetriever extends BaseRetriever {
  
  private static final Log logger = LogFactory.getLog(GameRetriever.class);

  protected int startPage;

  protected int endPage;
  
  private IGameSpotLinkParser gamespotLinkParser;
  
  private IGameInfoService service;
  
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
  
  public void setGameInfoService(IGameInfoService service) {
    this.service = service;
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
        int status = method.getStatusCode();
        if (200 != status) {
          logger.warn(url + ":" + status);
        } else {
          String response = method.getResponseBodyAsString();
          urlList.addAll(gamespotLinkParser.parserLinks(response));
        }
      }
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
    return urlList;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  protected void dealWithSubject(ISubject subject) {
    DAOSupportSessionFactory sessionFactory = SessionFactoryUtil.getInstance().getSessionFactory();
    DAOSupportSession session = null;
    try {
      session = sessionFactory.popDAOSupportSession();
      DAOSupportManager.getInstance().setSession(session);
      session.beginTransaction();
      service.addGameInfo((IGame) subject);
      session.endTransaction();
    } catch (Exception e) {
      throw new RuntimeException(e);
    } finally {
      if (null != session) {
        try {
          sessionFactory.pushDAOSupportSession(session);
        } catch (SQLException e) {
          throw new RuntimeException(e);
        }
      }
    }
  }
}
