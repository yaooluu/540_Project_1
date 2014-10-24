<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search & Add or Remove Questions</title>
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
										<td colspan="3" style="width: 586px"><font color="midnightblue" size="4"><br>Search & Add or Remove Questions:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Basic Homework Information:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td valign="top" align="left" style="white-space: nowrap; width:268px" >
											<font size="2">•&nbsp;Topics:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap; width:268px">
											<textarea rows="2" readonly style="width:150px">1. Introduction to database design 
												2. Storing data: Disks and Files 
												3. Primary File organizations 
												4. Tree Structures </textarea>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Difficulty:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap">
											<font size="2">from&nbsp;
											<input type="text" style="width: 30px" name="attemptnum" placeholder="1">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to&nbsp;
											<input type="text" style="width: 30px" name="attemptnum" placeholder="5">
											</font>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Question List:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="3" align="left" style="width:574px">
											<font size="2">•&nbsp;Please tick the Questions you want to add and untick the Questions you want to remove.
											</font>		
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>								
									<tr>
										<td valign="top" align="center" style="width: 50px;"><input type="checkbox" name="questions" value="checkbox" checked></td>
										<td colspan="3" align="left" style=" word-wrap: break-word; width:574px">
											<font size="2">1.&nbsp;&nbsp;Which of the following is necessarily true about the
												City and State entity sets and their relationship In?<br>
												a)&nbsp;&nbsp;No person can be the mayor of two different cities.<br>
												b)&nbsp;&nbsp;No person can be a mayor and a governor at the same time.<br>
												c)&nbsp;&nbsp;No person can be the mayor of Cities In two different States.<br>
												d)&nbsp;&nbsp;No two Cities In the same State can have the same name.<br>
											</font>		
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td></td>
										<td colspan="3"><HR></td>
										<td></td>
									</tr>
									<tr>
										<td valign="top" align="center" style="width: 50px;"><input type="checkbox" name="questions" value="checkbox" checked></td>
										<td colspan="3" align="left"
											style="word-wrap: break-word; width:574px">
											<font size="2">2.&nbsp;&nbsp;Translate the above E/R diagram to relations, 
												using the "E/R" approach to handling ISA hierarchies. Then, identify 
												which of the following relations is NOT in the resulting database schema.<br> 
												a)&nbsp;&nbsp;F(c,d)<br> 
												b)&nbsp;&nbsp;G(a,b,c,e)<br>
												c)&nbsp;&nbsp;H(g,h)<br> 
												d)&nbsp;&nbsp;S(a,c,f,g)<br>
											</font>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td></td>
										<td colspan="3"><HR></td>
										<td></td>
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
