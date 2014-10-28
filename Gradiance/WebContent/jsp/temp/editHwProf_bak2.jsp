<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Homework</title>
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

<script type="text/javascript" src="<%=request.getContextPath()+"/js/Canledar.js"%>"></script>


</head>

<body style="font-family: sans-serif; font-weight:lighter ">
	<title><%=request.getAttribute("title") %></title> 

	<div id="header">
		<font size="5">Welcome to <%=session.getAttribute("cid") %></font>
		<font size="4"><br><%=session.getAttribute("cname") %></font>
	</div>

	
		<div align=center>
			<table>
				<tbody valign="top">
					<tr>
						<td style="width: 220px;">
							<table>
								<tbody>
									<tr>
										<td>
											<br> <br> •&nbsp; <a href="<%=request.getContextPath()+"/jsp/indexProf.jsp" %>" style="color: black;">Home Page</a>
											<br> <br> •&nbsp; <a href="<%=request.getContextPath()+"/jsp/addHwProf.jsp" %>" style="color: black;">Add Homework</a> 
											<br> <br> •&nbsp; <a href="<%=request.getContextPath()+"/jsp/addRmQsProf.jsp" %>" style="color: black;">Add/Remove Questions</a> 
											<br> <br> •&nbsp; <a href="<%=request.getContextPath()+"/jsp/editHwProf.jsp" %>" style="color: black;">Edit Homework</a> 
											<br> <br> •&nbsp; <a href="<%=request.getContextPath()+"/jsp/viewHwProf.jsp" %>" style="color: black;">View Homework</a> 
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
						</td>
						<td style="width: 2px; background-color: grey;"></td>
						<td style="width: 686px;">
						
							
							<table>
								<tbody>			
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="3" style="width: 586px"><font color="midnightblue" size="4"><br>Edit
												Homework:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Existing Homework:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Choose A Homework:</font>
										</td>
										
										<td colspan="3" align="left" style="white-space: nowrap">
										<form action="<%=request.getContextPath()+"/rest/prof/getHomeworkList" %>" method="post">	
											<select style="width: 100px">
												<option>&nbsp;</option>
												<option>Homework 1</option>
												<option>Homework 2</option>
												<option>Homework 3</option>
											</select>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="submit" value="Choose">
										</form>
										</td>
									</tr>
									<tr><td colspan="5"><br></td></tr>
							
									
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Updating Homework Information:</td>
									</tr>
									<tr><td colspan="5"><br></td></tr>
									
									<tr valign="top" style="color: black;">
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Title:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input name="title" type="text" style="width: 150px" placeholder="eg.HW1"
											required></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr valign="top" style="color: black;">
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Start Date:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input name="tstart" type="text" style="width: 150px" placeholder="2014-10-31"
											onfocus="HS_setDate(this)"></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr valign="top" style="color: black;">
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;End Date:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input name="tend" type="text" style="width: 150px" placeholder="2014-10-31"
											onfocus="HS_setDate(this)"></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr valign="top" style="color: black;">
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Attempt Numbers:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input name="retry" type="text" style="width: 150px"
											name="attemptnum" placeholder="eg.5; and 0 for infinity"
											required></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr valign="top" style="color: black;">
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Topics:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><select name="tidList" multiple="multiple" style="width: 156px; height:100px" size="2">
												<option value="1">1. Introduction to database design</option>
												<option value="2">2. Storing data: Disks and Files</option>
												<option value="3">3. Primary File organizations</option>
												<option value="4">4. Tree Structures</option>
												<option value="999">5. Other</option>
										</select></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr valign="top" style="color: black;">
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Difficulty:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap">
											<font size="2">from&nbsp;
											<select name="minDif" style="width: 38px">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to&nbsp;
											<select name="maxDif" style="width: 38px">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>											</select>
											</font>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr valign="top" style="color: black;">
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Score Selection:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><select name="scoreSelect" style="width: 156px">
												<option value="latest attempt">latest attempt</option>
												<option value="maximum score">maximum score</option>
												<option value="average score">average score</option>
										</select></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr valign="top" style="color: black;">
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Question Numbers:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input type="text" style="width: 150px"
											name="questionnum" placeholder="eg.10"
											required></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr valign="top" style="color: black;">
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Correct Answer Points:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input type="text" style="width: 150px"
											name="corrPts" placeholder="eg.4"
											required></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr valign="top" style="color: black;">
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Incorrect Answer Points:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input type="text" style="width: 150px"
											name="penalPts" placeholder="eg.2"
											required></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
			<%
				if(request.getAttribute("addHomeworkResult")!=null) out.print("<tr style='width:400px'><td colspan='5' align='center'><font color='red'>("+request.getAttribute("addHomeworkResult")+")</font></td></tr>");
			%>
									<tr>
										<td colspan="5" align="center">
											<input type="submit" value="Add Homework">
										</td>
									</tr>
									<tr><td colspan="5" align="center"><input type="submit" value="Edit" style="height:50px; width:50px"></td></tr>
									
								</tbody>
							</table>		
						</td>
					</tr>
				</tbody>
			</table>
			
		</div>
	

</body>
</html>
