<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Course Options for Professor</title>
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
							<jsp:include page="../jsp/menuProf.jsp"/>
						</td>
						<td style="width: 2px; background-color: grey;"></td>
						<td style="width: 20px;"></td>
						<td style="width: 666px;">
							<table><tbody>
								<tr><td><br></td></tr>
								<tr><td>
									<font size="2">•&nbsp; Click Home Page to go back the the logged in page.</font>
								</td></tr>
								<tr><td><br></td></tr>
								<tr><td>
									<font size="2">•&nbsp; Click Add Homework to create a new homework.</font>
								</td></tr>
								<tr><td><br></td></tr>
								<tr><td>
									<font size="2">•&nbsp; Click Add/Remove questions to add or remove questions in the existing homework</font>
								</td></tr>
								<tr><td><br></td></tr>
								<tr><td>
									<font size="2">•&nbsp; Click Edit homework to update the information of the existing homework</font>
								</td></tr>
								<tr><td><br></td></tr>
								<tr><td>
									<font size="2">•&nbsp; Click View homework to see the details of the existing homework </font>
								</td></tr>
								<tr><td><br></td></tr>
								<tr><td>
									<font size="2">•&nbsp; Click View notification to see the notifications </font>
								</td></tr>
								<tr><td><br></td></tr>
								<tr><td>
									<font size="2">•&nbsp; Click Reports to display the user's query</font>
								</td></tr>
								<tr><td><br></td></tr>
								<tr><td>
									<font size="2">•&nbsp; Click Log Out to logout of the system</font>
								</td></tr>
								<tr><td><br></td></tr>
							</tbody></table>
														
						</td>	
					</tr>
				</tbody>
			</table>
			<br> <br>			
		</div>

</body>
</html>
