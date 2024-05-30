<%@ page import="java.sql.*" %>

<%
  
  //initialize driver class
  try {    
    Class.forName("oracle.jdbc.driver.OracleDriver");
  } catch (Exception e) {
    out.println("Fail to initialize Oracle JDBC driver: " + e.toString() + "<P>");
  }
  
  String dbUser = "system";
  String dbPasswd = "sapna9430";
  String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";

  //connect
  Connection conn = null;
  try {
    conn = DriverManager.getConnection(dbURL, dbUser, dbPasswd);
    out.println(" Connection status: " + conn + "<P>");
  } catch(Exception e) {
    out.println("Connection failed: " + e.toString() + "<P>");      
  }

  String sql;
  int numRowsAffected;
  Statement stmt = conn.createStatement();
  ResultSet rs;
  
  // select
  sql = "SELECT * FROM student1";
  rs = stmt.executeQuery(sql);
  while (rs.next()) {
    out.println("roll = " + rs.getInt(1) + ", name = " + rs.getString(2) + ", branch = " + rs.getString(3) + ", institute = " + rs.getString(4) + ", year = " + rs.getString(5) + "<BR>");  
  }
%>  

<HTML>
<BODY>