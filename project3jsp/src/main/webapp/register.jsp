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
<link
    href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css"
    rel="stylesheet"
/>
<link rel='stylesheet' href='style1.css'>
</head>
<body>
<div class='container'>
	<div class='background'>
	
	</div>
	<form action='register.jsp' method='post' id='regForm' onsubmit='return validateForm()'>
		<div class='title'>
			<h2>Register</h2>
		</div>
		<div class='form-field'>
			<i class="ri-user-3-fill"></i>
			<input type='text' name='fullname' placeholder='Username'>
		</div>
		<div class='form-field'>
			<i class="ri-mail-fill"></i>
			<input type='email' name='username' placeholder='EmailId'>
		</div>
		<div class='form-field'>
			<i class="ri-phone-fill"></i>
			<input type='number' name='contact' placeholder='Number'>
		</div>
		<div class='form-field'>
			<i class="ri-lock-fill"></i>
			<input type='password' name='pwd' placeholder='password'>
		</div>
		<div class='form-field'>
			<i class="ri-lock-fill"></i>
			<input type='password' name='cnf' placeholder=' confirm password'>
		</div>
		<div class='button-field'>
		<input type='submit' value='Register'>
		</div>
		<p>Already have an account?<a href='index.jsp'>Click here</a> to login</p>
		
	
	
	</form>
	
	

</div>
<%
	String fullname=request.getParameter("fullname");
	String username=request.getParameter("username");
	String contact=request.getParameter("contact");
	String pwd=request.getParameter("pwd");
	String cnf=request.getParameter("cnf");
	
	if(fullname!=null || username!=null || contact!=null || pwd!=null || cnf!=null){
		System.out.println(fullname+""+username+""+contact+""+pwd+""+cnf);
	}
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project3jsp","root","Shadab@mysql");
	String sql1="INSERT INTO register (Fullname,Username,ContactNo) VALUES(?,?,?)";
	PreparedStatement stmt1=con.prepareStatement(sql1);
	stmt1.setString(1,fullname);
	stmt1.setString(2,username);
	stmt1.setString(3,contact);
	stmt1.executeUpdate();
	String sql2="INSERT INTO login VALUES(?,?)";
	PreparedStatement stmt2=con.prepareStatement(sql2);
	stmt2.setString(1,username);
	stmt2.setString(2,pwd);
	stmt2.executeUpdate();
	
	stmt1.close();
	stmt2.close();
	con.close();
	response.sendRedirect("index.jsp");
	
	
	
	}catch(Exception ex){
		ex.printStackTrace();
	}
%>
<script>
	function validateForm(){
		var fullname=document.getElementById('regForm').fullname.value;
		var username=document.getElementById('regForm').username.value;
		var contact=document.getElementById('regForm').contact.value;
		var pwd=document.getElementById('regForm').pwd.value;
		var cnf=document.getElementById('regForm').cnf.value;
		
		if(fullname===''|| username=== '' || contact==='' || pwd ===''|| cnf===''){
			alert("All fieds required!!");
			return false;
		}
		if(pwd!=cnf){
			alert("password doesn't match!!");
			return false;
		}
		if(contact.length!=10){
			alert("Invalid contact number!!");
			return false;
		}
		return true;
	}
</script>
</body>
</html>