<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Student View Score</title>
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
							<jsp:include page="../jsp/menuStu.jsp"/>
						</td>
						<td style="width: 2px; background-color: grey;"></td>
						<td style="width: 686px;">
							<table>
								<tbody>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="4"><font color="midnightblue" size="4"><br>
												View Scores:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="6">&nbsp;</td></tr>

									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Homework Title</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Your Score</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 142px;">
											Total Score</td>
										<td style="width: 142px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>

									<%
										List<String> list = (List<String>) request.getAttribute("scoreList");
										String str="";

										if (list != null && list.size() > 0) {
											for (String c : list) {
												String[] s = c.split(",");
												str += "<tr><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td><td align='left' style='background-color: lightgray; white-space: nowrap; width: 142px;'><font size='2'>"
														+ s[0]
														+ "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 142px;'><font size='2'>"
														+ s[1]
														+ "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 142px;'><font size='2'>"
														+ s[2]
														+ "</font></td><td style='width: 142px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>";
											}		
										} else {
											str = "<tr><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 142px;'><font size='2'>"
													+ "NULL"
													+ "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 142px;'><font size='2'>"
													+ "NULL"
													+ "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 142px;'><font size='2'>"
													+ "NULL"
													+ "</font></td><td style='width: 142px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>";											
										}
										out.println(str);
									%>
									
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
</body>
</html>
