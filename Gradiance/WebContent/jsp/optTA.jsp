<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Course Options for TA</title>
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

	<div id="header">
		<font size="5"><%=session.getAttribute("cid") %></font> 
		<font size="4"><br><%=session.getAttribute("courseTitle") %></font>
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
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/indexTA.jsp" style="color: black;">Home Page</a>
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/viewHwTA.jsp" style="color: black;">View Homework</a>  
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/rptTA.jsp" style="color: black;">Reports</a> 
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
							<font size="2">•&nbsp; Click View homework to see the details of the existing homework </font>
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
