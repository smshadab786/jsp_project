<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>


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
<link rel='stylesheet' href='style.css'>
</head>
<body>
<%
	HttpSession session1=request.getSession();
	String user=(String)session1.getAttribute("user");
	if(user!=null){
		response.sendRedirect("dashboard.jsp");
	}
%>
<div id='notification'>
	<div class='box' id='box' value='<%=(String)request.getAttribute("msg") %>'>
	<p class='error'>Login failed!!</p>
	
	</div>

</div>
<div class='container'>
	<form action='CheckLogin' method='post' id='loginForm' onsubmit='return validateForm()'>
		<div class='title'>
			<h2>Login</h2>
		</div>
		<div class='form-field'>
			<i class="ri-user-3-fill"></i>
			<input type='email' name='username' placeholder='Username'>
		</div>
		<div class='form-field'>
			<i class="ri-lock-fill"></i>
			<input type='password' name='pwd' placeholder='password'>
		</div>
		<div class='button-field'>
		<input type='submit' value='Login'>
		</div>
		<p>Don't have an account?<a href='register.jsp'>Click here</a> to create new account</p>
		
	
	
	</form>
	
	<div class='background'>
	
	</div>

</div>
<script>
	var box=document.getElementById('box')
	if(box.getAttribute("value")==="failed"){
		box.style.display='grid';
		setTimeout(()=>{
			box.style.display='none';
		},4000);
	}
	function validateForm(){
		var username=document.getElementById('loginForm').username.value;
		var pwd=document.getElementById('loginForm').pwd.value;
		if(username==='' || pwd===''){
			alert("Username and password required");
			return false;
		}
		
	}
</script>

</body>
</html>