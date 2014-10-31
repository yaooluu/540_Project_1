<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Homework</title>
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
</style>

<script type="text/javascript" src="<%=request.getContextPath()+"/js/Canledar.js"%>"></script>


</head>

<body style="font-family: sans-serif; font-weight:lighter ">

	<div id="header">
		<font size="5">Welcome to <%=session.getAttribute("cid") %></font>
		<font size="4"><br><%=session.getAttribute("courseTitle") %></font>
	</div>

	
		<div align=center>
			<table>
				<tbody valign="top">
					<tr>
						<td style="width: 220px;">
							<jsp:include page="../jsp/menuProf.jsp"/>
						</td>
						<td style="width: 2px; background-color: grey;"></td>
						<td style="width: 686px;">
						
						<form action="<%=request.getContextPath()+"/rest/prof/addHomework" %>" method="post">
							<table>
								<tbody>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="3" style="width: 586px"><font color="midnightblue" size="4">
											<br>Add a New Homework:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
											name="retry" placeholder="eg.5; and 0 for infinity"
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
								</tbody>
							</table>
						</form>
						</td>
					</tr>
				</tbody>
			</table>
			
		</div>
	

</body>
</html>
