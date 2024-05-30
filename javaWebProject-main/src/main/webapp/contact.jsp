<%@ page import="java.sql.*,javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="style.css">
    <style>
        h1 { text-align: center; }
        p { padding-left: 50px; padding-right: 50px; }
        .contact-person {
            margin: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
            text-align: center;
        }
        .contact-person:hover {
            transform: scale(1.05);
        }
        .contact-person img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }
        .contact-person h2 {
            margin: 10px 0;
        }
        .contact-person a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <header style="background-color: #0095b6;">
        <div class="logo">
            <img src="https://tse1.mm.bing.net/th?id=OIP.ccAk4ftbru1PxSraZsdWawHaBs&pid=Api&P=0&h=180" style="width:300px; height:100px">
            <nav>
                <a href="home.jsp">Home</a>
                <% if(session.getAttribute("AccMail")== null){%>
                <a href="login.html">Login</a>
                <%} %>
                <a href="aboutus.jsp">About Us</a>
                <% if(session.getAttribute("AccMail")!= null){%>
                <a href="logout.jsp">Logout</a>
                <%} %>
                <% if(session.getAttribute("AccMail")!= null){%>
                <a href="#"><%= session.getAttribute("AccName") %></a>
                <%} %>
                <% if(session.getAttribute("AccMail")!= null){%>
                <a href="cartlist.jsp">cart</a>
            	<%} %>
            </nav>
        </div>
    </header>

    <section>
        <h1>Contact Our Team</h1>
        <div class="contact-person">
            <img src="http://erp.silicon.ac.in:443/uploads/student_photo/SITBBS_B.TECH_2021-2025/CSE/21BCSC01/21BCSC01.jpg" alt="Person 1">
            <h2>SAPNA RANI</h2>
            <p>21BCSC01</p>
            <p>Contact: +91 8210271807</p>
            <a href="mailto:SAPNARANI@GMAIL.COM">Email: sapnarani@gmail.com</a>
        </div>
        
        <div class="contact-person">
            <img src="http://erp.silicon.ac.in:443/uploads/student_photo/SITBBS_B.TECH_2021-2025/ECE/21BECF93/21BECF93.jpg" alt="Person 3">
            <h2>	TANISHA PATHAK</h2>
            <p>21BECF93</p>
            <p>Contact: +91 6372849486</p>
            <a href="mailto:tanisha@gmail.com">Email: tanishaPathak@gmail.com</a>
        </div>

        <div class="contact-person">
            <img src="http://erp.silicon.ac.in:443/uploads/student_photo/SITBBS_B.TECH_2021-2025/CSE/21BCSF41/21BCSF41.jpg" alt="Person 2">
            <h2>Nirmalendu Swain</h2>
            <p>21BCSF41</p>
            <p>Contact: +91 8339869000</p>
            <a href="mailto:nirmalswain@gmail.com">Email: nirmalswain@gmail.com</a>
        </div>

        <div class="contact-person">
            <img src="http://erp.silicon.ac.in:443/uploads/student_photo/SITBBS_B.TECH_2021-2025/CSE/22BCSL17/22BCSL17.jpg" alt="Person 4">
            <h2>SUSMITA SAHOO</h2>
            <p>22BCSL17</p>
            <p>Contact: +91 7894421949</p>
            <a href="mailto:susmitasahoo.com">Email: susmitaSahoo@gmail.com</a>
        </div>
    </section>

    <footer>
        <p>&copy; 2023 Your eCommerce Website</p>
        <nav>
            <a href="#">Home</a>
            <a href="#">Shop</a>
            <a href="#">About Us</a>
            <a href="#">Contact</a>
        </nav>
        <p>Follow us on social media:</p>
        <a href="#" target="_blank">Facebook</a>
        <a href="#" target="_blank">Twitter</a>
        <a href="#" target="_blank">Instagram</a>
    </footer>
</body>
</html>