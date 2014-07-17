package com.elminster.retrieve.service;

import com.elminster.retrieve.dao.IGameInfoDao;
import com.elminster.retrieve.data.IGame;
import com.elminster.retrieve.entity.GameEntity;
import com.elminster.retrieve.util.BeanUtil;

public class GameInfoService implements IGameInfoService {

  private IGameInfoDao dao;
  
  public GameInfoService() {
    
  }

  public void setDao(IGameInfoDao dao) {
    this.dao = dao;
  }

  @Override
  public int addGameInfo(IGame game) {
    GameEntity entity = BeanUtil.convert2GameEntity(game);
    return dao.insert(entity);
  }
}
