<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<%@taglib uri="/WEB-INF/bbscs.tld" prefix="bbscs"%>
<html>
<head>
<title><bbscs:webinfo type="forumname"/><bbscs:webinfo type="poweredby"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<bbscs:webinfo type="meta"/>
<link href="css/css1.css" rel="stylesheet" type="text/css">
</head>
<body style="margin: 0px" scroll=no>
<script language="JavaScript" type="text/javascript">
if(self!=top){
  top.location=self.location;
}
function switchSysBar(){
  if (switchPoint.innerHTML=='&lt;'){
    switchPoint.innerHTML='&gt;'
    document.getElementById("frmTitle").style.display="none";
  }
  else{
    switchPoint.innerHTML='&lt;'
    document.getElementById("frmTitle").style.display="block";
  }
}

function changeMainFrameSrc(url) {
  //alert(url);
  document.getElementById("mainFrame").src = url;
}
</script>
<table border="0" cellPadding="0" cellSpacing="0" height="100%" width="100%">
  <tr>
    <td align="middle" noWrap vAlign="center" id="frmTitle" height="100%">
      <iframe id="nagFrame" name="nagFrame" frameBorder="0" scrolling="auto" src="<s:property value="%{nagUrl}"/>" class="iframe1"></iframe>
    </td>
    <td class="td2">
      <table border="0" cellPadding="0" cellSpacing="0" height="100%">
        <tr>
          <td onclick="switchSysBar()">
            <font class="switchbarfont">
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <span class="navPoint" id="switchPoint" title="关闭/打开左栏">&lt;</span>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              屏幕切换
            </font>
          </td>
        </tr>
      </table>
    </td>
    <td style="width: 100%">
      <iframe frameBorder="0" id="mainFrame" name="mainFrame" scrolling="yes" src="<s:property value="%{inUrl}"/>" class="iframe2"></iframe>
    </td>
  </tr>
</table>
<script language="JavaScript" type="text/javascript">
if(window.screen.width<'1024'){switchSysBar()}
</script>
</html>