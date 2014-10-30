<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Log in</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
<style>
#header {
	background-color: black;
	color: white;
	text-align: center;
	padding-top: 30px;
    padding-right: 50px;
    padding-bottom: 30px;
    padding-left: 50px;
} 
</style>
</head>

<body style="font-family: sans-serif; font-weight:lighter ">
	
	<div id="header">
		<%
			if (request.getAttribute("registerResult") != null)
				out.print("<font size='5'>" +request.getAttribute("registerResult")+ "</font>");
			else if (request.getAttribute("loginResult") != null)
				out.print("<font size='5'>"+request.getAttribute("loginResult")+ "</font>");
			else
				out.print("<font size='5'>Welcome! Guest</font>");
		%>
	</div>
	<br><br><br>
	<div align="center">
		<form action="<%=request.getContextPath() + "/rest/login"%>" method="post">
		<table><tbody>
			<tr>
				<td>
					<label for="user">Username:</label>
				</td>
				<td >
					<input type="text" name="uid" placeholder="Enter unity id" required>
				</td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td>
					<label for="pwd">Password:</label>
				</td>
				<td>
					<input type="password" name="upass" placeholder="Enter password" required>
				</td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="Login" style="width:50px">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="Exit" onclick="self.close()" style="width:50px">
				</td>
			</tr>			
		</tbody></table>	
		</form>
		
		<br><HR><br>
		<a href="<%=request.getContextPath()+"/jsp/usrReg.jsp"%>" style="color: midnightblue;">Create New Account</a>
	</div>
	<br><br><br>
	<div id="footer">Copyright ©2014 YYYD Database Team.</div>
</body>
</html>
