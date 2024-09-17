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
<link rel='stylesheet' href='adduser.css'>
</head>
<body>
<%
	String fullname=request.getParameter("fullname");
	String contactno=request.getParameter("contactno");
	String role=request.getParameter("role");
	if(fullname!=null || contactno!=null ||role!=null){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project3jsp","root","Shadab@mysql");
			String sql="INSERT INTO users(Fullname,ContactNo,Role) VALUES(?,?,?)";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1, fullname);
			stmt.setString(2, contactno);
			stmt.setString(3, role);
			stmt.executeUpdate();
			stmt.close();
			con.close();
			
			response.sendRedirect("dashboard.jsp");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
%>
	<div class="header">
		<a href="dashboard.jsp">Back</a>
	</div>
	<form action='addUser.jsp' method='post' onsubmit='return validateForm()' id='userForm'>
		<div class="title">
			<h2>add user</h2>
		</div>
		
		<div class="form-field">
			<label>fullname</label>
			<input type="text" name='fullname'>
		</div>
		<div class="form-field">
			<label>contact</label>
			<input type="number" name='contactno'>
		</div>
		<div class="form-field">
			<label>role</label>
			<select name='role'>
				<option value="">SELECT ROW</option>
				<option value="admin">admin</option>
				<option value="client">client</option>
				<option value="manager">manager</option>
			</select>
			
			<div class="button-field">
				<input type='submit' value="addUser" >
			</div>
			
		</div>
		
	</form>
	<script>
		function validateForm(){
			var fullname=document.getElementById("userForm").fullname.value;
			var contactno=document.getElementById("userForm").contactno.value;
			var role=document.getElementById("userForm").role.value;
			
			if(fullname==='' || contactno==='' || role===''){
				alert("All field required!!");
				return false;
			}
			if(contactno.length!=10){
				alert("Invalid contact number!!");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>