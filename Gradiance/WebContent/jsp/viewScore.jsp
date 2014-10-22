<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>View Score</title>
	<div id="header"><h1>View Score</h1></div>
	
	<p id="reserved"></p>


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
str="<table border='1' style='width:100%'>";
for(i=0;i<obj.length;i++){
	str+="<tr><td>"+obj[i].courseName+"</td><td>"+obj[i].url+"</td></tr>";
}
str+="</table>";
document.getElementById("reserved").innerHTML = str;
</script>

	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
