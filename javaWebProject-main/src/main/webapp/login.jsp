<%@ page import="java.sql.*,java.io.*,java.net.URLEncoder,javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>

<%
    String uemail = request.getParameter("email");
    String upassword = request.getParameter("password");
    String dbUser = "System";
    String dbPasswd = "sapna9430";
    String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";

    Connection conn = null;
    PreparedStatement loginStmt = null;
    int productId = (Integer) session.getAttribute("productId");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPasswd);

        String loginQuery = "SELECT customerId FROM customer WHERE email = ? AND password = ?";
        loginStmt = conn.prepareStatement(loginQuery);
        loginStmt.setString(1, uemail);
        loginStmt.setString(2, upassword);
        ResultSet loginResult = loginStmt.executeQuery();

        if (loginResult.next()) {
            int customerId = loginResult.getInt("customerId");
            session = request.getSession(true); // Ensure session is retrieved or created only once
            session.setAttribute("customerId", customerId);
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("signin.html?error=userNotFound");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (loginStmt != null) loginStmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>