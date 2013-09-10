<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<%@taglib uri="/WEB-INF/bbscs.tld" prefix="bbscs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>
<bbscs:webinfo type="forumname"/>
  - <s:text name="in.title"/>
<bbscs:webinfo type="poweredby"/>
</title>
<bbscs:webinfo type="meta"/>
<link href="css/incss.css" rel="stylesheet" type="text/css"/>
<link href="css/css1.css" rel="stylesheet" type="text/css"/>
<link rel="alternate" type="application/rss+xml" title="Get RSS 2.0 Feed" href="rss" />
</head>
<body>
<div id="head">
  <div id="head1">
    <div id="headl">
      <bbscs:webinfo type="forumname"/>
    </div>
  </div>
  <div id="head2">
    <div id="headr">
      <s:url action="input" namespace="/reg" id="regurl"></s:url>
      <a href="${regurl}" target="_top"><s:text name="in.reg"/></a>
	  <s:url action="login" id="loginurl"></s:url>
	  <a href="${loginurl}" target="_top"><s:text name="in.login"/></a>
	  <s:url action="cpasswd?action=index" id="cpassurl"></s:url>
	  <a href="${cpassurl}" target="_top"><s:text name="cpasswd.title"/></a>
      <s:url action="userShow?action=index" id="userShowurl"></s:url>
	  <a href="${userShowurl}"><s:text name="forum.manage"/></a>
	  <s:url action="logout" id="logouturl"></s:url>
	  <a href="${logouturl}" target="_top"><s:text name="in.logout"/></a>
    </div>
  </div>
</div>
<div id="info">
  <div id="info1">
	<s:property value="%{sysinfo}" escape="false"/>
    <a href="rss" target="_blank"><img alt="Rss" src="images/rss200.png" border="0" align="absmiddle"/></a>
  </div>
  <div id="info2">
	<s:url action="online?action=user" id="onlineuserurl"></s:url>
	<s:text name="in.conline"/>:<s:text name="in.reguser"/> <a href="${onlineuserurl}"><s:property value="%{onlineNum}"/></a> <s:text name="in.guestuser"/> <s:property value="%{onlineGuestNum}"/>
	/
	<s:property value="%{onlineHighest}"/>
  </div>
</div>
<s:if test="%{guest}">
<div id="login">
  <div id="login1">
	<s:if test="%{usePass}">
      <form id="form1" name="form1" method="post" action="<s:property value="%{actionUrl}"/>" target="_top">
      <input type="hidden" name="tourl" value="<s:property value="%{tourl}"/>"/>
      <s:text name="login.username"/>
      <input name="username" type="text" class="input2" size="15" maxlength="20"/>
      <s:text name="login.passwd"/>
      <input name="passwd" type="password" class="input2" size="15"/>
      <input name="Submit" type="submit" class="button1" value="登录"/>
    </form>
    </s:if>
	<s:else>
      <form id="form1" name="form1" method="post" action="<s:property value="%{actionUrl}"/>" target="_top">
      <input type="hidden" name="tourl" value="<s:property value="%{tourl}"/>"/>
      <input type="hidden" name="action" value="login"/>
      <s:text name="login.username"/>
      <input name="username" type="text" class="input2" size="15" maxlength="20"/>
      <s:text name="login.passwd"/>
      <input name="passwd" type="password" class="input2" size="15"/>
      <s:if test="%{useAuthCode}">
      <s:text name="login.authcode"/>
      <input name="authCode" type="text" class="input2" size="5" maxlength="4"/>
      <img alt="<s:text name="login.authcode"/>" src="authimg" align="absmiddle"/>
      </s:if>
      <s:text name="login.hidden"/>
      <input type="checkbox" name="hiddenLogin" value="1"/>
      <input name="Submit" type="submit" class="button1" value="<s:text name="bbscs.button.login"/>"/>
    </form>
    </s:else>
  </div>
