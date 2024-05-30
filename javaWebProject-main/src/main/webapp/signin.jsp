<%@ page import="java.sql.*, java.io.*" %>
<%
    String uname = request.getParameter("name");
    String uemail = request.getParameter("email");
    String upassword = request.getParameter("password");
    String uaddress = request.getParameter("address");
    PrintWriter outWriter = response.getWriter(); // Renamed variable

    // Define your database connection parameters
    String dbUser = "system";
    String dbPasswd = "sapna9430";
    String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Connect to the database
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPasswd);

        // Check if the email already exists
        String checkEmailQuery = "SELECT * FROM customer WHERE email = ?";
        PreparedStatement checkEmailStmt = conn.prepareStatement(checkEmailQuery);
        checkEmailStmt.setString(1, uemail);
        ResultSet checkEmailResult = checkEmailStmt.executeQuery();

        if (checkEmailResult.next()) {
            // Email already exists, handle accordingly (e.g., show an error message)
            outWriter.println("Email already exists. Please choose a different one.");
        } else {
            // Email doesn't exist, insert the new user
            String insertQuery = "INSERT INTO customer (customerName, email, password, address) VALUES (?, ?, ?, ?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
            insertStmt.setString(1, uname);
            insertStmt.setString(2, uemail);
            insertStmt.setString(3, upassword);
            insertStmt.setString(4, uaddress);

            int numRowsAffected = insertStmt.executeUpdate();

            if (numRowsAffected > 0) {
                // User successfully added
                // Redirect to login.html after successful sign-up
                response.sendRedirect("login.html");
            } else {
                // Something went wrong
                outWriter.println("Error signing up. Please try again.");
                
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
