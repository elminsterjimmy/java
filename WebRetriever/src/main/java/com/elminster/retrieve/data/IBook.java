package com.elminster.retrieve.data;

import java.util.Date;


public interface IBook extends ISubject {

  String getISBN10();
  
  String getISBN13();
  
  String getAuthor();
  
  String getTranslator();
  
  String getPublisher();

  Date getPbuDate();
  
  String getBinding();
  
  int getPages();
  
  String getAuthorIntor();
  
  String getCatalog();
}
