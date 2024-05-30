package com.uniquedeveloper.signin;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the login.jsp for the initial form view
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
       try(PrintWriter out=response.getWriter())
       {
    	   String uemail = request.getParameter("email");
           String upassword = request.getParameter("password");
           out.print(uemail+upassword);
       }
        
        // Assuming you have a method or logic to validate user credentials against the database
        HashMap<String, Object> user = validateUser(uemail, upassword);

        // Forward the user HashMap to the JSP
        request.setAttribute("user", user);
        request.getRequestDispatcher("/login.jsp").forward(request, response);
        
    }

    // Sample method to validate user (replace with your actual database validation logic)
    private HashMap<String, Object> validateUser(String email, String password) {
        HashMap<String, Object> user = null;
        
        // Example: 
        // Connect to the database, query for the user with the given email and password
        // If user exists, populate the user HashMap with user details
        
        // This is just a placeholder. You'd replace this with actual database logic.
        
        return user;
    }
}
