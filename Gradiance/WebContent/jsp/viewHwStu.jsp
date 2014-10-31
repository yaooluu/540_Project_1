<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Student View Homework</title>
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
										<td colspan="5"><font color="midnightblue" size="4"><br>
												Attempt Homework:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="7">&nbsp;</td></tr>

									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 280px;">
											Homework#</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 100px;">
											StartDate</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 100px;">
											EndDate</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 100px;">
											Detail</td>
										<td align="center" style="background-color: lightgray; white-space: nowrap; width: 100px;">
											Chance Left</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									
									<%
										List<String> list = (List<String>) request.getAttribute("homeworkList");
										String str="";
										
										if(list!=null&&list.size()>0){
											for(int i=0;i<list.size();i++){
												String[] s=list.get(i).split(",");
												str = "<tr><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td>"
													+ "<td align='left' style='background-color: lightgray; word-break: normal; width: 280px;'><font size='2'>"
													+  s[1]
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 100px;'><font size='2'>"
												    +  s[2]
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 100px;'><font size='2'>"
												    +  s[3]
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 100px;'>";

												    int remain = Integer.parseInt(s[4]); 
												    if(remain!=0) {	//has chance or unlimited
													    str +=  "<form id='"+s[0]+"' action=" + request.getContextPath()+"/rest/student/attemptHomework" + " method='post'>"
															    +  "<a href='#' onclick=\"document.getElementById('"+s[0]+"').submit()\"><font size='2'>Attempt</font></a>"
															    +  "<input type='hidden' name='aid' value='"+s[0]+"'/>"
															    +  "</form></td>";
												    }else if(remain==0){//no chance
												    		str += "<font size='2'>No Chance</font></td>";	
												    }
												    str += "<td align='center' style='background-color: lightgray; white-space: nowrap; width: 100px;'><font size='2'>";
											    	if(remain>=0)
											    		str += s[4]+"</font></td>";
											    	else
											    		str += "Unlimited</font></td>";
											    str += "<td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>";
												out.println(str);
											}
										}else{
											str = "<tr><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td>"
													+  "<td align='center' style='background-color: lightgray; word-break: normal; width: 280px;'><font size='2'>"
													+  "NULL"
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 100px;'><font size='2'>"
												    +  "NULL"
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 100px;'><font size='2'>"
												    +  "NULL"
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 100px;'><font size='2'>"
												    +  "NULL"
												    +  "</font></td><td align='center' style='background-color: lightgray; white-space: nowrap; width: 100px;'><font size='2'>"
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
	
</body>
</html>
