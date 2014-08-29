package com.elminster.retrieve.entity;

import java.sql.Date;

import com.elminster.easydao.db.annotation.Column;
import com.elminster.easydao.db.annotation.Entity;
import com.elminster.easydao.db.annotation.Key;
import com.elminster.easydao.db.id.KeyPolicy;

@Entity(tableName="t_releaseDate_info")
public class ReleaseDateEntity {

  @Key(policy=KeyPolicy.AUTO_INC_POLICY)
  @Column
  private int id;
  
  @Column
  private Date releaseDate;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public Date getReleaseDate() {
    return releaseDate;
  }

  public void setReleaseDate(Date releaseDate) {
    this.releaseDate = releaseDate;
  }
}