</div>
</s:if>
<s:else>
<div id="myinfo">
  <div id="myinfo1">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="20%">
          <div align="center">
            <bbscs:face value="%{userSession.id}"/>
          </div>
        </td>
        <td width="50%" valign="top">
          <div id="logininfo1">
            <s:text name="in.welcome"/>:<strong><s:property value="%{userSession.userName}"/></strong>
            <br/>
            <s:text name="in.lastlogin"/>:<bbscs:datetimes format="yyyy-MM-dd HH:mm:ss" datetype="date" value="%{lastLoginTime}"/>
            <br/>
			<s:property value="%{titleValue}"/>(<s:property value="%{userTitle}"/>)
            <br/>
			<s:url action="note" id="noteurl"></s:url>
			<s:text name="note.title"/>:<a href="${noteurl}"><s:property value="%{newNoteNumInbox}"/>/<s:property value="%{noteAllNumInbox}"/></a>
            <br/>
			<s:url action="online?action=friend" id="onlinefurl"></s:url>
			<s:url action="friendSet" id="friendurl"></s:url>
			<s:text name="friend.fuser"/>:<a href="${onlinefurl}"><s:property value="%{friendOnlineNum}"/></a>/<a href="${friendurl}"><s:property value="%{friendNum}"/></a>
          </div>
        </td>
        <td width="30%" valign="top">
          <div id="usertools1">
            <strong><s:text name="nag.usercenter"/></strong>
            <br/>
			<s:url action="signSet" id="signSeturl"></s:url>
			<a href="${signSeturl}"><s:text name="signset.title"/></a>
			<s:url action="nickNameSet" id="nickNameSeturl"></s:url>
			<a href="${nickNameSeturl}"><s:text name="nickset.title"/></a>
            <br/>
			<s:url action="userConfig" id="userConfigurl"></s:url>
			<a href="${userConfigurl}"><s:text name="userconfig.title"/></a>
			<s:url action="friendSet" id="friendSeturl"></s:url>
			<a href="${friendSeturl}"><s:text name="friend.title"/></a>
            <br/>
			<s:url action="bookMark" id="bookMarkurl"></s:url>
			<a href="${bookMarkurl}"><s:text name="bookmark.title"/></a>
			<s:url action="userFace?action=index" id="userFaceurl"></s:url>
			<a href="${userFaceurl}"><s:text name="face.title"/></a>
            <br/>
			<s:url action="userDetailSet?action=index" id="userDetailSeturl"></s:url>
			<a href="${userDetailSeturl}"><s:text name="userdetail.title"/></a>
			<s:url action="boardSaveManage" id="boardSaveManageurl"></s:url>
			<a href="${boardSaveManageurl}"><s:text name="boardsave.title"/></a>
          </div>
        </td>
      </tr>
    </table>
  </div>
</div>
</s:else>

