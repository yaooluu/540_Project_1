<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Attempt Homework</title>
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
		<font size="5">Welcome to CSC540</font>
		<font size="4"><br>Database Management Systems</font>
	</div>
	
	<form action="<%=request.getContextPath()+"/rest/login" %>" method="post">
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
										<td colspan="6"><font color="midnightblue" size="4"><br>
												Attempt Homework:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="8">&nbsp;</td></tr>

									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 180px;">
											Homework#</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 80px;">
											StartDate</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 80px;">
											EndDate</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 57px;">
											Detail</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 57px;">
											Remain</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									
									<%
										List<String> list = (List<String>) request.getAttribute("homeworkList");
										String str="";
										
										if(list!=null&&list.size()>0){
											for(int i=0;i<list.size();i++){
												String[] s=list.get(i).split(",");
												str = "<tr><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td><td align='left' style='background-color: lightgray; word-break: normal; width: 180px;'><font size='2'>"
													+  s[1]
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 80px;'><font size='2'>"
												    +  s[2]
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 80px;'><font size='2'>"
												    +  s[3]
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 57px;'>"
												    +  "<form id='"+s[0]+"' action=" + request.getContextPath()+"/rest/student/attemptHomework" + " method='post'>"
												    +  "<a href='#' onclick=\"document.getElementById('"+s[0]+"').submit()\"><font size='2'>Attempt</font></a>"
												    +  "<input type='hidden' name='aid' value='"+s[0]+"'/>"
												    +  "</form></td><td style='width: 57px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>";
												out.println(str);
											}
										}else{
											str = "<tr><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td><td align='center' style='background-color: lightgray; word-break: normal; width: 180px;'><font size='2'>"
													+  "NULL"
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 80px;'><font size='2'>"
												    +  "NULL"
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 80px;'><font size='2'>"
												    +  "NULL"
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 57px;'><font size='2'>"
												    +  "NULL"
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 57px;'><font size='2'>"
													+  "NULL"
												    +  "</font></td><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>";
											out.println(str);
										}
									%>		
									
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
