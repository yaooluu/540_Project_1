<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Reports for Professor</title>
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
										<td colspan="4"><font color="midnightblue" size="4"><br>
												Reports:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="6"><br></td></tr>
									<tr>
										<td colspan="6" align="center"
											style="color: white; background-color: grey; height: 15px">
											Retrieval/Reports Query:</td>
									</tr>
									<tr><td colspan="6">&nbsp;</td></tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Choose A Query:</font>
										</td>
										<td colspan="3" align="left" style="white-space: nowrap">
											<select style="width: 430px">
												<option>&nbsp;</option>
												<option>Find students who did not take Homework 1.</option>
												<option>Find students who scored the maximum score on the first attempt for Homework 1.</option>
												<option>Find students who scored the maximum score on the first attempt for any homework.</option>
												<option>For each student, show total score for each homework and average score overall homework.</option>
												<option>For each homework and question, show the maximum and minimum score.</option>
												<option>For each homework and question, show average number of attempts.</option>
											</select>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="6">&nbsp;</td></tr>
									<tr>
										<td colspan="6" align="center"
											style="color: white; background-color: grey; height: 15px">
											Query Result:</td>
									</tr>
									<tr><td colspan="6">&nbsp;</td></tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Student ID</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Student Name</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Assignment</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Score</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">200067020</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">Ting Dai</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">HW 1</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">N/A</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="6">&nbsp;</td></tr>
									
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Student ID</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Student Name</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Assignment</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Max Score</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">200067020</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">Ting Dai</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">HW 1</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">32.0</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="6">&nbsp;</td></tr>
									
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Student ID</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Student Name</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Assignment</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Max Score</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">200067020</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">Ting Dai</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">HW 1</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">32.0</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">200067021</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">Yao Lu</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">HW 2</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">32.0</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="6">&nbsp;</td></tr>
									
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Student ID</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Student Name</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Assignment</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Max Score</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">200067020</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">Ting Dai</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">HW 1</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">32.0</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">200067020</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">Ting Dai</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">HW 2</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">32.0</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">200067020</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">Ting Dai</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">AVG</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">32.0</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="6">&nbsp;</td></tr>
									
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Assignment</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Question</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Max Score</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Mini Score</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">HW 1</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">Q 1</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">32.0</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">10.0</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">HW 1</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">--</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">32.0</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">10.0</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">HW 2</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">Q 1</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">32.0</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">10.0</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">HW 2</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">--</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">32.0</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">10.0</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="6">&nbsp;</td></tr>
									
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Assignment</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Question</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											AVG of Attempts</td>
										<td style="width: 142px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">HW 1</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">Q 1</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">10</font></td>
										<td style="width: 142px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">HW 1</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">--</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											<font size="2">12</font></td>
										<td style="width: 142px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<tr><td colspan="6">&nbsp;</td></tr>
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
