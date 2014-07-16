package com.elminster.retrieve.data;

import java.util.Date;
import java.util.List;

public interface IMovie extends ISubject {

  List<String> getAKA();
  
  List<IMoviePerson> getDirectors();
  
  List<IMoviePerson> getCasts();
  
  List<IMoviePerson> getWriters();
  
  String getWebsite();
  
  List<Date> getPubdates();
  
  Date getMainlandPubdate();
  
  String getYear();
  
  List<String> getLanguages();
  
  List<String> getDurations();
  
  List<String> getGenres();
  
  List<String> getContries();
  
  
}
