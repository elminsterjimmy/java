package com.elminster.retrieve.parser;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.DomSerializer;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.TagNode;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.elminster.common.util.XMLUtil;

public class GameSpotLinksParser implements IGameSpotLinkParser {
  
  private static final String BASE_URL = "http://www.gamespot.com";
  
  private static final String XPATH_TO_ALPHA_CONTENT = "//*[@id=\"js-game-alpha\"]/div/div/a/@href";
  
  private static final Log logger = LogFactory.getLog(GameSpotLinksParser.class);

  public List<String> parserLinks(String httpContent) throws Exception {
    // fix some illegal syntax
    HtmlCleaner cleaner = new HtmlCleaner();
    TagNode tagNode = cleaner.clean(httpContent);
    List<String> links = new ArrayList<String>();
    Document doc = new DomSerializer(new CleanerProperties()).createDOM(tagNode);
    NodeList nodeList = XMLUtil.xpathEvaluateNodeList(XPATH_TO_ALPHA_CONTENT, doc);
    int size = nodeList.getLength();
    for (int i = 0; i < size; i++) {
      Node node = nodeList.item(i);
      String relativedURL = XMLUtil.getNodeValue(node);
      logger.info("relativedURL: " + relativedURL);
      links.add(BASE_URL + relativedURL);
    }
    return links;
  }
}
