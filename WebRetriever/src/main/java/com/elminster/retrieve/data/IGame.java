package com.elminster.retrieve.data;

import java.util.Date;
import java.util.List;

public interface IGame extends ISubject {

  List<String> getPlatforms();
  
  List<Date> getReleaseDate();

  List<IGameDevPub> getDevelopedBy();
  
  List<IGameDevPub> getPublishedBy();
  
  List<String> getGenres();
}
