<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Course Options</title>
	<div id="header"><h1>Course Options</h1></div><br>
	
	<div align="center">
		
		<form id="myForm_1" action="<%=request.getContextPath()+"/rest/student/viewScoreList"%>" method="post">
			<a href="#" onclick="document.getElementById('myForm_1').submit()">View Scores</a>
		</form><br>
		
		<form id="myForm_2" action="<%=request.getContextPath()+"/rest/student/viewHomeworkList"%>" method="post">
			<a href="#" onclick="document.getElementById('myForm_2').submit()">View Homework Due</a>
		</form><br>
		
		<form id="myForm_3" action="<%=request.getContextPath()+"/rest/student/viewSubmissionList"%>" method="post">
			<a href="#" onclick="document.getElementById('myForm_3').submit()">View Submissions</a>
		</form><br>
	</div>

	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
