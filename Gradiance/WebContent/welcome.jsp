<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome! This page will redirect to real homepage immediately!</title>
</head>
<body>
<% response.sendRedirect(request.getContextPath()+"/rest/index"); %>
</body>
</html>