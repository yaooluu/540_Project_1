<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Student Dashboard</title>
	
	<div id="header">
		<h1><%out.println("Welcome, " + session.getAttribute("curUser"));%></h1>	
	</div>
	
	<button onclick="window.location.href='../jsp/selectCourse.jsp'">Select Course</button>
	<p></p>
	<button onclick="window.location.href='../jsp/addCourse.jsp'">Add Course</button>
	
	<a href="login.jsp">Back</a>
	</div>
	
	<div id="section">
	<p id="reserved"></p>
	</div>

	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
