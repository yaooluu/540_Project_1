<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>View Notification</title>
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
										<td colspan="3" style="width: 586px"><font color="midnightblue" size="4"><br>View
												Notifications:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Unread Notification:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
									<%
							    	String notif = (String)request.getAttribute("notif");
							    	if(notif!=null && notif.length()>0) {
							    		
							    		for(int i=0;i<notif.split("@").length;i+=2) {
							    			out.println("<tr><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td>");
											out.println("<td style='width: 100px;' valign='top'><font size='2'>"+notif.split("@")[i]+":</font></td>");
											out.println("<td colspan='2' align='left' style='word-break: break-all;'><font size='2'>"+notif.split("@")[i+1]+"</font></td>");
											out.println("<td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>");
							    		}
							    	}else{
										out.println("<tr><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td>");
										out.println("<td colspan='3' align='center' style='white-space: nowrap'><font size='2'>None.</font></td>");
										out.println("<td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>");
							    	}
							    	%>

									<!-- 
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Read Notifications:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="3" align="center" style="white-space: nowrap"><font size="2">None.</font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									 -->
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
</body>
</html>
