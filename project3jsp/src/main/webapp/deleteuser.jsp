<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String UserId=request.getParameter("UserId");
	
	if(UserId!=null){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project3jsp","root","Shadab@mysql");
			String sql="DELETE FROM users WHERE UserId=?";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1, UserId);
			stmt.executeUpdate();
			stmt.close();
			con.close();
			
			response.sendRedirect("dashboard.jsp");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
%>
</body>
</html>