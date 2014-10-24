<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>View Score</title>
	<div id="header"><h1>View Score</h1></div><br>
	<div align="center">
	<%
			List<String> list = (List<String>) request.getAttribute("scores"); 
			String str;
			
			if(list != null&&list.size()>0) {
				str="<table border='1' style='width:90%'>";
				str+="<tr><th>Homework Title</th><th>Your Final Score</th><th>Total Score</th>";
				 for(String c : list) {
					 String[] s=c.split(",");
					 str+="<tr><td>"+s[0]+"</td><td>"+s[1]+"</td><td>"+s[2]+"</td></tr>";
				 }
				 str+="</table>";
				 out.println(str);
			}else{
				out.println("No result found!");
			}
		%>

	</div><br>
	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
