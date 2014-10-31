<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<title>TA Dashboard</title> 
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
		
		<!-- the first part is an static example for writing jsp below! 
		<form id="myForm" action="request.getContextPath()+"/rest/student/viewCourse"" method="post">	 
			<a href="#" onclick="document.getElementById('myForm').submit()">CSC540</a> Database Management Systems
			<input type="hidden" name="cid" value="CSC540"/>
		</form>-->
		
		
		<!-- here we use jsp to load current student's selected courses. -->
		<%
			List<Course> list = (List<Course>) request.getAttribute("selectedCourses"); 
			if(list != null  && list.size()>0) {
				int i=0;
				for(Course c : list) {
					i++;
					out.println("<form id='myForm_"+i+"' action='" + request.getContextPath()+"/rest/TA/courseOption" + "' method='post'>");
					out.println("<table style='width:886px'><tbody><tr><td style='width:280px'></td><td align='left' style='width:80px'>");
					out.println("<a href='#' onclick=\"document.getElementById('myForm_"+i+"').submit()\"><font color='blue' size='3'>"+c.getCid()+"</font></a><td>");
					out.println("<td style='width:30px'></td><td align='left'><font color='black' size='3'>"+c.getName()+"</font></td><td></td>");
					out.println("<input type='hidden' name='cid' value='"+c.getCid()+"'/>");
					out.println("</tr></tbody></table>");
					out.println("<input type='hidden' name='isTACourse' value='0'/>");
					out.println("</form>");
				}
			}else out.println("You haven't selected any course yet.");
		%>
		<br><br>
		<font color="midnightblue" size="5"><br>Select TA Course<br><br></font>
		
		<!-- here we use jsp to load current TA's selected courses. -->
		<%
			List<Course> list2 = (List<Course>) request.getAttribute("TACourses"); 
			if(list2 != null && list2.size()>0) {
				int i=0;
				for(Course c : list2) {
					i++;
					out.println("<form id='taForm"+i+"' action='" + request.getContextPath()+"/rest/TA/courseOption" + "' method='post'>");
					out.println("<table style='width:886px'><tbody><tr><td style='width:280px'></td><td align='left' style='width:80px'>");
					out.println("<a href='#' onclick=\"document.getElementById('taForm"+i+"').submit()\"><font color='blue' size='3'>"+c.getCid()+"</font></a><td>");
					out.println("<td style='width:30px'></td><td align='left'><font color='black' size='3'>"+c.getName()+"</font></td><td></td>");
					out.println("<input type='hidden' name='cid' value='"+c.getCid()+"'/>");
					out.println("</tr></tbody></table>");
					out.println("<input type='hidden' name='isTACourse' value='1'/>");
					out.println("</form>");
				}
			}else out.println("You haven't added any TA course yet.");
		%>
	</div>
		
	<br><HR><br>
	
		
	<form action="<%=request.getContextPath()+"/rest/TA/addCourse"%>" method="post">	
		<div align="center">
			<font color="midnightblue" size="5">Add Course<br></font> 
			<font><br>(submit the form below to add a class)<br></font> 
			<%
				if(request.getAttribute("addCourseResult")!=null) out.print("<font color='red'>("+request.getAttribute("addCourseResult")+")</font>");
			%>
			<label for="classtoken"><br>Course Token:</label>
			<input type="text" name="token" placeholder="Enter Class Token" required>
			<font size="2">
				<input type="radio" name="isTACourse" value="0" checked="checked">&nbsp;Student
				&nbsp;&nbsp;
				<input type="radio" name="isTACourse" value="1">&nbsp;TA
			</font>
			<br><br>
			<input type="submit" value="Sign Up"/><br><br>
		</div>
	</form>	
	<br><br><br>
	<div id="footer">Copyright ©2014 YYYD Database Team.</div>
</body>
</html>
