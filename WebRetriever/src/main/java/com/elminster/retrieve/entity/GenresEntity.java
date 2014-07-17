package com.elminster.retrieve.entity;

import com.elminster.easydao.db.annotation.Column;
import com.elminster.easydao.db.annotation.Entity;
import com.elminster.easydao.db.annotation.Key;
import com.elminster.easydao.db.annotation.KeyPolicy;

@Entity(tableName="t_genres_info")
public class GenresEntity {

  @Key(policy=KeyPolicy.AUTO_INC_POLICY)
  @Column
  private int id;
  
  @Column
  private String name;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
}
