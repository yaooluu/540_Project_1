<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Add Course</title>
	<div id="header">
		<h1>
			<%
				if(request.getAttribute("addCourseResult")!=null) out.print(request.getAttribute("addCourseResult"));
				else out.print("Add Course");
			 %>
		</h1>
	</div>
	
	<p><strong>Please input Course token</strong></p>
	<form action="<%=request.getContextPath()+"/rest/addCourse" %>" method="post">
		<input type="text" name="token" placeholder="course token" required>
		<input type="submit" value="Add Course">
	</form>
	
	<a href="../jsp/indexStudent.jsp">Back</a>
	
	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
