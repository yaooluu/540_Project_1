<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css"/>
</head>

<body>
	<title>Student Dashboard</title> 

	<div id="header">
		<h1><%out.println("Welcome back, " + session.getAttribute("curUser"));%></h1>	
	</div>

	<div align="center">
		<font color="midnightblue" size="5"><br>Select Course<br><br></font>
		
		<!-- the first part is an static example for writing jsp below! -->
		<form id="myForm" action="<%=request.getContextPath()+"/rest/student/viewCourse"%>" method="post">	 
			<a href="#" onclick="document.getElementById('myForm').submit()">CSC540</a> Database Management Systems
			<input type="hidden" name="cid" value="CSC540"/>
		</form>
		
		<!-- here we use jsp to load current student's selected courses. -->
		<%
			List<Course> list = (List<Course>) request.getAttribute("selectedCourses"); 
			if(list != null) {
				 for(Course c : list) {
					 out.println("<form id='myForm' action='" + request.getContextPath()+"/rest/student/viewCourse" + "' method='post'>");
					 out.println("<a href='#' onclick='document.getElementById('myForm').submit()'>"+c.getCid()+"</a> "+c.getName()+"<br>");
					 out.println("<input type='hidden' name='cid' value='"+c.getCid()+"'/>");
					 out.println("</form>");
				 }
			}
		%>
		
	
	</div>
		
	<br><HR><br>
	
	<form action="<%=request.getContextPath()+"/rest/student/addCourse" %>" method="post">	
		<div align="center">
			<font color="midnightblue" size="5">Add Course<br></font> 
			<font><br>(submit the form below to add a class as an student)<br></font> 
			<%
				if(request.getAttribute("addCourseResult")!=null) out.print("<font color='red'>("+request.getAttribute("addCourseResult")+")</font>");
			%>
			<label for="classtoken"><br>Course Token:</label>
			<input type="text" name="token" placeholder="Enter Class Token" required>
			<input type="submit" value="Add Course"><br><br>
		</div>
	</form>	

	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
