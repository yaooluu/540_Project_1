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

	<div id="header">
		<font size="5">Welcome to CSC540</font>
		<font size="4"><br>Database Management Systems</font>
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

</body>
</html>
