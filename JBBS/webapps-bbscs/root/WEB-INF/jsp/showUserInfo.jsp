<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<%@taglib uri="/WEB-INF/bbscs.tld" prefix="bbscs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><s:text name="userinfo.title"/></title>
<link href="css/css1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/prototype.js"></script>
<script type="text/javascript" src="js/jsMsg.jsp"></script>
<script type="text/javascript" src="js/comm.js"></script>
<script type="text/javascript" src="js/note.js"></script>
<script language="JavaScript" type="text/javascript">
<!--

var userid = "<s:property value="%{ui.id}"/>";

function loadBookMarkListPage() {
  $('bookMarkListDiv').innerHTML = pageLoadingCenter;
  var urls = getActionMappingURL("/userInfo");
  var pars = "action=bookmark&ajax=shtml&id="+userid;

  var myAjax = new Ajax.Updater("bookMarkListDiv", urls, {method: 'get', parameters: pars});
}

function loadBookMarkListPageUrl(url) {
  $('bookMarkListDiv').innerHTML = pageLoadingCenter;

  var urls = getActionName(url);
  var pars = getActionPars(url);

  var myAjax = new Ajax.Updater("bookMarkListDiv", urls, {method: 'get', parameters: pars});
}

//-->
</script>
</head>

<body onload="loadBookMarkListPage();">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="bgColor1"><table width="100%" border="0" cellpadding="5" cellspacing="1">
      <tr>
        <td colspan="4" class="bgColor3"><span class="font1"><strong><s:text name="userinfo.title1"/></strong></span></td>
        </tr>
      <tr class="bgColor2">
        <td colspan="2" rowspan="6">
          <div align="center">
            <bbscs:face value="%{ui.id}"/>
          </div>
        </td>
        <td width="25%"><s:text name="userinfo.username"/>:</td>
        <td width="25%"><strong><s:property value="%{ui.userName}"/></strong></td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="userinfo.nickname"/>:</td>
        <td><strong><s:property value="%{ui.nickName}"/></strong></td>
      </tr>
      <tr class="bgColor2">
        <td><s:text name="userinfo.regtime"/>:</td>
        <td><bbscs:datetimes format="yyyy-MM-dd HH:mm" datetype="date" value="%{ui.regTime}"/></td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="userinfo.loingtimes"/>:</td>
        <td><s:property value="%{ui.loginTimes}"/></td>
      </tr>
      <tr class="bgColor2">
        <td><s:text name="userinfo.lastlogintime"/>:</td>
        <td><bbscs:datetimes format="yyyy-MM-dd HH:mm" datetype="date" value="%{ui.lastLoginTime}"/></td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="userdetail.userFrom"/>:</td>
        <td><s:property value="%{ui.userFrom}"/></td>
      </tr>
      <tr class="bgColor2">
        <td width="25%"><s:text name="userinfo.articleNum"/>:</td>
        <td width="25%"><s:property value="%{ui.articleNum}"/></td>
        <td><s:text name="userinfo.articleEliteNum"/>:</td>
        <td><s:property value="%{ui.articleEliteNum}"/></td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="userinfo.lifeForce"/>:</td>
        <td><s:property value="%{ui.lifeForce}"/></td>
        <td><s:text name="userinfo.literary"/>:</td>
        <td><s:property value="%{ui.literary}"/></td>
      </tr>
      <tr class="bgColor2">
        <td><s:text name="userinfo.experience"/>:</td>
        <td><s:property value="%{ui.experience}"/></td>
        <td><s:text name="userinfo.userKnow"/>:</td>
        <td><s:property value="%{ui.userKnow}"/></td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="userdetail.sex"/>:</td>
        <td>
        <s:if test="%{userDetail.sex==0}">
        <s:text name="bbscs.woman"/>
        </s:if>
        <s:else>
        <s:text name="bbscs.man"/>
        </s:else>
        </td>
        <td><s:text name="userdetail.birth"/>:</td>
        <td><s:property value="%{ui.birthYear}"/>-<s:property value="%{ui.birthMonth}"/>-<s:property value="%{ui.birthDay}"/></td>
      </tr>
      <tr class="bgColor2">
        <td><s:text name="userdetail.height"/>:</td>
        <td><s:property value="%{userDetail.height}"/></td>
        <td><s:text name="userdetail.weight"/>:</td>
        <td><s:property value="%{userDetail.weight}"/></td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="userdetail.interest"/>:</td>
        <td><s:property value="%{userDetail.interest}"/></td>
        <td><s:text name="userdetail.graduate"/>:</td>
        <td><s:property value="%{userDetail.graduate}"/></td>
      </tr>
      <tr class="bgColor2">
        <td><s:text name="userdetail.favourPeople"/>:</td>
        <td><s:property value="%{userDetail.favourPeople}"/></td>
        <td><s:text name="userdetail.dreamJob"/>:</td>
        <td><s:property value="%{userDetail.dreamJob}"/></td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="userdetail.favourArt"/>:</td>
        <td><s:property value="%{userDetail.favourArt}"/></td>
        <td><s:text name="userdetail.favourMusic"/>:</td>
        <td><s:property value="%{userDetail.favourMusic}"/></td>
      </tr>
      <tr class="bgColor2">
        <td><s:text name="userdetail.favourPlace"/>:</td>
        <td><s:property value="%{userDetail.favourPlace}"/></td>
        <td><s:text name="userdetail.favourMovie"/>:</td>
        <td><s:property value="%{userDetail.favourMovie}"/></td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="userdetail.favourChat"/>:</td>
        <td><s:property value="%{userDetail.favourChat}"/></td>
        <td><s:text name="userdetail.favourBook"/>:</td>
        <td><s:property value="%{userDetail.favourBook}"/></td>
      </tr>
      <tr class="bgColor2">
        <td><s:text name="userdetail.dreamLover"/>:</td>
        <td><s:property value="%{userDetail.dreamLover}"/></td>
        <td><s:text name="userdetail.favourTeam"/>:</td>
        <td><s:property value="%{userDetail.favourTeam}"/></td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="userdetail.homePage"/>:</td>
        <td><s:property value="%{userDetail.homePage}"/></td>
        <td>QQ:</td>
        <td><s:property value="%{userDetail.oicqNo}"/></td>
      </tr>
      <tr class="bgColor2">
        <td>MSN</td>
        <td><s:property value="%{userDetail.msn}"/></td>
        <td>ICQ</td>
        <td><s:property value="%{userDetail.icqNo}"/></td>
      </tr>
      <tr class="bgColor4">
        <td>Yahoo:</td>
        <td><s:property value="%{userDetail.yahoo}"/></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="4" class="bgColor2"><a href="javascript:;" onclick="loadNoteSendToUser('<s:property value="%{ui.userName}"/>');"><strong><s:text name="userinfo.sendnote"/></strong></a></td>
      </tr>
      <tr>
        <td colspan="4" class="bgColor3"><span class="font1"><strong><s:text name="userinfo.brief"/></strong></span></td>
      </tr>
      <tr>
        <td colspan="4" class="bgColor4">
          <span class="font1"><s:property value="%{userDetail.brief}" escape="false"/></span>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
