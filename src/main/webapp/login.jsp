<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%-- Database Connection Parameters --%>
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.InputStream" %>
<%
    String url = "jdbc:mysql://localhost:3306/JSP";
    String username = "root";
    String password = "2059";
    
    String user = request.getParameter("username");
    String pass = request.getParameter("password");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
        
        pstmt = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
        pstmt.setString(1, user);
        pstmt.setString(2, pass);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            // Valid login, redirect to index.jsp
            response.sendRedirect("index.jsp");
        } else {
            // Invalid login, redirect back to login.html with an error message
            response.sendRedirect("login.html?error=1");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
