<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.lang.*"%>
<%@ page import="org.apache.commons.io.*"%>
<%

String ip = StringUtils.trimToEmpty((String)request.getParameter("ip"));
String port = StringUtils.trimToEmpty((String)request.getParameter("port"));
String dbname = StringUtils.trimToEmpty((String)request.getParameter("dbname"));
String username = StringUtils.trimToEmpty((String)request.getParameter("username"));
String passwd = StringUtils.trimToEmpty((String)request.getParameter("passwd"));

if (StringUtils.isBlank(ip) || StringUtils.isBlank(port) || StringUtils.isBlank(dbname) || StringUtils.isBlank(username)) {
out.println("请将各项填写完整");
return;
}

String path = this.getServletContext().getRealPath("/");
Connection conn = null;
try {
File tablef = new File(path+"up71to711.sql");
String createtablesqls = FileUtils.readFileToString(tablef,"UTF-8");
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
String url = "jdbc:mysql://"+ip+":"+port+"/"+dbname+"?useUnicode=true&characterEncoding=UTF-8";
conn = DriverManager.getConnection(url,username,passwd);
conn.setAutoCommit(false);
Statement stmt = conn.createStatement();
String[] sqls = createtablesqls.split("######");
for (int i = 0; i < sqls.length; i++) {
if (StringUtils.isNotBlank(sqls[i])) {
stmt.execute(sqls[i]);
}
}
conn.commit();
conn.close();
out.println("祝贺你！数据库升级成功！");
}
catch (Exception e) {
try {
conn.rollback();
}
catch (Exception e1) {
}
out.println("数据库升级失败，原因：<br/>");
out.println(e);
return;
}
finally {
  if (conn != null) {
    try {
    conn.close();
    }
    catch (Exception e) {
    }
    conn = null;
  }
}
%>