<div>&nbsp;</div>
<div id="noteSendDiv"></div>
<div>&nbsp;</div>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="bgColor1"><table width="100%" border="0" cellpadding="5" cellspacing="1">
      <tr>
        <td colspan="2" class="bgColor3"><span class="font1"><strong><s:text name="userinfo.ntenpost"/></strong></span></td>
      </tr>
      <s:iterator value="%{ownMainList}" id="f">
      <s:url action="read?action=topic" id="readurl">
      <s:param name="bid" value="#f.boardID"/>
      <s:param name="id" value="#f.mainID"/>
      <s:param name="fcpage" value="1"/>
      <s:param name="fcaction" value="index"/>
      </s:url>
      <s:url action="forum?action=index" id="furl">
      <s:param name="bid" value="#f.boardID"/>
      </s:url>
      <tr>
        <td width="75%" class="bgColor2"><a href="${readurl}"><s:property value="#f.title"/></a></td>
        <td width="25%" class="bgColor2">[<a href="${furl}"><s:property value="#f.boardName"/></a>]</td>
      </tr>
      </s:iterator>
    </table></td>
  </tr>
</table>
<div>&nbsp;</div>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="bgColor1"><table width="100%" border="0" cellpadding="5" cellspacing="1">
      <tr>
        <td colspan="2" class="bgColor3"><span class="font1"><strong><s:text name="userinfo.ntenre"/></strong></span></td>
      </tr>
      <s:iterator value="%{ownReList}" id="f">
      <s:url action="read?action=topic" id="readurl">
      <s:param name="bid" value="#f.boardID"/>
      <s:param name="id" value="#f.mainID"/>
      <s:param name="fcpage" value="1"/>
      <s:param name="fcaction" value="index"/>
      </s:url>
      <s:url action="forum?action=index" id="furl">
      <s:param name="bid" value="#f.boardID"/>
      </s:url>
      <tr>
        <td width="75%" class="bgColor2"><a href="${readurl}"><s:property value="#f.title"/></a></td>
        <td width="25%" class="bgColor2">[<a href="${furl}"><s:property value="#f.boardName"/></a>]</td>
      </tr>
      </s:iterator>
    </table></td>
  </tr>
</table>

<div>&nbsp;</div>
<div id="bookMarkListDiv"></div>
<div>&nbsp;</div>
<div align="center"><a href="javascript:history.go(-1);"><s:text name="bbscs.back"/></a></div>
</body>
</html>