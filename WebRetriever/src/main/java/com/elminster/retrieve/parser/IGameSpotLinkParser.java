package com.elminster.retrieve.parser;

import java.util.List;

public interface IGameSpotLinkParser {

  public List<String> parserLinks(String httpContent) throws Exception;
}
