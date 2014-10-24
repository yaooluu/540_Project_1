<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>View Notification</title>
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
										<td>
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/indexProf.jsp" style="color: black;">Home Page</a>
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/addHwProf.jsp" style="color: black;">Add Homework</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/addRmQsProf.jsp" style="color: black;">Add/Remove Questions</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/editHwProf.jsp" style="color: black;">Edit Homework</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/viewHwProf.jsp" style="color: black;">View Homework</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/viewNotifProf.jsp" style="color: black;">View Notification</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/rptProf.jsp" style="color: black;">Reports</a> 
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
							<table>
								<tbody>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="3" style="width: 586px"><font color="midnightblue" size="4"><br>View
												Notifications:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Unread Notification:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="3" align="center" style="white-space: nowrap"><font size="2">None.</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Read Notifications:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="3" align="center" style="white-space: nowrap"><font size="2">None.</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>

</body>
</html>
