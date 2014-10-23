<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Course Options for Professor</title>
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
</style>
</head>

<body style="font-family: sans-serif; font-weight:lighter ">

	<!-- Here we use this java code to get params from server and display ^_^ -->
	<title><%=request.getAttribute("title") %></title> 

	<div id="header">
		<%--<button style="float: left" onclick="g();">Click Me!!!</button>--%>
		<font size="5">Welcome to CSC540</font>
		<font size="4"><br>Database Management Systems</font>
	</div>

	<form action="<%=request.getContextPath()+"/rest/login" %>" method="post">
		<div align=center>
			<table>
				<tbody valign="top">
					<tr>
						<td style="width: 220px;">
							<table>
								<tbody>
									<tr>
										<td style="width: 200px;">
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/loggedProf.jsp" style="color: black;">Home Page</a>
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/addhw.jsp" style="color: black;">Add Homework</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/addrevQs.jsp" style="color: black;">Add/Remove Questions</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/edithw.jsp" style="color: black;">Edit Homework</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/viewhw.jsp" style="color: black;">View Homework</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/viewnotif.jsp" style="color: black;">View Notification</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/reports.jsp" style="color: black;">Reports</a> 
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
						</td>
						<td style="width: 2px; background-color: grey;"></td>
						<td style="width: 686px;">
							<br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size="2">•&nbsp; Click Home Page to go back the the logged in page.</font>							
							<br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size="2">•&nbsp; Click Add Homework to create a new homework.</font>
							<br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size="2">•&nbsp; Click Add/Remove questions to add or remove questions in the existing homework</font> 
							<br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<font size="2">•&nbsp; Click Edit homework to update the information of the existing homework</font>
							<br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size="2">•&nbsp; Click View homework to see the details of the existing homework </font>
							<br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size="2">•&nbsp; Click View notification to see the notifications </font>
							<br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size="2">•&nbsp; Click Reports to display the user's query</font>
							<br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font size="2">•&nbsp; Click Log Out to logout of the system</font>							
						</td>	
					</tr>
				</tbody>
			</table>
			<br> <br>			
		</div>
	</form>

</body>
</html>
