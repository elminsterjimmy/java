package com.elminster.retrieve.entity;

import com.elminster.easydao.db.annotation.Column;
import com.elminster.easydao.db.annotation.Key;
import com.elminster.easydao.db.id.KeyPolicy;

public class SubjectEntity {

  @Key(policy=KeyPolicy.AUTO_INC_POLICY)
  @Column
  private String id;
  
  @Column
  private String title;
  
  @Column
  private String originTitle;
  
  @Column
  private String url;
  
  @Column
  private String imageUrl;
  
  @Column
  private String summary;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getOriginTitle() {
    return originTitle;
  }

  public void setOriginTitle(String originTitle) {
    this.originTitle = originTitle;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public String getImageUrl() {
    return imageUrl;
  }

  public void setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
  }

  public String getSummary() {
    return summary;
  }

  public void setSummary(String summary) {
    this.summary = summary;
  }
}
