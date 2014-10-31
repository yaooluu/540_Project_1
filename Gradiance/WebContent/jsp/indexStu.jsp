<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Student Dashboard</title> 
<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" />
<style>
#header {
	background-color: black;
	color: white;
	text-align: center;
	padding-top: 20px;
	padding-right: 50px;
	padding-bottom: 20px;
	padding-left: 50px;
}

#footer {
	background-color: black;
	color: white;
	clear: both;
	text-align: center;
	font-size: 12px;
	padding: 5px;
}
</style>
</head>

<body style="font-family: sans-serif; font-weight:lighter ">
	
	<div id="header">
		<%out.println("<font size='5'>Welcome back</font><font size='4'><br>" + session.getAttribute("curUserName")+"</font>");%>	
	</div>

	<div align="center">
		<font color="midnightblue" size="5"><br>Select Course<br><br></font>
		
				
		<!-- here we use jsp to load current student's selected courses. -->
		<%
			List<Course> list = (List<Course>) request.getAttribute("selectedCourses"); 
			if(list != null) {
				int i=0;
				for(Course c : list) {
					i++;
					out.println("<form id='myForm_"+i+"' action='" + request.getContextPath()+"/rest/student/courseOption" + "' method='post'>");
					out.println("<table style='width:886px'><tbody><tr><td style='width:280px'></td><td align='left' style='width:80px'>");
					out.println("<a href='#' onclick=\"document.getElementById('myForm_"+i+"').submit()\"><font color='blue' size='3'>"+c.getCid()+"</font></a><td>");
					out.println("<td style='width:30px'></td><td align='left'><font color='black' size='3'>"+c.getName()+"</font></td><td></td>");
					out.println("<input type='hidden' name='cid' value='"+c.getCid()+"'/>");
					out.println("</tr></tbody></table>");
					out.println("</form>");
				}
			}else out.println("You haven't selected any course yet.");
		%>
	</div>
		
	<br><HR><br>
	
		
	<form action="<%=request.getContextPath()+"/rest/student/addCourse" %>" method="post">	
		<div align="center">
			<font color="midnightblue" size="5">Add Course<br></font> 
			<font><br>(submit the form below to add a class as a student)<br></font> 
			<%
				if(request.getAttribute("addCourseResult")!=null) out.print("<font color='red'>("+request.getAttribute("addCourseResult")+")</font>");
			%>
			<label for="classtoken"><br>Course Token:</label>
			<input type="text" name="token" placeholder="Enter Class Token" required>
			<br>
			<br>
			<input type="submit" value="Sign Up"><br><br>
		</div>
	</form>	
	<br><br><br>
	<div id="footer">Copyright ©2014 YYYD Database Team.</div>
</body>
</html>
