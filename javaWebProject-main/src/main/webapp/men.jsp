<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Men's Products</title>
    <!-- Add your head content here -->
    <!-- Add your styles and scripts -->
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .container {
        max-width: 1200px;
        margin: 20px auto;
        padding: 0 20px;
    }

    .product-grid {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .product-card {
        width: calc(33.33% - 20px); /* 3 items per row with some margin */
        margin-bottom: 20px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        overflow: hidden;
       box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
    }

    .product-image {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

    .product-details {
        padding: 15px;
    }

    .product-title {
        font-size: 1.2em;
        margin-bottom: 10px;
    }

    .product-rating {
        color: #e44d26;
    }

    .product-price {
        font-size: 1.2em;
        font-weight: bold;
        color: #333;
    }
</style>
</head>
<body>
<nav style="background-color:#0095b6">
    <img src="https://tse1.mm.bing.net/th?id=OIP.ccAk4ftbru1PxSraZsdWawHaBs&pid=Api&P=0&h=180" style="width:300px; height:100px;">
</nav>
<h2 style="background-color:white; padding:20px">Men's Products</h2>

<div class="container">
    <div class="product-grid">
        <% try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            String dbUser = "system";
            String dbPasswd = "sapna9430";
            String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";

            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPasswd);

            String sql = "SELECT * FROM product where section='M'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
        %>
                <div class="product-card">
                    <div class="product-details">
                        <img class="product-image" src="<%= rs.getString("imageurl") %>" alt="<%= rs.getString("imageurl") %>">
                        <div class="product-title"><%= rs.getString("productname") %></div>
                        <div class="product-rating">Rating: <%= rs.getInt("rating") %></div>
                        <div class="product-price">Rs.<%= rs.getInt("price") %></div>
                        <a href="product.jsp?id=<%= rs.getInt("productid") %>" style="text-decoration: none;">
                            <input type="button" value="Explore" style="padding: 15px; background-color: #FBAB7E; background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%); margin:10px; border-radius:10px; width:40%">
                        </a>
                    </div>
                </div>
        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>An error occurred. Please check the server logs for details.</p>");
        }
        %>
    </div>
</div>

</body>
</html>
