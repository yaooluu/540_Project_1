<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>View Score</title>
	<div id="header"><h1>View Score</h1></div>

	<%
			List<String> list = (List<String>) request.getAttribute("scores"); 
			String str;
			
			if(list != null&&list.size()>0) {
				str="<table border='1' style='width:100%'>";
				str+="<tr><th>'title'</th><th>'final score'</th><th>'total score'</th>";
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


	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
