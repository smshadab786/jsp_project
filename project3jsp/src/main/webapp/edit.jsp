<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='updateUser.css'>
</head>
<body>
	<div class="header">
		<a href="dashboard.jsp">Back</a>
	</div>
	<form action='update.jsp' method='post' id='userForm'>
		<div class="title">
			<h2>Update user</h2>
		</div>
		<div class='form-field'>
		<label>UserId</label>
		<input type='number' name='userId' readonly>
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
				<input type='submit' value="UpdateUser">
			</div>
			
		</div>
		
	</form>
<script>
	const params=new URLSearchParams(window.location.search);
	var userId=params.get('id');
	var fullName=params.get('fn');
	var contactno=params.get('user');
	var role=params.get('role');
	
	document.getElementById("userForm").userId.value=userId;
	document.getElementById("userForm").fullname.value=fullName;
	document.getElementById("userForm").contactno.value=contactno;
	document.getElementById("userForm").role.value=role;
</script>
</body>
</html>