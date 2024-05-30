<%@ page import="java.sql.*,javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <style>
        /* Embedded Styles */
         h1 {
            background-color: #0095b6; 
            padding: 10px; 
            border: solid black 1px;
            border-radius: 10px;
            color: white;
        }
        
        input {
            padding: 15px; 
            background-color: #FBAB7E; 
            background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%); 
            margin:10px; 
            border-radius:10px; 
            width:20%; 
            margin-left:300px;
        }
        
    </style>
</head>
<body>

<%
    int customerId = Integer.parseInt(request.getParameter("customerId"));
    double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
    int orderId = 0;

    String dbUser = "system";
    String dbPasswd = "sapna9430";
    String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";

    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPasswd)) {
        // Fetch customer's current balance
        String balanceQuery = "SELECT bankbalence FROM customer WHERE customerId = ?";
        PreparedStatement balanceStmt = conn.prepareStatement(balanceQuery);
        balanceStmt.setInt(1, customerId);
        ResultSet balanceResult = balanceStmt.executeQuery();

        if (balanceResult.next()) {
            double currentBalance = balanceResult.getDouble("bankbalence");

            if (currentBalance >= totalAmount) {
                // Update the customer's balance after placing the order
                double updatedBalance = currentBalance - totalAmount;
                String updateQuery = "UPDATE customer SET bankbalence = ? WHERE customerId = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                updateStmt.setDouble(1, updatedBalance);
                updateStmt.setInt(2, customerId);
                updateStmt.executeUpdate();

                // Insert order details into the orders table
                

               

                // Delete all cart items for the customer
                String deleteCartQuery = "DELETE FROM cart WHERE customerId = ?";
                PreparedStatement deleteCartStmt = conn.prepareStatement(deleteCartQuery);
                deleteCartStmt.setInt(1, customerId);
                deleteCartStmt.executeUpdate();

                out.println("<h1>Order Successful!</h1>");
                out.println("<p>Order ID: " + orderId + "</p>");
                out.println("<p>Amount deducted: Rs" + totalAmount + "</p>");
                out.println("<p>Remaining Balance: Rs" + updatedBalance + "</p>");
            } else {
                out.println("<h1>Error</h1>");
                out.println("<p>Insufficient balance to place the order.</p>");
            }
        }

        balanceResult.close();
        balanceStmt.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>An error occurred while processing payment.</p>" + e);
        return;
    }
%>

<!-- Button to redirect to the home page -->
<form action="home.jsp" method="get">
    <input type="submit" value="Go to Home Page">
</form>
</body>
</html>
