package com.elminster.retrieve.util;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.elminster.common.util.CollectionUtil;
import com.elminster.retrieve.data.IGame;
import com.elminster.retrieve.entity.DevPubEntity;
import com.elminster.retrieve.entity.GameEntity;
import com.elminster.retrieve.entity.GenresEntity;
import com.elminster.retrieve.entity.PlatformEntity;
import com.elminster.retrieve.entity.ReleaseDateEntity;

public class BeanUtil {

  public static GameEntity convert2GameEntity(IGame game) {
    GameEntity entity = new GameEntity();
    
    entity.setTitle(game.getTitle());
    entity.setOriginTitle(game.getOriginTitle());
    entity.setUrl(game.getUrl());
    entity.setImageUrl(game.getImageUrl());
    entity.setSummary(game.getSummary());
    
    entity.setDevelopedBy(convert2DevPubEntity(game.getDevelopedBy()));
    entity.setPublishedBy(convert2DevPubEntity(game.getPublishedBy()));
    entity.setPlatforms(convert2PlatformEntity(game.getPlatforms()));
    entity.setGenres(convert2GenresEntity(game.getGenres()));
    entity.setReleaseDate(convert2ReleaseDateEntity(game.getReleaseDate()));
    
    return entity;
  }
  
  public static List<ReleaseDateEntity> convert2ReleaseDateEntity(List<java.util.Date> list) {
    List<ReleaseDateEntity> rtn = new ArrayList<>();
    if (CollectionUtil.isNotEmpty(list)) {
      for (java.util.Date date : list) {
        ReleaseDateEntity entity = new ReleaseDateEntity();
        entity.setReleaseDate(new Date(date.getTime()));
        rtn.add(entity);
      }
    }
    return rtn;
  }
  
  public static List<GenresEntity> convert2GenresEntity(List<String> list) {
    List<GenresEntity> rtn = new ArrayList<>();
    if (CollectionUtil.isNotEmpty(list)) {
      for (String s : list) {
        GenresEntity entity = new GenresEntity();
        entity.setName(s);
        rtn.add(entity);
      }
    }
    return rtn;
  }
  
  public static List<PlatformEntity> convert2PlatformEntity(List<String> list) {
    List<PlatformEntity> rtn = new ArrayList<>();
    if (CollectionUtil.isNotEmpty(list)) {
      for (String s : list) {
        PlatformEntity entity = new PlatformEntity();
        entity.setName(s);
        rtn.add(entity);
      }
    }
    return rtn;
  }
  
  public static List<DevPubEntity> convert2DevPubEntity(List<String> list) {
    List<DevPubEntity> rtn = new ArrayList<>();
    if (CollectionUtil.isNotEmpty(list)) {
      for (String s : list) {
        DevPubEntity entity = new DevPubEntity();
        entity.setName(s);
        rtn.add(entity);
      }
    }
    return rtn;
  }
}
