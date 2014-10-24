<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css"/>
</head>

<body>
	<title>Professor Workbench</title> 

	<div id="header">
		<h1>Professor Workbench</h1>
	</div>

	<form action="<%=request.getContextPath()+"/rest/login" %>" method="post">
		<div align=center>
			<font color="midnightblue" size="5"><br>Select Course<br></font> 
			<a href="createUser.html"><font color="blue" size="3"><br>CSC540</font></a>
			&nbsp;
			<font color="black" size="3"> Database Management Systems</font>
		</div>
		<br>
		<HR>
		<br>

		<div align=center>
			<font color="midnightblue" size="5">Add Course<br></font> 
			<font><br>(submit the form below to add a class as an professor)<br></font> 
			<label for="classtoken"><br>ClassToken:</label> 
			<input type="text" name="classtoken" placeholder="Enter Class Token" required>
			<br>
			<br>
			<input type="submit" onclick="f()" value="Sign Up">
			<%--<button type="submit" onclick="f()">Sign Up</button> --%>
		</div>	
	</form>

</body>
</html>
