package com.elminster.retrieve.client;

import org.apache.log4j.xml.DOMConfigurator;

import com.elminster.easydao.db.manager.DAOSupportManager;
import com.elminster.retrieve.dao.IGameInfoDao;
import com.elminster.retrieve.runnable.GameRetriever;
import com.elminster.retrieve.runnable.SonyPlaystationGameRetriever;
import com.elminster.retrieve.service.GameInfoService;
import com.elminster.retrieve.service.IGameInfoService;

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
    GameRetriever gameRetriever = new SonyPlaystationGameRetriever(1);
    IGameInfoService service = new GameInfoService();
    IGameInfoDao dao = (IGameInfoDao) DAOSupportManager.getInstance().getDAO(IGameInfoDao.class);
    ((GameInfoService) service).setDao(dao);
    gameRetriever.setGameInfoService(service);
    Thread t = new Thread(gameRetriever);
    t.start();
  }

}
