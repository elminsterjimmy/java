package com.elminster.retrieve.data;

import java.util.Date;
import java.util.List;

import com.elminster.common.util.ObjectUtil;

public class GameInfo extends Subject implements IGame {

  private List<String> platforms;
  
  private List<Date> releaseDate;
  
  private List<IGameDevPub> developedBy;
  
  private List<IGameDevPub> publishedBy;
  
  private List<String> genres;

  public List<String> getPlatforms() {
    return platforms;
  }

  public void setPlatforms(List<String> platforms) {
    this.platforms = platforms;
  }

  public List<Date> getReleaseDate() {
    return releaseDate;
  }

  public void setReleaseDate(List<Date> releaseDate) {
    this.releaseDate = releaseDate;
  }

  public List<IGameDevPub> getDevelopedBy() {
    return developedBy;
  }

  public void setDevelopedBy(List<IGameDevPub> developedBy) {
    this.developedBy = developedBy;
  }

  public List<IGameDevPub> getPublishedBy() {
    return publishedBy;
  }

  public void setPublishedBy(List<IGameDevPub> publishedBy) {
    this.publishedBy = publishedBy;
  }

  public List<String> getGenres() {
    return genres;
  }

  public void setGenres(List<String> genres) {
    this.genres = genres;
  }

  @Override
  public String toString() {
    return ObjectUtil.buildToStringByReflect(this);
  }
}
