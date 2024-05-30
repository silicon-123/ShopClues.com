<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout Page</title>
</head>
<body>

<%
    // Retrieve the existing session
     session = request.getSession(false);

    // If session exists, invalidate it to logout the user
    if (session != null) {
        session.invalidate();
    }

    // Redirect the user to the login page after logout
    response.sendRedirect("login.html");

%>

</body>
</html>
