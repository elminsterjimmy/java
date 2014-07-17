package com.elminster.retrieve.entity;

import java.util.List;

import com.elminster.common.util.ObjectUtil;
import com.elminster.easydao.db.annotation.Entity;

@Entity(tableName="t_game_info")
public class GameEntity extends SubjectEntity {

  private List<PlatformEntity> platforms;
  
  private List<ReleaseDateEntity> releaseDate;
  
  private List<DevPubEntity> developedBy;
  
  private List<DevPubEntity> publishedBy;
  
  private List<GenresEntity> genres;

  public List<PlatformEntity> getPlatforms() {
    return platforms;
  }

  public void setPlatforms(List<PlatformEntity> platforms) {
    this.platforms = platforms;
  }

  public List<ReleaseDateEntity> getReleaseDate() {
    return releaseDate;
  }

  public void setReleaseDate(List<ReleaseDateEntity> releaseDate) {
    this.releaseDate = releaseDate;
  }

  public List<DevPubEntity> getDevelopedBy() {
    return developedBy;
  }

  public void setDevelopedBy(List<DevPubEntity> developedBy) {
    this.developedBy = developedBy;
  }

  public List<DevPubEntity> getPublishedBy() {
    return publishedBy;
  }

  public void setPublishedBy(List<DevPubEntity> publishedBy) {
    this.publishedBy = publishedBy;
  }

  public List<GenresEntity> getGenres() {
    return genres;
  }

  public void setGenres(List<GenresEntity> genres) {
    this.genres = genres;
  }

  @Override
  public String toString() {
    return ObjectUtil.buildToStringByReflect(this);
  }
}
