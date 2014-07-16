package com.elminster.retrieve.data;

import java.util.Date;
import java.util.List;

public interface IGame extends ISubject {

  List<String> getPlatforms();
  
  List<Date> getReleaseDate();

  List<String> getDevelopedBy();
  
  List<String> getPublishedBy();
  
  List<String> getGenres();
}
