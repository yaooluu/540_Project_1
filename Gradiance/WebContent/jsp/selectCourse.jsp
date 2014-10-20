<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Select Course</title>
	<div id="header"><h1>Select Course</h1></div>
	
	<p id="demo"></p>

<script>
var obj = [
{
"courseName": "JavaScript Tutorial",
"url": "asdfp"
},
{
"courseName": "HTML Tutorial",
"url": "asdf"
},
{
"courseName": "CSS Tutorial",
"url": "asdf"
}
]

var str;
var i;
str="<form method='post'><input list='courses' name='course'>"+
"<datalist id='courses'>";
for(i=0;i<obj.length;i++){
	str+="<option value='"+obj[i].courseName+"'><br>";
}
str+="</datalist><br><input type='submit' value='choose'></form>";
document.getElementById("demo").innerHTML = str;
</script>

	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
