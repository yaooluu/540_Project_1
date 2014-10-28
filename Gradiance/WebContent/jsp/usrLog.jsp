<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Log in</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />

</head>

<body style="font-family: sans-serif; font-weight:lighter ">
	
	<h1 id="header" style="font-family: sans-serif; font-weight:lighter; font-size:5">
		<%
			if (request.getAttribute("registerResult") != null)
				out.print(request.getAttribute("registerResult"));
			else if (request.getAttribute("loginResult") != null)
				out.print(request.getAttribute("loginResult"));
			else
				out.print("Welcome! Guest.");
		%>
	</h1>
	<br>
	<div align="center">
		<form action="<%=request.getContextPath() + "/rest/login"%>"
			method="post">
			<div>
				<label for="user">Username:</label>&nbsp;&nbsp; 
				<input type="text" name="uid" placeholder="Enter unity id" required>
			</div>
			<br>
			<div class="form-group">
				<label for="pwd">Password:</label>&nbsp;&nbsp; 
				<input type="password" name="upass" placeholder="Enter password" required>
			</div>
			<br>
			<input type="submit" value="Login" style="width:50px">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="Exit" onclick="self.close()" style="width:50px">
		</form>
		<br><HR><br>
		<a href="usrReg.jsp" style="color: midnightblue;">Create New Account</a>
	</div>
	<br><br><br><br><br>
	<div id="footer">Copyright ©2014 YYYD Database Team.</div>
</body>
</html>