<div id="board">
  <div id="boardl">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="bgColor1">
          <table width="100%" border="0" cellpadding="5" cellspacing="1">
            <tr class="bgColor3">
              <td width="10%"><div align="center"></div></td>
              <td width="70%"><div align="center"><strong><s:text name="bbscs.board"/></strong></div></td>
              <td width="10%"><div align="center"><strong><s:text name="bbscs.topic"/></strong></div></td>
              <td width="10%"><div align="center"><strong><s:text name="bbscs.art"/></strong></div></td>
            </tr>
	  <s:iterator id="board" value="%{boardList}">
	  <s:if test="#board.boardType==1">
      <tr>
        <td colspan="4" class="bgColor4"><table width="100%" border="0" cellpadding="2" cellspacing="0">
          <tr>
            <td>
              <strong class="font1">
				<s:if test="%{urlRewrite}">
				<a href="forum-index-<s:property value="#board.id"/>.html"><s:property value="#board.boardName"/></a>
				</s:if>
				<s:else>
				<s:url action="forum?action=index" id="furl">
				<s:param name="bid" value="#board.id"/>
				</s:url>
				<a href="${furl}"><s:property value="#board.boardName"/></a>
                </s:else>
              </strong>
            </td>
          </tr>
          <tr>
            <td><s:property value="#board.explains"/></td>
          </tr>
          <tr>
            <td><s:text name="bbscs.boardmaster"/> <bbscs:boardmaster value="#board.boardMaster"/></td>
          </tr>
        </table></td>
      </tr>
      </s:if>
      <s:if test="#board.boardType==3">
      <tr>
        <td valign="middle" class="bgColor4"><div align="center"></div></td>
        <td class="bgColor2"><table width="100%" border="0" cellpadding="2" cellspacing="0">
          <tr>
            <td>
              <strong class="font1">
                <s:if test="%{urlRewrite}">
				<a href="forum-index-<s:property value="#board.id"/>.html"><s:property value="#board.boardName"/></a>
				</s:if>
				<s:else>
				<s:url action="forum?action=index" id="furl">
				<s:param name="bid" value="#board.id"/>
				</s:url>
				<a href="${furl}"><s:property value="#board.boardName"/></a>
                </s:else>
              </strong>
            </td>
          </tr>
          <tr>
            <td><s:property value="#board.explains"/></td>
          </tr>
          <tr>
            <td><s:text name="bbscs.boardmaster"/> <bbscs:boardmaster value="#board.boardMaster"/></td>
          </tr>
        </table></td>
        <td class="bgColor4"><div align="center"><s:property value="#board.mainPostNum"/></div></td>
        <td class="bgColor2"><div align="center"><s:property value="#board.postNum"/></div></td>
      </tr>
      </s:if>
	  <s:set name="bl2" value="%{boardMap.get(#board.id)}"></s:set>
      <s:iterator id="b" value="#bl2">
      <tr>
        <td valign="middle" class="bgColor4"><div align="center"></div></td>
        <td class="bgColor2"><table width="100%" border="0" cellpadding="2" cellspacing="0">
          <tr>
            <td>
              <strong class="font1">
				<s:if test="%{urlRewrite}">
				<a href="forum-index-<s:property value="#b.id"/>.html"><s:property value="#b.boardName"/></a>
				</s:if>
				<s:else>
				<s:url action="forum?action=index" id="furl">
				<s:param name="bid" value="#b.id"/>
				</s:url>
				<a href="${furl}"><s:property value="#b.boardName"/></a>
                </s:else>
              </strong>
            </td>
          </tr>
          <tr>
            <td><s:property value="#b.explains"/></td>
          </tr>
          <tr>
            <td><s:text name="bbscs.boardmaster"/> <bbscs:boardmaster value="#b.boardMaster"/></td>
          </tr>
        </table></td>
        <td class="bgColor4"><div align="center"><s:property value="#b.mainPostNum"/></div></td>
        <td class="bgColor2"><div align="center"><s:property value="#b.postNum"/></div></td>
      </tr>
      </s:iterator>
      </s:iterator>
    </table></td>
  </tr>
</table>
 </div>
</div>

