<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!Connection con = null;
	PreparedStatement psmt = null;
	String sql = "insert into users(username,email,password) values(?,?,?)";%>
	<%
	String name = request.getParameter("username");
	String email = request.getParameter("email");
	String pwd = request.getParameter("password");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/jsp", "root", "2059");
		psmt = con.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, email);
		psmt.setString(3, pwd);
		int row = psmt.executeUpdate();
		if (row > 0) {
	%>
	<jsp:forward page="login.html"></jsp:forward>
	<%
	} else {
	%>
	<jsp:forward page="registration.html"></jsp:forward>
	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>