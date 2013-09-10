<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<%@taglib uri="/WEB-INF/bbscs.tld" prefix="bbscs"%>
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="FCK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><s:text name="post.title"/></title>
<link href="css/css1.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<script type="text/javascript">
function postSubmit() {
  document.getElementById("postButton").disabled = true;
  document.post.submit();
}
</script>

</head>

<body>
<s:actionerror theme="bbscs0"/>
<table width="100%" border="0" cellpadding="5" cellspacing="0">
  <tr>
    <td class="bgColor3">
    <bbscs:post type="postat"/>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="bgColor3">
<s:form action="post" enctype="multipart/form-data" method="POST" name="post" id="post">
<s:hidden name="action"></s:hidden>
<s:hidden name="bid"></s:hidden>
<s:hidden name="id"></s:hidden>
<s:hidden name="editType"></s:hidden>
<s:hidden name="parentID"></s:hidden>
<s:hidden name="mainID"></s:hidden>
<s:hidden name="totalnum"></s:hidden>
<s:hidden name="inpages"></s:hidden>
<s:hidden name="fcpage"></s:hidden>
<s:if test="%{action=='addre'}">
<s:hidden name="tagId"></s:hidden>
</s:if>
<s:elseif test="%{action=='addrequote'}">
<s:hidden name="tagId"></s:hidden>
</s:elseif>
<s:elseif test="%{action=='editdo'}">
<s:hidden name="tagId"></s:hidden>
</s:elseif>
  <tr>
    <td><table width="100%" border="0" cellpadding="5" cellspacing="1">
      <tr>
        <td width="15%" class="bgColor2"><s:text name="read.art.title"/></td>
        <td width="85%" class="bgColor2">
          <s:if test="%{action=='addsave'}">
          <s:select list="tagValues" id="tagId" name="tagId" cssClass="select1" listKey="key" listValue="value"></s:select>
          </s:if>
          <s:textfield id="title" name="title" cssClass="input2" size="60" maxlength="60"></s:textfield>
        </td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="post.copyright"/></td>
        <td>
          <input name="postType" type="radio" value="0" <s:if test="%{postType==0}">checked="checked"</s:if> />
          <s:text name="post.postType1"/>
          <input name="postType" type="radio" value="1" <s:if test="%{postType==1}">checked="checked"</s:if> />
          <s:text name="post.postType2"/>
          <input name="postType" type="radio" value="2" <s:if test="%{postType==2}">checked="checked"</s:if> />
          <s:text name="post.postType3"/>
        </td>
      </tr>
      <tr class="bgColor2">
        <td><s:text name="post.colortitle"/></td>
        <td>
          <select name="titleColor" id="titleColor" class="select1">
          <s:property value="%{titleColorOptions}" escape="false"/>
          </select>
        </td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="post.status"/></td>
        <td>
        <table cellSpacing="2" cellPadding="2" border="0">
        <tbody>
        <tr>
          <td><input name="face" type="radio" value="1" <s:if test="%{face==1}">checked="checked"</s:if> /></td>
          <td><img src="images/1.gif" alt=""/></td>
          <td><input name="face" type="radio" value="2" <s:if test="%{face==2}">checked="checked"</s:if> /></td>
          <td><img src="images/2.gif" alt=""/></td>
          <td><input name="face" type="radio" value="3" <s:if test="%{face==3}">checked="checked"</s:if> /></td>
          <td><img src="images/3.gif" alt=""/></td>
          <td><input name="face" type="radio" value="4" <s:if test="%{face==4}">checked="checked"</s:if> /></td>
          <td><img src="images/4.gif" alt=""/></td>
          <td><input name="face" type="radio" value="5" <s:if test="%{face==5}">checked="checked"</s:if> /></td>
          <td><img src="images/5.gif" alt=""/></td>
          <td><input name="face" type="radio" value="6" <s:if test="%{face==6}">checked="checked"</s:if> /></td>
          <td><img src="images/6.gif" alt=""/></td>
          <td><input name="face" type="radio" value="13" <s:if test="%{face==13}">checked="checked"</s:if> /></td>
          <td><img src="images/13.gif" alt=""/></td>
          <td><input name="face" type="radio" value="14" <s:if test="%{face==14}">checked="checked"</s:if> /></td>
          <td><img src="images/14.gif" alt=""/></td>
          <td><input name="face" type="radio" value="15" <s:if test="%{face==15}">checked="checked"</s:if> /></td>
          <td><img src="images/15.gif" alt=""/></td>
          <td><input name="face" type="radio" value="16" <s:if test="%{face==16}">checked="checked"</s:if> /></td>
          <td><img src="images/16.gif" alt=""/></td></TR>
        <tr>
          <td><input name="face" type="radio" value="7" <s:if test="%{face==7}">checked="checked"</s:if> /></td>
          <td><img src="images/7.gif" alt=""/></td>
          <td><input name="face" type="radio" value="8" <s:if test="%{face==8}">checked="checked"</s:if> /></td>
          <td><img src="images/8.gif" alt=""/></td>
          <td><input name="face" type="radio" value="9" <s:if test="%{face==9}">checked="checked"</s:if> /></td>
          <td><img src="images/9.gif" alt=""/></td>
          <td><input name="face" type="radio" value="10" <s:if test="%{face==10}">checked="checked"</s:if> /></td>
          <td><img src="images/10.gif" alt=""/></td>
          <td><input name="face" type="radio" value="11" <s:if test="%{face==11}">checked="checked"</s:if> /></td>
          <td><img src="images/11.gif" alt=""/></td>
          <td><input name="face" type="radio" value="12" <s:if test="%{face==12}">checked="checked"</s:if> /></td>
          <td><img src="images/12.gif" alt=""/></td>
          <td><input name="face" type="radio" value="17" <s:if test="%{face==17}">checked="checked"</s:if> /></td>
          <td><img src="images/17.gif" alt=""/></td>
          <td><input name="face" type="radio" value="18" <s:if test="%{face==18}">checked="checked"</s:if> /></td>
          <td><img src="images/18.gif" alt=""/></td>
          <td><input name="face" type="radio" value="19" <s:if test="%{face==19}">checked="checked"</s:if> /></td>
          <td><img src="images/19.gif" alt=""/></td>
          <td><input name="face" type="radio" value="20" <s:if test="%{face==20}">checked="checked"</s:if> /></td>
          <td><img src="images/20.gif" alt=""/></td></TR>
	 </TBODY>
         </TABLE>
         </td>
      </tr>
      <tr class="bgColor2">
        <td><s:text name="read.art.content"/></td>
        <td>
		  <s:if test="%{editType==0}">
		  <s:textarea id="detail" name="detail" cssClass="textarea1" cols="60" rows="15"></s:textarea>
		  </s:if>
		  <s:elseif test="%{editType==1}">
		  <FCK:editor id="detail" basePath="" startupFocus="false" toolbarSet="Basic" width="100%" height="300">
		  <s:property value="%{detail}" escape="false"/>
		  </FCK:editor>
		  </s:elseif>
		  <s:else>
		  <FCK:editor id="detail" basePath="" startupFocus="false" toolbarSet="Bbscs" width="100%" height="300">
		  <s:property value="%{detail}" escape="false"/>
		  </FCK:editor>
		  </s:else>
        </td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="post.usesign"/></td>
        <td>
		  <input name="sign" type="radio" value="0" <s:if test="%{sign==0}">checked="checked"</s:if> />
          <s:text name="signset.sign"/>A
		  <input name="sign" type="radio" value="1" <s:if test="%{sign==1}">checked="checked"</s:if> />
          <s:text name="signset.sign"/>B
		  <input name="sign" type="radio" value="2" <s:if test="%{sign==2}">checked="checked"</s:if> />
          <s:text name="signset.sign"/>C
		  <input name="sign" type="radio" value="-1" <s:if test="%{sign==-1}">checked="checked"</s:if> />
          <s:text name="post.nousesign"/>
		  <s:if test="%{action=='editdo'}">
		  <input name="sign" type="radio" value="3" <s:if test="%{sign==3}">checked="checked"</s:if> />
		  <s:text name="post.noeditsign"/>
		  </s:if>
        </td>
      </tr>
      <tr class="bgColor2">
        <td><s:text name="post.renotice"/></td>
        <td>
		  <s:if test="%{action=='editdo'}">
		  <s:checkbox name="emailInform" id="emailInform" disabled="true"/>
		  <s:text name="post.renotice1"/>
		  <s:checkbox name="msgInform" id="msgInform" disabled="true"/>
		  <s:text name="post.renotice2"/>
		  </s:if>
		  <s:else>
		  <s:checkbox name="emailInform" id="emailInform" />
		  <s:text name="post.renotice1"/>
		  <s:checkbox name="msgInform" id="msgInform" />
		  <s:text name="post.renotice2"/>
		  </s:else>
        </td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="post.userblog"/></td>
        <td>
		  <s:if test="%{action=='editdo'}">
		  <input name="userBlog" type="radio" value="1" disabled="disabled" <s:if test="%{userBlog==1}">checked="checked"</s:if> />
		  <s:text name="post.addblog"/>
		  <input name="userBlog" type="radio" value="0" disabled="disabled" <s:if test="%{userBlog==0}">checked="checked"</s:if> />
		  <s:text name="post.noaddblog"/>
		  </s:if>
		  <s:else>
		  <input name="userBlog" type="radio" value="1" <s:if test="%{userBlog==1}">checked="checked"</s:if> />
		  <s:text name="post.addblog"/>
		  <input name="userBlog" type="radio" value="0" <s:if test="%{userBlog==0}">checked="checked"</s:if> />
		  <s:text name="post.noaddblog"/>
		  </s:else>
        </td>
      </tr>
      <tr class="bgColor2">
        <td><s:text name="post.upload"/></td>
        <td>
		  <s:if test="%{action=='editdo'}">
		  <s:file name="upload" cssClass="input2" size="50" id="upload" disabled="true"></s:file>
		  </s:if>
		  <s:else>
		  <s:file name="upload" cssClass="input2" size="50" id="upload"></s:file>
		  </s:else>
        </td>
      </tr>
      <tr class="bgColor4">
        <td><s:text name="post.hiddenset"/></td>
        <td>
		  <s:if test="%{action=='addsave'}">
          <table width="100%" border="0" cellpadding="2" cellspacing="0">
          <tr>
            <td>
			  <s:checkbox name="previewAttach" id="previewAttach" />
              <s:text name="post.hiddenset1"/>
            </td>
          </tr>
          <tr>
            <td>
			  <s:if test="%{postHiddenTypeRe==1}">
			  <input name="isHidden" type="radio" value="1" <s:if test="%{isHidden==1}">checked="checked"</s:if> />
			  </s:if>
			  <s:else>
			  <input name="isHidden" type="radio" value="1" disabled="disabled" <s:if test="%{isHidden==1}">checked="checked"</s:if> />
			  </s:else>
              <s:text name="post.hiddenset2"/>
            </td>
          </tr>
          <tr>
            <td>
			  <s:if test="%{postHiddenTypeMoney==1}">
			  <input name="isHidden" type="radio" value="2" <s:if test="%{isHidden==2}">checked="checked"</s:if> />
			  </s:if>
			  <s:else>
			  <input name="isHidden" type="radio" value="2" disabled="disabled" <s:if test="%{isHidden==2}">checked="checked"</s:if> />
			  </s:else>
              <s:text name="post.hiddenset3"/>
			  <s:select list="postPriceValues" name="useCoin" id="useCoin" cssClass="select1" listKey="key" listValue="value"></s:select>
            </td>
          </tr>
          <tr>
            <td>
			  <s:if test="%{postHiddenTypeArtNum==1}">
			  <input name="isHidden" type="radio" value="3" <s:if test="%{isHidden==3}">checked="checked"</s:if> />
			  </s:if>
			  <s:else>
			  <input name="isHidden" type="radio" value="3" disabled="disabled" <s:if test="%{isHidden==3}">checked="checked"</s:if> />
			  </s:else>
              <s:text name="post.hiddenset4"/>
			  <s:textfield id="needArtNum" name="needArtNum" cssClass="input2" size="5" maxlength="5"></s:textfield>
            </td>
          </tr>
          <tr>
            <td>
			  <input name="isHidden" type="radio" value="0" <s:if test="%{isHidden==0}">checked="checked"</s:if> />
              <s:text name="post.nohidden"/>
            </td>
          </tr>
        </table>
        </s:if>
        </td>
      </tr>
      <tr class="bgColor2">
        <td colspan="2" class="font4">
          <span class="p1">
			<s:text name="post.postnotice1" />
          </span>
        </td>
        </tr>
      <tr class="bgColor4">
        <td colspan="2"><div align="center">
          <input id="postButton" name="Submit" type="button" class="button2" value="<s:text name="post.do"/>" onclick="postSubmit();"/>
		  <input type="button" name="back" value="<s:text name="bbscs.back"/>" class="button2" onclick="javascript:history.go(-1);"/>
        </div></td>
        </tr>
    </table></td>
  </tr>
  </s:form>
</table>
</body>
</html>