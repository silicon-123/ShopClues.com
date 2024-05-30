<%@ page import="java.sql.*,java.io.*,java.net.URLEncoder,javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <style>
        /* Embedded Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        
        h1, h2, h3 {
            color: #333;
        }

        h1 {
            background-color: #0095b6; 
            padding: 10px; 
            border: solid black 1px;
            border-radius: 10px;
            color: white;
        }

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
            border: 0;
            border-top: 1px solid #eee;
        }
        input
        {
        padding: 15px; background-color: #FBAB7E; background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%); margin:10px; border-radius:10px; width:20% ;margin-left:300px
        }
        
    </style>
</head>
<body>

<%
    int customerId = (Integer)session.getAttribute("customerId");

    String dbUser = "system";
    String dbPasswd = "sapna9430";
    String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";

    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPasswd)) {
        // Fetch customer details
        String customerQuery = "SELECT customername, address FROM customer WHERE customerId = ?";
        PreparedStatement customerStmt = conn.prepareStatement(customerQuery);
        customerStmt.setInt(1, customerId);
        ResultSet customerResult = customerStmt.executeQuery();

        if (customerResult.next()) {
            String customerName = customerResult.getString("customername");
            String customerAddress = customerResult.getString("address");

            out.println("<h1>Customer Details</h1>");
            out.println("<p><strong>Name:</strong> " + customerName + "</p>");
            out.println("<p><strong>will be deliver :</strong> " + customerAddress + "</p>");
            out.println("<hr>");
        }

        // Fetch all items in the cart for the customer
        String cartQuery = "SELECT p.productname, p.price, c.quantity FROM product p INNER JOIN cart c ON p.productId = c.productId WHERE c.customerId = ?";
        PreparedStatement cartStmt = conn.prepareStatement(cartQuery);
        cartStmt.setInt(1, customerId);
        ResultSet cartResult = cartStmt.executeQuery();

        double totalAmount = 0.0;

        out.println("<h1>Order Detail</h1>");

        while (cartResult.next()) {
            String productName = cartResult.getString("productname");
            double productPrice = cartResult.getDouble("price");
            int quantity = cartResult.getInt("quantity");

            double totalPriceForProduct = productPrice * quantity;
            totalAmount += totalPriceForProduct;

            out.println("<p><h2>" + productName + "</h2></p>");
            out.println("<p><h3> Rs" + productPrice + "</h3></p>");
            out.println("<p> Quantity: " + quantity + "</p>");
            out.println("<p>Total Price for this item: Rs" + totalPriceForProduct + "</p>");
            out.println("<hr>"); // A horizontal line for separation
        }

        out.println("<h3>Total Amount for all items: Rs" + totalAmount + "</h3>");

        // Displaying the button to confirm the order
        out.println("<form action='payment.jsp' method='post'>");
        out.println("<input type='hidden' name='customerId' value='" + customerId + "'>");
        out.println("<input type='hidden' name='totalAmount' value='" + totalAmount + "'>");
        out.println("<input type='submit' value='Confirm Order'>");
        out.println("</form>");

        customerResult.close();
        customerStmt.close();
        cartResult.close();
        cartStmt.close();

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>An error occurred while fetching details.</p>" + e);
        return;
    }
%>

</body>
</html>
