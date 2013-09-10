<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.apache.commons.lang.*"%>
<%
String dbtype = StringUtils.trimToEmpty((String)request.getParameter("dbtype"));
String ip = StringUtils.trimToEmpty((String)request.getParameter("ip"));
String port = StringUtils.trimToEmpty((String)request.getParameter("port"));
String dbname = StringUtils.trimToEmpty((String)request.getParameter("dbname"));
String username = StringUtils.trimToEmpty((String)request.getParameter("username"));
String passwd = StringUtils.trimToEmpty((String)request.getParameter("passwd"));

//out.println(this.getServletContext().getRealPath("/"));
out.println(dbtype);
if (StringUtils.isBlank(ip) || StringUtils.isBlank(port) || StringUtils.isBlank(dbname) || StringUtils.isBlank(username)) {
out.println("请将各项填写完整");
return;
}

if (dbtype.equals("mysql")) {
try {
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
String url = "jdbc:mysql://"+ip+":"+port+"/?useUnicode=true&characterEncoding=UTF-8";
Connection conn= DriverManager.getConnection(url,username,passwd);
out.println(conn);
out.println("<br/>");
out.println("连接测试成功！");
conn.close();
}
catch (Exception e) {
out.println("连接数据库失败，原因：<br/>");
out.println(e);
}
}

if (dbtype.equals("oracle")) {

try {
Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
String url = "jdbc:oracle:thin:@"+ip+":"+port+":"+dbname;
Connection conn= DriverManager.getConnection(url,username,passwd);
out.println(conn);
out.println("<br/>");
out.println("连接测试成功！");
conn.close();
}
catch (Exception e) {
out.println("连接数据库失败，原因：<br/>");
out.println(e);
}
}
%>
