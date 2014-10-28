<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" />
</head>

<body>
<table>
<tbody>
	<tr>
		<td style="width: 200px;">
			<br> <br> •&nbsp; <a href="<%=request.getContextPath()+"/rest/index"%>" style="color: black;">Home Page</a>
			<br> <br> •&nbsp; <a href="<%=request.getContextPath()+"/jsp/addHwProf.jsp" %>" style="color: black;">Add Homework</a>  
			<br> <br> <form id="myForm1" action="<%=request.getContextPath()+"/rest/prof/addRmQsProf"%>" method="post">
					  •&nbsp; <a href="#" style="color: black;" onclick="document.getElementById('myForm1').submit()">Add/Remove Questions</a></form>
			<br> <br> <form id="myForm" action="<%=request.getContextPath()+"/rest/prof/editHwProf"%>" method="post">
					  •&nbsp; <a href="#" style="color: black;" onclick="document.getElementById('myForm').submit()">Edit Homework</a></form>
			     <br> •&nbsp; <a href="<%=request.getContextPath()+"/jsp/viewHwProf.jsp" %>" style="color: black;">View Homework</a> 
			<br> <br> •&nbsp; <a href="<%=request.getContextPath()+"/jsp/viewNotifProf.jsp" %>" style="color: black;">View Notification</a> 
			<br> <br> •&nbsp; <a href="<%=request.getContextPath()+"/jsp/rptProf.jsp" %>" style="color: black;">Reports</a> 
			<br> <br> •&nbsp; <a href="" style="color: black;">Log Out</a>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><HR></td>
	</tr>
	<tr style="color: black; height: 20px;">
			<td valign="middle"><font size="1">Copyright © 2014&nbsp;YYYD Database Team.</font></td>
		</tr>
	</tbody>
</table>
</body>
</html>
