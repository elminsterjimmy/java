package com.elminster.retrieve.util;

import com.elminster.easydao.db.manager.DAOSupportSessionFactory;
import com.elminster.easydao.db.manager.DAOSupportSessionFactoryManager;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

public class SessionFactoryUtil {

  private static String factoryId;
  
  private static SessionFactoryUtil instance = new SessionFactoryUtil();
  
  private void init() {
    MysqlDataSource ds = new MysqlDataSource();
    ds.setUrl("jdbc:mysql://localhost:3306/test");
    ds.setUser("root");
    ds.setPassword("root");
    DAOSupportSessionFactory sessionFactory = new DAOSupportSessionFactory(ds);
    DAOSupportSessionFactoryManager.getSessionManager().putSessionFactory(
        sessionFactory);
    factoryId = sessionFactory.getFactoryId();
  }
  
  private SessionFactoryUtil() {
    init();
  }
  
  public static SessionFactoryUtil getInstance() {
    return instance;
  }
  
  public DAOSupportSessionFactory getSessionFactory() {
    return DAOSupportSessionFactoryManager.getSessionManager().getSessionFactory(factoryId);
  }
}
