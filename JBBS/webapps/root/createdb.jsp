<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.lang.*"%>
<%@ page import="org.apache.commons.io.*"%>
<%
String dbtype = StringUtils.trimToEmpty((String)request.getParameter("dbtype"));
String ip = StringUtils.trimToEmpty((String)request.getParameter("ip"));
String port = StringUtils.trimToEmpty((String)request.getParameter("port"));
String dbname = StringUtils.trimToEmpty((String)request.getParameter("dbname"));
String username = StringUtils.trimToEmpty((String)request.getParameter("username"));
String passwd = StringUtils.trimToEmpty((String)request.getParameter("passwd"));
String safepath = StringUtils.trimToEmpty((String)request.getParameter("safepath"));
String dbcharset = StringUtils.trimToEmpty((String)request.getParameter("dbcharset"));

//out.println(this.getServletContext().getRealPath("/"));

if (StringUtils.isBlank(ip) || StringUtils.isBlank(port) || StringUtils.isBlank(dbname) || StringUtils.isBlank(username) || StringUtils.isBlank(safepath)) {
out.println("请将各项填写完整");
return;
}

String path = this.getServletContext().getRealPath("/");
Connection conn = null;

if (dbtype.equals("mysql")) {
try {
File cdbf = new File(path+"create.sql");
String createdbsql = FileUtils.readFileToString(cdbf,"UTF-8");
createdbsql = createdbsql.replaceAll("\\{dbname\\}",dbname);
//out.println(createdbsql);

Class.forName("org.gjt.mm.mysql.Driver").newInstance();
String url = "jdbc:mysql://"+ip+":"+port+"/?useUnicode=true&characterEncoding=UTF-8";
conn= DriverManager.getConnection(url,username,passwd);
Statement stmt = conn.createStatement();

stmt.execute(createdbsql);
stmt.close();
//conn.close();
}
catch (Exception e) {
out.println("创建数据库失败，原因：<br/>");
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


try {
File tablef = new File(path+"table.sql");
String createtablesqls = FileUtils.readFileToString(tablef,"UTF-8");
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
String url = "jdbc:mysql://"+ip+":"+port+"/"+dbname+"?useUnicode=true&characterEncoding=UTF-8";
conn = DriverManager.getConnection(url,username,passwd);
conn.setAutoCommit(false);
Statement stmt = conn.createStatement();
String[] sqls = createtablesqls.split("######");
for (int i = 0; i < sqls.length; i++) {
//out.println(sqls[i]+"<br/>");
if (StringUtils.isNotBlank(sqls[i])) {
stmt.execute(sqls[i]);
}
}
conn.commit();
conn.close();
//out.println("祝贺你！创建数据库成功！");
}
catch (Exception e) {
try {
conn.rollback();
}
catch (Exception e1) {
}
out.println("创建数据表失败，原因：<br/>");
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

try {
File dbf = new File(path+"initdb.sql");
String initdbqls = FileUtils.readFileToString(dbf,"UTF-8");
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
String url = "jdbc:mysql://"+ip+":"+port+"/"+dbname+"?useUnicode=true&characterEncoding=UTF-8";
conn = DriverManager.getConnection(url,username,passwd);
conn.setAutoCommit(false);
Statement stmt = conn.createStatement();
String[] sqls = initdbqls.split("######");
for (int i = 0; i < sqls.length; i++) {
//out.println(sqls[i]+"<br/>");
if (StringUtils.isNotBlank(sqls[i])) {
stmt.execute(sqls[i]);
}
}
conn.commit();
conn.close();

}
catch (Exception e) {
try {
conn.rollback();
}
catch (Exception e1) {
}
out.println("初始化数据库失败，原因：<br/>");
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

try {
if (!safepath.endsWith("/")) {
  safepath = safepath + "/";
}
File initf = new File(path+"init.properties");
String inittext = FileUtils.readFileToString(initf,"UTF-8");
inittext = inittext.replaceAll("\\{ip\\}",ip);
inittext = inittext.replaceAll("\\{port\\}",port);
inittext = inittext.replaceAll("\\{dbname\\}",dbname);
inittext = inittext.replaceAll("\\{username\\}",username);
inittext = inittext.replaceAll("\\{passwd\\}",passwd);
inittext = inittext.replaceAll("\\{safepath\\}",safepath);
initf = null;

File sp = new File(safepath);
if (!sp.exists()) {
  sp.mkdirs();
}
sp = null;

int index = path.lastIndexOf("webapps");
String initnewpath = path.substring(0,index)+"webapps-bbscs/root/WEB-INF/classes/init.properties";
File initnewf = new File(initnewpath);
FileUtils.writeStringToFile(initnewf,inittext,"UTF-8");
out.println("祝贺你！创建数据库成功，配置文件生成成功！");
}
catch (Exception e) {
out.println("配置文件生成失败，原因：<br/>");
out.println(e);
return;
}
}

if (dbtype.equals("oracle")) {

try {
File tablef = new File(path+"table-oracle-"+dbcharset+".sql");
String createtablesqls = FileUtils.readFileToString(tablef,dbcharset);
Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
String url = "jdbc:oracle:thin:@"+ip+":"+port+":"+dbname;
conn = DriverManager.getConnection(url,username,passwd);
conn.setAutoCommit(false);
Statement stmt = conn.createStatement();
String[] sqls = createtablesqls.split("######");
for (int i = 0; i < sqls.length; i++) {
//out.println(sqls[i]+"<br/>");
if (StringUtils.isNotBlank(sqls[i])) {
stmt.execute(sqls[i]);
}
}
conn.commit();
conn.close();
//out.println("祝贺你！创建数据库成功！");
}
catch (Exception e) {
try {
conn.rollback();
}
catch (Exception e1) {
}
out.println("创建数据表失败，原因：<br/>");
//e.printStackTrace();
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


try {
File dbf = new File(path+"initdb-oracle.sql");
String initdbqls = FileUtils.readFileToString(dbf,"UTF-8");
Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
String url = "jdbc:oracle:thin:@"+ip+":"+port+":"+dbname;
conn = DriverManager.getConnection(url,username,passwd);
conn.setAutoCommit(false);
Statement stmt = conn.createStatement();
String[] sqls = initdbqls.split("######");
for (int i = 0; i < sqls.length; i++) {
//out.println(sqls[i]+"<br/>");
if (StringUtils.isNotBlank(sqls[i])) {
stmt.execute(sqls[i]);
}
}
conn.commit();
conn.close();

}
catch (Exception e) {
try {
conn.rollback();
}
catch (Exception e1) {
}
out.println("初始化数据库失败，原因：<br/>");
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

try {
if (!safepath.endsWith("/")) {
  safepath = safepath + "/";
}
File initf = new File(path+"init-oracle.properties");
String inittext = FileUtils.readFileToString(initf,"UTF-8");
inittext = inittext.replaceAll("\\{ip\\}",ip);
inittext = inittext.replaceAll("\\{port\\}",port);
inittext = inittext.replaceAll("\\{dbname\\}",dbname);
inittext = inittext.replaceAll("\\{username\\}",username);
inittext = inittext.replaceAll("\\{passwd\\}",passwd);
inittext = inittext.replaceAll("\\{safepath\\}",safepath);
initf = null;

File sp = new File(safepath);
if (!sp.exists()) {
  sp.mkdirs();
}
sp = null;

int index = path.lastIndexOf("webapps");
String initnewpath = path.substring(0,index)+"webapps-bbscs/root/WEB-INF/classes/init.properties";
File initnewf = new File(initnewpath);
FileUtils.writeStringToFile(initnewf,inittext,"UTF-8");
out.println("祝贺你！创建数据库成功，配置文件生成成功！");
}
catch (Exception e) {
out.println("配置文件生成失败，原因：<br/>");
out.println(e);
return;
}

}
%>
