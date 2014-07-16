package com.elminster.retrieve.data;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface IMoviePerson {

  String getId();
  
  String getName();

  String getEnName();
  
  String getAlt();
  
  Map<String, String> getAvatarURL();
  
  List<String> getAKA();
  
  List<String> getAKAEn();
  
  String getGender();
  
  Date getBirthday();
  
  String getBornPlace();
  
  List<String> getProfessions();
  
  String getConstellation();
}
