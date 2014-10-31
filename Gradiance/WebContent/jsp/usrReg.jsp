<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" />
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
				if(request.getAttribute("registerResult")==null) 
					out.print("<font size='5'>Register User</font>");
				else 
					out.print("<font size='5'>" + request.getAttribute("registerResult") + "</font>");
			 %>
	</div>
	<br><br><br>
	<div align="center">
	<form action="<%=request.getContextPath()+"/rest/register" %>" method="post">
		<table><tbody>
			<tr>
				<td>
					<label for="user">Character:</label>
				</td>
				<td>
					<select name="authority" style="width: 156px">
						<option >&nbsp;</option>
						<option value="0">Instructor</option>
						<option value="1">Teaching Assistant</option>
						<option value="2">Student</option>
					</select>
				</td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td>
					<label for="user">Unity ID:</label>
				</td>
				<td >
					<input type="text" style="width: 150px" name="uid" placeholder="Enter unity id" required>
				</td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td>
					<label for="pwd">Password:</label>
				</td>
				<td>
					<input type="password" style="width: 150px" name="upass" placeholder="Enter password" required>
				</td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td>
					<label for="name">Username:</label>
				</td>
				<td>
					<input type="text" style="width: 150px" name="name" placeholder="Enter username" required>
				</td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="Create" style="width:50px">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type='button' value="Back" style="width:50px" onclick="window.location.href='../jsp/usrLog.jsp'">
				</td>
			</tr>
			
		</tbody></table>
		
				
	</form>
	
	<!--  ><a href="<%
		if(session.getAttribute("curUser")!=null)
			out.print("index.jsp");
		else out.print("usrLog.jsp");
	%>">Back</a>-->
	
	</div>
	
	<br><br><br>
	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
