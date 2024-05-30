<%@ page import="java.sql.*,java.io.*,java.net.URLEncoder,javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Retrieve customerId from the session
     
    String dbUser = "system";
    String dbPasswd = "sapna9430";
    String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
    if (session.getAttribute("customerId") == null) {
        // Redirect to the login page
        response.sendRedirect("login.html");
        return; // Stop further execution of JSP
    }
    
int customerId = (Integer) session.getAttribute("customerId");
int productId = (Integer) session.getAttribute("productId");

    
    


    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPasswd)) {
        // Insert the product into the cart
    	// Fetch existing cart details
    	String checkQuery = "SELECT quantity FROM wishlist WHERE customerId = ? AND productId = ?";
    	PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
    	checkStmt.setInt(1, customerId);
    	checkStmt.setInt(2, productId);
    	ResultSet checkResult = checkStmt.executeQuery();

    	if (checkResult.next()) {
    	    // Product already exists in cart, update the quantity
    	    int existingQuantity = checkResult.getInt("quantity");
    	    int newQuantity = existingQuantity + 1;  // Increase the quantity
    	    String updateQuery = "UPDATE wishlist SET quantity = ? WHERE customerId = ? AND productId = ?";
    	    PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
    	    updateStmt.setInt(1, newQuantity);
    	    updateStmt.setInt(2, customerId);
    	    updateStmt.setInt(3, productId);
    	    updateStmt.executeUpdate();
    	} else {
    	    // Product does not exist in cart, insert new record
    	    String insertQuery = "INSERT INTO wishlist (customerId, productId, quantity) VALUES (?, ?, 1)";
    	    PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
    	    insertStmt.setInt(1, customerId);
    	    insertStmt.setInt(2, productId);
    	    insertStmt.executeUpdate();
    	}

    	// Close resources
    	checkResult.close();
    	checkStmt.close();
    	// ... Close other resources

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>An error occurred while adding the product to the wishlist.</p>"+e);
        return;
    }

    // Redirect the user to a confirmation page or back to the home page
    response.sendRedirect("wishlist.jsp");
    
%>
