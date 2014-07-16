package com.elminster.retrieve.parser;

import com.elminster.retrieve.data.SubjectType;

public class SubjectParserFactory {
  
  private static SubjectParserFactory instance = new SubjectParserFactory();
  
  private SubjectParserFactory() {}
  
  public static SubjectParserFactory getFactory() {
    return instance;
  }

  /**
   * 
   * @param type
   * @return
   */
  public ISubjectParser getSubjectParser(SubjectType type) {
    ISubjectParser parser;
    switch (type) {
      case BOOK:
        parser = new BookParser();
        break;
      case MOVIE:
        parser = new MovieParser();
        break;
      case GAME:
        parser = new GameParser();
        break;
      default:
        throw new IllegalArgumentException("illegal type: " + type);
    }
    return parser;
  }
}
