<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Register</title>
	<div id="header">
		<h1>
			<%
				if(request.getAttribute("registerResult")==null) out.print("Register User");
				else out.print(request.getAttribute("registerResult"));
			 %>
		</h1>
	</div>
	
	<form action="<%=request.getContextPath()+"/rest/register" %>" method="post">
		<label for="character">character</label><br>
		<input type="radio" name="authority" value="0">Instructor<br>
		<input type="radio" name="authority" value="1">TA<br>
		<input type="radio" name="authority" value="2">Student<br>
		
		<label for="user">Username:<br></label>
		<input type="text" class="form-control" name="uname"
		placeholder="Enter username" required><br>
		<label for="pwd">Password:<br></label>
		<input type="password" class="form-control" name="upass"
		placeholder="Enter password" required><br>
		<label for="pwd">Unity ID:<br></label>
		<input type="password" class="form-control" name="uid"
		placeholder="Enter Unity ID" required><br>
			
		<button type="submit">Create</button><br>
	</form>
	<a href="<%
		if(session.getAttribute("curUser")!=null)
			out.print("index.jsp");
		else out.print("login.jsp");
	%>">Back</a>

	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
