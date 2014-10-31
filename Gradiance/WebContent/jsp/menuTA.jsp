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
		    	<form id="viewHwTAForm" action="<%=request.getContextPath()+"/rest/TA/viewHwTA"%>" method="post">
					  •&nbsp; <a href="#" style="color: black;" onclick="document.getElementById('viewHwTAForm').submit()">View Homework</a>
				</form>
		    </td></tr>
		    <tr><td><br></td></tr>
		    <tr><td>
		    	•&nbsp; <a href="<%=request.getContextPath()+"/jsp/viewNotifTA.jsp" %>" style="color: black;">View Notification</a>
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
