<%@ page import="java.sql.*,java.io.*,java.net.URLEncoder,javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Retrieve parameters from the form submission
    int customerId = Integer.parseInt(request.getParameter("customerId"));
    int productId = Integer.parseInt(request.getParameter("productId"));

    String dbUser = "system";
    String dbPasswd = "sapna9430";
    String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";

    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPasswd)) {
        // Execute the DELETE query to remove the product from the cart
        String deleteQuery = "DELETE FROM cart WHERE customerId = ? AND productId = ?";
        PreparedStatement deleteStmt = conn.prepareStatement(deleteQuery);
        deleteStmt.setInt(1, customerId);
        deleteStmt.setInt(2, productId);
        int rowsAffected = deleteStmt.executeUpdate();

        if (rowsAffected > 0) {
            // Successfully deleted the product from the cart
            out.println("<script type='text/javascript'>");
            out.println("alert('Successfully removed the product from the cart.');");
            out.println("window.location.href = 'cartlist.jsp?customerId=" + customerId + "';");
            out.println("</script>");
        } else {
            // Product was not found in the cart
            out.println("<p>Product not found in the cart.</p>");
        }

        deleteStmt.close();

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>An error occurred while deleting the product from the cart.</p>" + e);
    }
%>
