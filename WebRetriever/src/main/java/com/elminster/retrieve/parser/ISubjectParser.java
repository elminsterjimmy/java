package com.elminster.retrieve.parser;

import com.elminster.retrieve.data.ISubject;
import com.elminster.retrieve.exception.ParserException;

public interface ISubjectParser {

  ISubject parserSubject(String httpContent) throws ParserException;
}
