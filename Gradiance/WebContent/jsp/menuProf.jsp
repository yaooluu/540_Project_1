<%@ page language="java" contentType="text/html; charset=utf-8"%>

<table>
<tbody>
	<tr><td style="width: 220px;">
			<table><tbody>
		    <tr><td><br></td></tr> 
		    <tr><td>
		    	•&nbsp; <a href="<%=request.getContextPath()+"/rest/index"%>" style="color: black;">Home Page</a>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	•&nbsp; <a href="<%=request.getContextPath()+"/jsp/addHwProf.jsp" %>" style="color: black;">Add Homework</a>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	<form id="addRmQsProfForm" action="<%=request.getContextPath()+"/rest/prof/addRmQsProf"%>" method="post">
					  •&nbsp; <a href="#" style="color: black;" onclick="document.getElementById('addRmQsProfForm').submit()">Add/Remove Questions</a>
				</form>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	<form id="editHwProfForm" action="<%=request.getContextPath()+"/rest/prof/editHwProf"%>" method="post">
					  •&nbsp; <a href="#" style="color: black;" onclick="document.getElementById('editHwProfForm').submit()">Edit Homework</a>
				</form>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	<form id="viewHwProfForm" action="<%=request.getContextPath()+"/rest/prof/viewHwProf"%>" method="post">
					  •&nbsp; <a href="#" style="color: black;" onclick="document.getElementById('viewHwProfForm').submit()">View Homework</a>
				</form>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	<form id="viewNotifProfForm" action="<%=request.getContextPath()+"/rest/Notif/viewNotif"%>" method="post">
					  •&nbsp; <a href="#" style="color: black;" onclick="document.getElementById('viewNotifProfForm').submit()">View Notification</a>
				<%
		    	String notif = (String)session.getAttribute("notif");
		    	if(notif!=null && notif.length()>0) {
		    		out.println("<font color='red'> ("+notif.split("@").length/2+")</font>");
		    	}
		    	%>
		    	</form>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	•&nbsp; <a href="<%=request.getContextPath()+"/jsp/rptProf.jsp" %>" style="color: black;">Reports</a>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	•&nbsp; <a href="<%=request.getContextPath()+"/rest/logout"%>" style="color: black;">Log Out</a>
		    </td></tr>
		    </tbody></table>
	</td></tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><HR></td>
	</tr>
	
	<tr style="color: black; height: 20px;">
		<td valign="middle"><font size="2">YYYD Database Team.</font></td>
	</tr>
	<tr style="color: black; height: 20px;">
		<td valign="middle"><font size="2">Copyright © 2014</font></td>
	</tr>
	</tbody>
</table>