<div id="posts">
  <table width="100%" border="0" cellpadding="0" cellspacing="2">
    <tr>
      <td width="50%" valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="bgColor1">
              <table width="100%" border="0" cellpadding="5" cellspacing="1">
                <tr>
                  <td class="bgColor3">
                    <strong class="font1"><s:text name="in.newart"/></strong>
                  </td>
                </tr>
                <tr>
                  <td class="bgColor2">
                    <table width="100%" border="0" cellpadding="3" cellspacing="0">
					  <s:iterator id="newf" value="%{newForums}">
                        <tr>
                          <td>
                            <s:if test="%{urlRewrite}">
                              <a href="read-topic-<s:property value="#newf.boardID"/>-<s:property value="#newf.mainID"/>-0-1-index-1.html"><s:property value="#newf.title"/></a>

                              [<a href="forum-index-<s:property value="#newf.boardID"/>.html"><s:property value="#newf.boardName"/></a>]
                            </s:if>
							<s:else>
							  <s:url action="read?action=topic" id="posturl">
							  <s:param name="bid" value="#newf.boardID"/>
							  <s:param name="id" value="#newf.mainID"/>
							  <s:param name="fcpage" value="1"/>
							  <s:param name="fcaction" value="index"/>
							  </s:url>
							  <a href="${posturl}"><s:property value="#newf.title"/></a>
							  <s:url action="forum?action=index" id="forumurl">
							  <s:param name="bid" value="#newf.boardID"/>
							  </s:url>
                              [<a href="${forumurl}"><s:property value="#newf.boardName"/></a>]
                            </s:else>
                          </td>
                        </tr>
                      </s:iterator>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td width="50%" valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="bgColor1">
              <table width="100%" border="0" cellpadding="5" cellspacing="1">
                <tr>
                  <td class="bgColor3">
                    <strong class="font1"><s:text name="in.commend"/></strong>
                  </td>
                </tr>
                <tr>
                  <td class="bgColor2">
                    <table width="100%" border="0" cellpadding="3" cellspacing="0">
                    <bbscs:in type="commend"/>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>

<div id="topuser">
  <table width="100%" border="0" cellpadding="0" cellspacing="2">
    <tr>
      <td valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="bgColor1">
              <table width="100%" border="0" cellpadding="5" cellspacing="1">
                <tr>
                  <td class="bgColor3">
                    <strong class="font1"><s:text name="in.ul1"/></strong>
                  </td>
                </tr>
                <tr>
                  <td class="bgColor2">
                    <table width="100%" border="0" cellpadding="3" cellspacing="0">
                    <bbscs:in type="userexp"/>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="bgColor1">
              <table width="100%" border="0" cellpadding="5" cellspacing="1">
                <tr>
                  <td class="bgColor3">
                    <strong class="font1"><s:text name="in.ul2"/></strong>
                  </td>
                </tr>
                <tr>
                  <td class="bgColor2">
                    <table width="100%" border="0" cellpadding="3" cellspacing="0">
                    <bbscs:in type="userlit"/>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td valign="top">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="bgColor1">
              <table width="100%" border="0" cellpadding="5" cellspacing="1">
                <tr>
                  <td class="bgColor3">
                    <strong class="font1"><s:text name="in.ul3"/></strong>
                  </td>
                </tr>
                <tr>
                  <td class="bgColor2">
                    <table width="100%" border="0" cellpadding="3" cellspacing="0">
                     <bbscs:in type="userknow"/>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>
<div id="search">
  <table width="100%" border="0" cellpadding="5" cellspacing="2">
    <tr>
      <td>
		<!--<s:form action="search">
        <div align="center">
        全文搜索
          <input name="query" type="text" class="input2" size="10"/>
          <input name="Submit" type="submit" class="button1" value="搜索" />
        </div>
        </s:form>-->
        <div align="center">
        <!--
        <form method="get" action="http://www.google.cn/custom" target="google_window">
        <a href="http://www.google.com/"><img src="http://www.google.com/logos/Logo_25wht.gif" border="0" alt="Google" align="absmiddle"></img></a>
        <input type="hidden" name="domains" value="<s:property value="%{forumSite}"/>"></input>
        <input type="text" name="q" size="10" maxlength="255" value="" id="sbi" class="input2"></input>
        <input type="submit" name="sa" value="搜索" id="sbb" class="button1"></input>
        <input type="hidden" name="sitesearch" value="<s:property value="%{forumSite}"/>"></input>
        <input type="hidden" name="client" value="pub-9505761087047507"></input>
        <input type="hidden" name="forid" value="1"></input>
        <input type="hidden" name="ie" value="UTF-8"></input>
        <input type="hidden" name="oe" value="UTF-8"></input>
        <input type="hidden" name="cof" value="GALT:#008000;GL:1;DIV:#336699;VLC:663399;AH:center;BGC:FFFFFF;LBGC:336699;ALC:0000FF;LC:0000FF;T:000000;GFNT:0000FF;GIMP:0000FF;FORID:1"></input>
        <input type="hidden" name="hl" value="zh_CN"></input>
        </form>
        -->
        <script type="text/javascript"><!--
  google_ad_client = "pub-9505761087047507";
  google_ad_format = "configurable_sdo";
  google_link_target = 2;
  google_color_bg = "ffffff";
  google_color_link = "000000";
  google_color_text = "000000";
  google_encoding = "UTF-8";
  google_box_len = 10;
  google_logo_pos = "left";
  google_ss_domains = "<s:property value="%{forumSite}"/>";
  google_ad_height = 65;
  google_ad_width = 300;
//-->
</script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_sdo.js">
</script>

        </div>
      </td>
      <td>
		<s:form action="userInfo">
		<s:hidden name="action" value="name"></s:hidden>
        <div align="center">          <s:text name="in.searchuser"/>
		  <s:textfield id="username" name="username" cssClass="input2" size="10" maxlength="20"></s:textfield>
          <input name="Submit" type="submit" class="button1" value="<s:text name="in.search"/>" />
        </div>
        </s:form>
      </td>
    </tr>
  </table>
</div>
<table width="100%" border="0" cellpadding="5" cellspacing="0">
  <tr>
    <td>
      <div align="center">
        <s:include value="/adv2.html"></s:include>
      </div>
    </td>
  </tr>
  <tr>
    <td>
      <div align="center">
        <bbscs:webinfo type="pagefoot"/>
      </div>
    </td>
  </tr>
</table>
</body>
</html>
