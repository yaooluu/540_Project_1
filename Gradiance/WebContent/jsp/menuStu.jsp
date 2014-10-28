<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" />
</head>

<body>
<table>
	<tbody>
		<tr><td style="width: 220px;">
		    <table><tbody>
		    <tr><td><br></td></tr> 
		    <tr><td>
		    	•&nbsp; <a href="<%=request.getContextPath()+"/rest/index"%>" style="color: black;">Home Page</a>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	<form id="myForm_1" action="<%=request.getContextPath()+"/rest/student/viewScoreList"%>" method="post">
					•&nbsp; <a href="#" style="color: black;" onclick="document.getElementById('myForm_1').submit()">View Scores</a>
				</form>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	<form id="myForm_2" action="<%=request.getContextPath()+"/rest/student/viewHomeworkList"%>" method="post">
					•&nbsp; <a href="#" style="color: black;" onclick="document.getElementById('myForm_2').submit()">Attempt Homework</a>
				</form>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	<form id="myForm_3" action="<%=request.getContextPath()+"/rest/student/viewSubmissionList"%>" method="post">
					•&nbsp; <a href="#" style="color: black;" onclick="document.getElementById('myForm_3').submit()">View Submissions</a>
				</form>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	•&nbsp; <a href="http://localhost:8080/Gradiance/jsp/viewNotifStu.jsp" style="color: black;">View Notification</a>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	•&nbsp; <a href="#" style="color: black;">Log Out</a>
		    </td></tr>
		    </tbody></table>
			
		</td></tr>
		
		<tr><td>&nbsp;</td></tr>
		
		<tr><td><HR></td></tr>
		
		<tr style="color: black; height: 20px;">
			<td valign="middle"><font size="1">Copyright © 2014&nbsp;YYYD Database Team.</font></td>
		</tr>
	</tbody>
</table>
</body>
</html>
