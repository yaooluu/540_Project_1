<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Login</title>
	
	<div id="header">
		<h1>
			<%
				if(request.getAttribute("registerResult")!=null) out.print(request.getAttribute("registerResult"));
				else if(request.getAttribute("loginResult")!=null) out.print(request.getAttribute("loginResult"));
				else out.print("Welcome! Guest.");
			 %>
		</h1>
	</div><br>
	<div align="center">
	
	<form action="<%=request.getContextPath()+"/rest/login"%>" method="post">
	        <div>
	          <label for="user">Username:</label>
	          <input type="text" name="uid" placeholder="Enter unity id" required>
	        </div>
	        <div class="form-group">
	          <label for="pwd">Password:</label>
	          <input type="password" name="upass" placeholder="Enter password" required>
	        </div>
	        <button type="submit">Login</button>
		<input type="button" value="Exit" onclick="self.close()">
	</form>
	
	<a href="usrReg.jsp">Register</a>

	</div><br>
	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
