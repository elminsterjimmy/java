<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>天乙社区安装程序</title>
<style type="text/css">
<!--
body {
	font-family: Verdana, Tahoma, "宋体";
	font-size: 9pt;
}
.result {
	background-color: #FFF4F4;
	padding: 3px;
	border: 1px solid #FF0000;
}
-->
</style>
<script type="text/javascript" src="prototype.js"></script>
<script language="JavaScript" type="text/javascript">
<!--
function dbtest() {
  $('result').className = "result";
  $('result').innerHTML = "正在执行请稍候...";
  var url = "setup.jsp";
  var pars = "ip="+$('ip').value+"&port="+$('port').value
  +"&dbname="+$('dbname').value+"&username="+$('username').value
  +"&passwd="+$('passwd').value+"&safepath="+$('safepath').value
  +"&dbtype="+$('dbtype').value+"&dbcharset="+encodeURIComponent($('dbcharset').value);

  var myAjax = new Ajax.Request(url, {method: 'post', parameters: pars, onComplete: testResult});
}

function createdb() {
  $("Submit2").disabled = true;
  $('result').className = "result";
  $('result').innerHTML = "正在执行请稍候...";
  var url = "createdb.jsp";
  var pars = "ip="+$('ip').value+"&port="+$('port').value
  +"&dbname="+$('dbname').value+"&username="+$('username').value
  +"&passwd="+$('passwd').value+"&safepath="+$('safepath').value
  +"&dbtype="+$('dbtype').value+"&dbcharset="+encodeURIComponent($('dbcharset').value);

  var myAjax = new Ajax.Request(url, {method: 'post', parameters: pars, onComplete: testResult});
}

function updatedb() {
  $('result').className = "result";
  $('result').innerHTML = "正在执行请稍候...";
  var url = "update.jsp";
  var pars = "ip="+$('ip').value+"&port="+$('port').value
  +"&dbname="+$('dbname').value+"&username="+$('username').value
  +"&passwd="+$('passwd').value+"&dbtype="+$('dbtype').value+"&dbcharset="+encodeURIComponent($('dbcharset').value);

  var myAjax = new Ajax.Request(url, {method: 'post', parameters: pars, onComplete: testResult});
}

function testResult(res) {
  $('result').innerHTML = res.responseText;
    if ($("Submit2").disabled == true) {
  $("Submit2").disabled = false;
  }
}
//-->
</script>
</head>

<body>
<form id="form1" name="form1" method="post" action="setup.jsp">
  <strong>天乙社区安装程序</strong><br />
    <label>数据库
    <select name="dbtype" id="dbtype">
      <option value="mysql">Mysql</option>
      <option value="oracle">Oracle</option>
    </select>
    </label>
    <br />
    <label>数据库服务器地址
    <input name="ip" type="text" id="ip" value="localhost" />
    </label>
    <br />
    <label>数据库服务端口
    <input name="port" type="text" id="port" value="3306" />
    </label>
    <br />
    <label>数据库名/SID
    <input name="dbname" type="text" id="dbname" value="bbscs8" />(Oracle请填写SID)
    </label>
    <br />
    <label>数据库用户名
    <input name="username" type="text" id="username" value="root" />
    </label>
    <br />
    <label>数据库用户密码
    <input name="passwd" type="text" id="passwd" />
    </label>
    <br />
    <label>安全目录
    <input name="safepath" type="text" id="safepath" value="C:/safe/"/>注意：目录路径必须以“/”结尾
    </label>
	<br />
	<label>Oracle数据库安装字符集
    <select name="dbcharset" id="dbcharset">
      <option value="GBK">GBK</option>
      <option value="UTF-8">UTF-8</option>
    </select>
	(Mysql用户不用管此项)
    </label>
    <br />
    <input type="button" name="Submit" value="测试连接" onclick="dbtest();"/>
    <input type="button" name="Submit2" id="Submit2" value="全新安装数据库" onclick="createdb();"/>
	<!--
    <br/><br/>
    使用Mysql数据库，从7.1升级至7.1.1版本，注意：该项操作只升级数据库<br/>
    <input type="button" name="Submit3" value="从7.1升级数据库" onclick="updatedb();"/>
	-->
</form>

<div id="result"></div>
</body>
</html>