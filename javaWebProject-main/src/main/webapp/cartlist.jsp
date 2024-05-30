<%@ page import="java.sql.*, java.util.*" %>
<nav style="background-color:#0095b6">
    <img src="https://tse1.mm.bing.net/th?id=OIP.ccAk4ftbru1PxSraZsdWawHaBs&pid=Api&P=0&h=180" style="width:350px; height:100px;">
</nav>
<h1>Your Cart List</h1>

<script>
function redirectToOrder(productIds) {
    // Set productIds in session-like storage
    sessionStorage.setItem('selectedProductIds', JSON.stringify(productIds));
    
    // Redirect to order.jsp
    window.location.href = 'order.jsp';
}
</script>

<%
    // Check if the customerId exists in the session
    int customerId = (Integer)session.getAttribute("customerId");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    double totalAmount = 0.0;
    List<Integer> productIdsList = new ArrayList<>();

    try {
        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish database connection
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String username = "system";
        String password = "sapna9430";
        conn = DriverManager.getConnection(url, username, password);

        // Fetch products in the cart for the specific customer
        String query = "SELECT p.productid, p.price, p.imageurl, c.quantity FROM product p INNER JOIN cart c ON p.productid = c.productid WHERE c.customerid = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, customerId); // Set as int
        rs = pstmt.executeQuery();

        while (rs.next()) {
            int productId = rs.getInt("productid");
            double price = rs.getInt("price");
            int quantity = rs.getInt("quantity");
            String imageURL = rs.getString("imageurl");

            // Add product ID to list
            productIdsList.add(productId);

            // Display product details
%>
            <div style="border:solid 1px black;border-radius:10px; margin:50px;padding:30px">
                <img src="<%= imageURL %>" alt="Product Image" width="110px" height="110px">
                <span style="margin-left:100px">Price: <%= price %> </span>
                <span style="margin-left:100px">Quantity: <%= quantity %> </span>
            </div>
<%
            totalAmount += (price * quantity); // Calculate total amount
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
    }
%>

<!-- Display total amount -->
<div>
    <h3>Total Amount: <%= totalAmount %></h3>
    <button onclick="redirectToOrder(<%= productIdsList.toString() %>)" style="padding: 15px; background-color: #FBAB7E; background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%); margin:10px; border-radius:10px; width:20% ;margin-left:300px">Buy Now</button>
</div>
