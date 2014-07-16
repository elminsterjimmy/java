package com.elminster.retrieve.data;

import java.io.Serializable;

/**
 * The interface of subject.
 * 
 * @author jgu
 * @version 1.0
 */
public interface ISubject extends ISerializable {

  String getId();
  
  String getTitle();
  
  String getOriginTitle();
  
  String getUrl();
  
  String getImageUrl();
  
  String getSummary();
  
  
}
