package com.elminster.retrieve.dao;

import com.elminster.easydao.db.annotation.DAO;
import com.elminster.retrieve.entity.GameEntity;

@DAO
public interface IGameInfoDao {

  public int insert(GameEntity bean);
}
