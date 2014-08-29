package com.elminster.retrieve.parser;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.DomSerializer;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.TagNode;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.elminster.common.util.DateUtil;
import com.elminster.common.util.XMLUtil;
import com.elminster.retrieve.data.GameDevPub;
import com.elminster.retrieve.data.GameInfo;
import com.elminster.retrieve.data.IGameDevPub;
import com.elminster.retrieve.data.ISubject;
import com.elminster.retrieve.exception.ParserException;

/**
 * Parser the game information from GameSpot.
 * 
 * @author jgu
 * @version 1.0
 */
public class GameParser implements ISubjectParser {
  
  private static final String BASE_URL = "http://www.gamespot.com";
  
  private static final String XPATH_TO_IMAGE = "//*[@id=\"kubrick-lead\"]/div/div[1]/div/div/div[1]/div/div[1]/div/img/@src";
  private static final String XPATH_TO_STATS = "//*[@id=\"object-stats-wrap\"]";
  private static final String XPATH_TO_NAME = "dl[1]/dt/h3/a/text()";
  private static final String XPATH_TO_URL = "dl[1]/dt/h3/a/@href";
  private static final String XPATH_TO_RELEASE = "dl[1]/dd[2]";
  private static final String XPATH_TO_PLATFORM = "dl[1]/dd[3]/ul/li";
  private static final String XPATH_TO_DESCRIPTION = "dl[1]/dd[4]/text()";
  private static final String XPATH_TO_DEVELOP = "dl[2]/dd[1]/a";
  private static final String XPATH_TO_PUBLISH = "dl[2]/dd[2]/a";
  private static final String XPATH_TO_GENRES = "dl[2]/dd[3]/a";
  
  private static final String FIRST_RELEASE_ON = "FIRST RELEASE ON ";
  private static final String DATE_FORMATTING = "MMM d, yyyy";

  private static final Log logger = LogFactory.getLog(GameParser.class);
  
  /**
   * {@inheritDoc}
   * @throws ParserException 
   */
  @Override
  public ISubject parserSubject(String httpContent) throws ParserException {
    GameInfo game = null;
    // fix some illegal syntax
    HtmlCleaner cleaner = new HtmlCleaner();
    TagNode tagNode = cleaner.clean(httpContent);
    try {
      Document doc = new DomSerializer(new CleanerProperties()).createDOM(tagNode);
      
      game = new GameInfo();
      
      Node statsNode = XMLUtil.xpathEvaluateNode(XPATH_TO_STATS, doc);
      
      String title = XMLUtil.xpathEvaluateString(XPATH_TO_NAME, statsNode);
      String url = XMLUtil.getNodeValue(XMLUtil.xpathEvaluateNode(XPATH_TO_URL, statsNode));
      if (null != url) {
        url = BASE_URL + url;
      }
      String imageUrl = XMLUtil.getNodeValue(XMLUtil.xpathEvaluateNode(XPATH_TO_IMAGE, statsNode));
      String summary = XMLUtil.xpathEvaluateString(XPATH_TO_DESCRIPTION, statsNode);
      NodeList platformList = XMLUtil.xpathEvaluateNodeList(XPATH_TO_PLATFORM, statsNode);
      int platformLength = platformList.getLength();
      List<String> platforms = new ArrayList<>();
      for (int i = 0; i < platformLength; i++) {
        Node node = platformList.item(i);
        platforms.add(XMLUtil.getNodeValue(node));
      }
      NodeList releaseDateList = XMLUtil.xpathEvaluateNodeList(XPATH_TO_RELEASE, statsNode);
      int releaseDateLength = releaseDateList.getLength();
      List<Date> releaseDates = new ArrayList<>();
      for (int i = 0; i < releaseDateLength; i++) {
        Node node = releaseDateList.item(i);
        String releaseDate = XMLUtil.getNodeValue(node);
        releaseDate = releaseDate.substring(FIRST_RELEASE_ON.length());
        releaseDates.add(DateUtil.parserDateStr(releaseDate, DATE_FORMATTING, Locale.US));
      }
      NodeList depList = XMLUtil.xpathEvaluateNodeList(XPATH_TO_DEVELOP, statsNode);
      int depLength = depList.getLength();
      List<IGameDevPub> developedBy = new ArrayList<>();
      for (int i = 0; i < depLength; i++) {
        Node node = depList.item(i);
        GameDevPub developy = new GameDevPub();
        developy.setDevPubName(XMLUtil.getNodeValue(node));
        developy.setDevPubUrl(XMLUtil.getNodeAttribute(node, "href"));
        developedBy.add(developy);
      }
      NodeList publishList = XMLUtil.xpathEvaluateNodeList(XPATH_TO_PUBLISH, statsNode);
      int publishLength = publishList.getLength();
      List<IGameDevPub> publishedBy = new ArrayList<>();
      for (int i = 0; i < publishLength; i++) {
        Node node = publishList.item(i);
        GameDevPub publish = new GameDevPub();
        publish.setDevPubName(XMLUtil.getNodeValue(node));
        publish.setDevPubUrl(XMLUtil.getNodeAttribute(node, "href"));
        publishedBy.add(publish);
      }
      NodeList genresList = XMLUtil.xpathEvaluateNodeList(XPATH_TO_GENRES, statsNode);
      int genresLength = genresList.getLength();
      List<String> genres = new ArrayList<>();
      for (int i = 0; i < genresLength; i++) {
        Node node = genresList.item(i);
        genres.add(XMLUtil.getNodeValue(node));
      }
      game.setTitle(title);
      game.setOriginTitle(title);
      game.setUrl(url);
      game.setImageUrl(imageUrl);
      game.setSummary(summary);
      game.setPlatforms(platforms);
      game.setReleaseDate(releaseDates);
      game.setDevelopedBy(developedBy);
      game.setPublishedBy(publishedBy);
      game.setGenres(genres);
      
      logger.info(game);
    } catch (ParserConfigurationException e) {
      throw new ParserException(e);
    } catch (Exception e) {
      throw new ParserException(e);
    }
    return game;
  }

}
