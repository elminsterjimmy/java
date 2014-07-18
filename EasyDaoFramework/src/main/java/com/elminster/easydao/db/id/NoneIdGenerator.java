package com.elminster.easydao.db.id;

import java.io.Serializable;

import com.elminster.easydao.db.annotation.util.AnnotationUtil;
import com.elminster.easydao.db.manager.DAOSupportSession;

public class NoneIdGenerator implements IdGenerator {
  
  private Serializable[] lastId;
  
  @Override
  public Serializable[] generate(DAOSupportSession session, Object obj) throws IdGenerateException {
    Object[] keyValues = AnnotationUtil.getKeyValue(obj);
    lastId = (Serializable[]) keyValues;
    return lastId;
  }

  @Override
  public Serializable[] lastId() throws IdGenerateException {
    return lastId;
  }

}
