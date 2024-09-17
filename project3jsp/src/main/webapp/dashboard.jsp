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

<link rel='stylesheet' href='dashboard.css'>

</head>
<body>
<%
	HttpSession session1=request.getSession();
	String user=(String)session1.getAttribute("user");
	String fullname="";
	int noOfUsers=0;
	if(user==null){
		response.sendRedirect("index.jsp");
	}else{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project3jsp","root","Shadab@mysql");
			String sql="SELECT Fullname FROM register WHERE Username=?";
			PreparedStatement stmt=con.prepareStatement(sql);
			stmt.setString(1, user);
			ResultSet rs=stmt.executeQuery();
			if(rs.next()) {
				fullname=rs.getString(1);
				
				
			
				}else {
				
			}
			stmt.close();
			PreparedStatement stmt1=con.prepareStatement("SELECT count(*) from users");
			ResultSet rs1=stmt1.executeQuery();
			if(rs1.next()){
				noOfUsers=rs1.getInt(1);
			}
			stmt1.close();
			con.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
%>
<div class='header'>
	<h2>Welcome ,<%=fullname %></h2>
	<a href='logout.jsp'>Logout</a>
</div>
<div class='container1'>
	<a href='addUser.jsp'>AddUser</a>
	<p><%=noOfUsers %> user</p>
</div>
<div class='main-container'>
	<div class='container2'>
		<div class='input-field'>
			<label>Enter fullname to filter</label>
			<input type='text' id='userInput' onkeyup='return filterTable()'>
		</div>
		<table>
			<thead>
				<tr>
					<th>#</th>
					<th>fullname</th>
					<th>contact</th>
					<th>role</th>
					<th></th>
				</tr>
			</thead>
			<tbody id='table'>
			
			<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project3jsp","root","Shadab@mysql");
	String sql="Select * from users";
	PreparedStatement stmt=con.prepareStatement(sql);
	ResultSet rs=stmt.executeQuery();
	if(rs!=null) {
		while(rs.next()){
			%>
			<tr>
				<td><%=rs.getInt(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td>
					<a href='edit.jsp?id=<%=rs.getInt(1) %>&fn=<%=rs.getString(2) %>&user=<%=rs.getString(3) %>&role=<%=rs.getString(4) %>'><i class="ri-pencil-fill"></i></a>
					<a href='deleteuser.jsp?UserId=<%=rs.getInt(1) %>'><i class="ri-delete-bin-fill"></i></a>
				</td>
            </tr>
<%
		}
		
	}else{
		%>
		<tr>
		<td colspan="4">No Users Available!!</td>
		
    </tr>
    <%
	}
	stmt.close();

	con.close();
}
catch(Exception ex) {
	ex.printStackTrace();
}




%>

	</tbody>
		</table>
	</div>
	
</div>
<script>
	function filterTable(){
		var userInput=document.getElementById("userInput").value;
		var table=document.getElementById("table");
		
		var trs=table.getElementsByTagName("tr");
		for(let i=0;i<trs.length;i++){
			var tds =trs[i].getElementsByTagName("td");
			var matchFound=false;
			if(tds[1].textContent.toLowerCase().indexOf(userInput)>-1){
				matchFound=true;
			}else{
				matchFound=false;
			}
			if(!matchFound){
				trs[i].classList.add("tr-hide")
			}else{
				if(trs[i].classList.contains("tr-hide")){
					trs[i].classList.remove("tr-hide")
				}
				trs[i].classList.add("tr-show")
			}
		}
	}
</script>

</body>
</html>