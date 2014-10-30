<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Logged in as Professor</title>
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
	padding: 5px;
}
</style>

</head>

<body style="font-family: sans-serif; font-weight:lighter ">

	<!-- Here we use this java code to get params from server and display ^_^ -->	

	<div id="header">
		<%out.println("<font size='5'>Welcome back</font><font size='4'><br>" + session.getAttribute("curUserName")+"</font>");%>	
	</div>


	<div align="center">
		<font color="midnightblue" size="5"><br>Select Course<br><br></font>
				
		<!-- here we use jsp to load current student's selected courses. -->
		<%
			List<Course> list = (List<Course>) request.getAttribute("selectedCourses"); 
			if(list != null && list.size()>0) {
				int i=0;
				for(Course c : list) {
					i++;
					out.println("<form id='myForm_"+i+"' action='" + request.getContextPath()+"/rest/prof/courseOption" + "' method='post'>");
					out.println("<a href='#' onclick=\"document.getElementById('myForm_"+i+"').submit()\">"+c.getCid()+"</a> &nbsp;"+c.getName()+"<br>");
					out.println("<input type='hidden' name='cid' value='"+c.getCid()+"'/>");
					out.println("</form>");
				}
			}else
				out.println("You haven't selected any course yet.");
		%>
	</div>
		
	<br><HR><br>
	
	<form action="<%=request.getContextPath()+"/rest/prof/addCourse" %>" method="post">
		<div align=center>
			<font color="midnightblue" size="5">Add Course<br></font> 
			<font><br>(submit the form below to add a class as an professor)<br></font> 
			<%
				if(request.getAttribute("addCourseResult")!=null) out.print("<font color='red'>("+request.getAttribute("addCourseResult")+")</font>");
			%>
			<label for="classtoken"><br>Course Token:</label> 
			<input type="text" name="token" placeholder="Enter Course Token" required>
			<input type="submit" value="Add Course"><br><br>
		</div>	
	</form>
	

</body>
</html>
