<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Past Review</title>
	<div id="header"><h1>Past Review</h1></div>
	
	<p id="reserved"></p>
<script>
var obj = [
{
"question": "JavaScript Tutorial",
"choiceA": "aaaa1111",
"choiceB": "bbbb1111",
"choiceC": "cccc1111",
"choiceD": "dddd1111"
},
{
"question": "HTML Tutorial",
"choiceA": "aaaa2222",
"choiceB": "bbbb2222",
"choiceC": "cccc2222",
"choiceD": "dddd2222"
},
{
"question": "CSS Tutorial",
"choiceA": "aaaa3333",
"choiceB": "bbbb3333",
"choiceC": "cccc3333",
"choiceD": "dddd3333"
}
]
var i;
var str="<form method='post'>";
for(i=0;i<obj.length;i++){
	str+="<p>"+obj[i].question+"<br><input type='radio' name='q"+i+
"'>"+obj[i].choiceA+"</input><br><input type='radio' name='q"+i+
"'>"+obj[i].choiceB+"</input><br><input type='radio' name='q"+i+
"'>"+obj[i].choiceC+"</input><br><input type='radio' name='q"+i+
"'>"+obj[i].choiceD+"</input><br>";
}
str+="<input type='submit'/></form>";
document.getElementById("reserved").innerHTML = str;
</script>

	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
