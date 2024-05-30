<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Add your head content here -->
    <style>
    .button {
        display: grid;
        grid-template-columns: repeat(2, 1fr); /* Two items per row */
        gap: 20px; /* Adjust the gap between items as needed */
    }
    .product-details {
        display: grid;
        grid-template-columns: repeat(2, 1fr); /* Two items per row */
        gap: 20px;
    }
    </style>
</head>
<body>
<nav style="background-color:#0095b6">
    <img src="https://tse1.mm.bing.net/th?id=OIP.ccAk4ftbru1PxSraZsdWawHaBs&pid=Api&P=0&h=180" style="width:300px; height:100px;">
</nav>

<div class="container">
    <%
        try {
            // Check if the customerId exists in the session
           

            // Retrieve product ID from request parameter
            int productId = Integer.parseInt(request.getParameter("id"));
            session = request.getSession(true); // Ensure session is retrieved or created only once
            session.setAttribute("productId", productId);
            

            // Initialize driver class
            Class.forName("oracle.jdbc.driver.OracleDriver");

            String dbUser = "system";
            String dbPasswd = "sapna9430";
            String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";

            // Connect to the database
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPasswd);

            String sql = "SELECT * FROM product WHERE productid = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productId);
            

            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
    %>
                <div class="product-details">
                    <img class="product-image" src="<%= rs.getString("imageurl") %>" alt="<%= rs.getString("imageurl") %>">
                    <div class="detail">
                        <div class="product-title"><h1><%= rs.getString("productname") %></h1></div>
                        <div class="product-rating"><h2>Rating: <%= rs.getInt("rating") %></h2></div>
                        <div class="product-price"><h2>Rs.<%= rs.getInt("price") %></h2></div>
                        
                        <!-- Add more details as needed -->

                        <!-- Add to Cart button -->
                        <div class="button">
                            <form action="addtocart.jsp" method="post">
                                <input type="hidden" name="productId" value="<%= rs.getInt("productid") %>">
                                <button type="submit" style="padding: 15px; background-color: #FBAB7E; background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%); margin:10px; border-radius:10px; width:40%">
                                    Add to cart
                                </button>
                            </form>
                            
                            <!-- Add to Wish List button -->
                            <form action="addtowishlist.jsp" method="post">
                                <input type="hidden" name="productId" value="<%= rs.getInt("productid") %>">
                                <button type="submit" style="padding: 15px; background-color: #FBAB7E; background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%); margin:10px; border-radius:10px; width:40%">
                                    Add to wishlist
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
    <%
            } else {
                out.println("<p>Product not found</p>");
            }

            // Close resources and disconnect
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
            out.println("<p>An error occurred. Please check the server logs for details.</p>");
        }
    %>
</div>

</body>
</html>
