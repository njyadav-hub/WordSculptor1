package com.wordsculptor.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database configuration
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/wordsculptor"; // apna DB naam
    private static final String JDBC_USER = "root";       // apna username
    private static final String JDBC_PASSWORD = "yourpassword"; // apna password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Form data (names JSP ke sath match kar diye hain)
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Password check
        if (!password.equals(confirmPassword)) {
            out.println("<script>alert('Passwords do not match!'); window.location='signup.jsp';</script>");
            return;
        }

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Insert query
            String sql = "INSERT INTO users (first_name, last_name, email, phone, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, password); // ⚠️ Production me hamesha hash karo

            int row = ps.executeUpdate();

            if (row > 0) {
                out.println("<script>alert('Account created successfully! Please login.'); window.location='login.jsp';</script>");
            } else {
                out.println("<script>alert('Signup failed! Try again.'); window.location='signup.jsp';</script>");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace(out);
            out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='signup.jsp';</script>");
        }
    }
}
