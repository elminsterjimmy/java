package com.elminster.retrieve.data;

public interface ITVShow extends IMovie {

  int getSessionsCount();
  
  int getCurrentSeason();
  
  int getEpisodesCount();
}
