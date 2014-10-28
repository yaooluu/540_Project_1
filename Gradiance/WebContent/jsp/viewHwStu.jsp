<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Current Homework Due</title>
	<div id="header"><h1>Current Homework Due</h1></div><br>
	<div align="center">
	<%
		List<String> l= (List<String>)request.getAttribute("homeworkList");
		if(l!=null&&l.size()>0){
			String str="<table style='width:90%'>";
			
			for(int i=0;i<l.size();i++){
				String[] s=l.get(i).split(",");
				str+="<tr><td>"+s[1]+"</td><td>"+s[2]+"</td><td>"+s[3]+"</td><td>"+
				"<form id='"+s[0]+"' action=" + request.getContextPath()+"/rest/student/attemptHomework" + " method='post'>"+
				"<a href='#' onclick=\"document.getElementById('"+s[0]+"').submit()\">Attempt Homework</a>"+
				"<input type='hidden' name='aid' value='"+s[0]+"'/>"+
				"</form></td></tr>";
			}
			str+="</table>";
			out.println(str);
		}else{
			out.println("No homework right now!");
		}
	%>
			
	</div><br>
	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
