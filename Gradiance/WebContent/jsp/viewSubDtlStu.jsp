<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Submission Detail</title>
	<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" />
</head>

<body>
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
										<td colspan="3"><font color="midnightblue" size="4"><br>
												Attempt Information&nbsp;&nbsp;&nbsp;Score: <%
												List<String> l = (List<String>) request.getAttribute("submissionDetail"); 
												out.print("<font color='red'>"+l.get(l.size()-1).split("@")[0]+"/"+l.get(l.size()-1).split("@")[1]+"</font>&nbsp;&nbsp;&nbsp;Submit Time: "+l.get(l.size()-1).split("@")[2]);
												%><br></font></td>
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
										List<String> list = (List<String>) request.getAttribute("submissionDetail"); 
										String str = "";
			
										if(list != null && list.size()>0) {
											str += "<form id='homeworkForm' action='"+request.getContextPath()+"/rest/student/submitHomework"+"' method='post'>";
											str += "<table><tbody>";
											String[] s=list.get(0).split("@");
											for(int i=0;i<s.length;i++){
												
												char ch = (char)('A'+list.get(list.size()-3).split("@")[i].charAt(0)-'0');
												String stuAns = Character.toString(ch);
												
												str += "<tr><td style='width: 50px;'></td><td colspan='3' align='left' style='word-wrap: break-word; width:574px'><font size='2'>"
													+  (i+1)
													+  ".&nbsp;&nbsp;"
													+  s[i]
													+  "<br>(Hint:&nbsp;"
													+  list.get(1).split("@")[i]
													+  ")<br>"
													+  "A.&nbsp;"+list.get(i+2).split("@")[0]+"<br>"
													+  "B.&nbsp;"+list.get(i+2).split("@")[1]+"<br>"
													+  "C.&nbsp;"+list.get(i+2).split("@")[2]+"<br>"
													+  "D.&nbsp;"+list.get(i+2).split("@")[3]+"<br>"
													+  "<font color='red'>Your Answer: "+ stuAns +"</font><br>"
													+  "<strong>Explanation:</strong><br>&nbsp;&nbsp;"
													+  list.get(list.size()-2).split("@")[i]
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
