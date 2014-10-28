<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Student View Past Submission</title>
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
												View Past Submission:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="8">&nbsp;</td></tr>

									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 180px;">
											Homework Title</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 85px;">
											Start Date</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 85px;">
											End Date</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 97px;">
											Submit Date</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 52px;">
											Score</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 57px;">
											View Detail</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="background-color: lightgray; word-break: normal; width: 180px;">
											<font size="2">HW1 Introduction to Database and data structure</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 85px;">
											<font size="2">2014-10-31</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 85px;">
											<font size="2">2014-10-31</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 97px;">
											<font size="2">2014-10-31</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 52px;">
											<font size="2">32.0</font></td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 57px;">
											<font size="2">Submission</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>

									<%/*
										List<String> list = (List<String>) request.getAttribute("pastsubmission");
										String str="";

										if (list != null && list.size() > 0) {
											for (String c : list) {
												String[] s = c.split(",");
												str += "<tr><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 142px;'><font size='2'>"
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
									*/%>
									
									<%/*
		List<String> l= (List<String>)request.getAttribute("++++++++++++");
		if(l!=null&&l.size()>0){
			String str="<table style='width:90%'>";
			str+="<tr><th>title</th><th>start time</th><th>due time</th><th>sub time</th><th>score</th><th>attempt</th></tr>";
			for(int i=0;i<l.size();i++){
				String[] s=l.get(i).split(",");
				str+="<tr><td>"+s[1]+"</td><td>"+s[2]+"</td><td>"+s[3]+"</td><td>"+s[4]+"</td><td>"+
				"<form id='"+s[0]+"' action='++++++++++' method='post'>"+
				"<a href='#' onclick=\"document.getElementById('"+s[0]+"').submit()\">View Submission</a>"+
				"<input type='hidden' name='aid' value='"+s[0]+"'/>"+
				"</form></td></tr>";
			}
			str+="</table>";
			out.println(str);
		}else{
			out.println("No past submissions right now!");
		}
	*/%>
									
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
