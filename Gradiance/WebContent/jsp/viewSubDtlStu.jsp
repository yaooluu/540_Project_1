<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" />
</head>

<body>
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
							<jsp:include page="../jsp/menuStu.jsp"/>
						</td>
						<td style="width: 2px; background-color: grey;"></td>
						<td style="width: 686px;">
							<table>
								<tbody>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="3"><font color="midnightblue" size="4"><br>
												Attempt:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Question List:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
								
									<tr><td colspan="5" style="width: 686px;">
									<%
										List<String> list = (List<String>) request.getAttribute("homeworkContent"); 
										String str = "";
			
										if(list != null && list.size()>0) {
											str += "<form id='homeworkForm' action='"+request.getContextPath()+"/rest/student/submitHomework"+"' method='post'>";
											str += "<table><tbody>";
											String[] s=list.get(0).split("@");
											for(int i=0;i<s.length;i++){
												str += "<tr><td style='width: 50px;'></td><td colspan='3' align='left' style='word-wrap: break-word; width:574px'><font size='2'>"
													+  (i+1)
													+  ".&nbsp;&nbsp;"
													+  s[0]
													+  "<br>(Hint:&nbsp;"
													+  list.get(i+1).split("@")[i]
													+  ")<br>"
													+  "1)&nbsp;&nbsp;"+list.get(i+2).split("@")[0]+"<br>"
													+  "2)&nbsp;&nbsp;"+list.get(i+2).split("@")[0]+"<br>"
													+  "3)&nbsp;&nbsp;"+list.get(i+2).split("@")[0]+"<br>"
													+  "4)&nbsp;&nbsp;"+list.get(i+2).split("@")[0]+"<br>"
													+  "Answer submitted:"+list.get(list.size()-2).split("@")[i]+"<br>"
													+  "<strong>Explanation:</strong><br>&nbsp;&nbsp;"
													+  list.get(list.size()-1).split("@")[i]
													+  "</font></td><td style='width: 50px;'></td></tr>"
					    							+  "<tr><td></td><td colspan='3'><HR></td><td></td></tr>";
											}
											str+="</tbody></table>";
											str+="</form>";
												
										}else{				
											str +=  "<tr><td style='width: 50px;'></td><td colspan='3' align='center' style='word-wrap: break-word; width:574px'>"
												+   "<font size='2'>No Question for this homework found!<br></font>"
												+   "</td><td style='width: 50px;'></td></tr>";
										}
										out.println(str);
		              				%>
									</td></tr>
	
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
</body>
</html>
