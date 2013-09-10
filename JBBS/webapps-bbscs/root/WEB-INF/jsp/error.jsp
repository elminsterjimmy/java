<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<%@include file="top.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><s:text name="error"></s:text></title>
<link href="<%=path%>/css/css1.css" rel="stylesheet" type="text/css">
</head>

<body>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="600" border="0" align="center" cellpadding="10" cellspacing="0">
  <tr>
    <td width="216">
      <div align="right">
        <img src="<%=path%>/images/standard_msg_error_big.gif" alt="" width="64" height="64">
      </div>
    </td>
    <td width="338" class="font1">
      <div id="error">
      <s:actionerror theme="bbscs0"/>
      </div>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <div align="center">
        <a href="javascript:history.go(-1);"><s:text name="bbscs.back"></s:text></a>
      </div>
    </td>
  </tr>
</table>
</body>
</html>