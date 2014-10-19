<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Welcome to Gradiance!</title>
	
	<div id="header">
		<h1><%out.println("Welcome, " + session.getAttribute("curUser"));%></h1>	
	</div>
	
	This is Index Page!!!


	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
