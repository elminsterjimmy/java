package com.elminster.retrieve.data;

public class Subject implements ISubject {

  private String id;
  
  private String title;
  
  private String originTitle;
  
  private String url;
  
  private String imageUrl;
  
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
