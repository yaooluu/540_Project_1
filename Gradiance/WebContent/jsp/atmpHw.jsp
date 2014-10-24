<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Attempt Homework</title>
	<div id="header"><h1>Attempt Homework</h1></div>

<p id="reserved"></p>
<script>
var obj = [
{
"number": "1",
"question": "JavaScript Tutorial",
"choiceA": "aaaa1111",
"choiceB": "bbbb1111",
"choiceC": "cccc1111",
"choiceD": "dddd1111",
"hint" : ""
},
{
"number": "2",
"question": "HTML Tutorial",
"choiceA": "aaaa2222",
"choiceB": "bbbb2222",
"choiceC": "cccc2222",
"choiceD": "dddd2222",
"hint" : "ffff"
},
{
"number": "3",
"question": "CSS Tutorial",
"choiceA": "aaaa3333",
"choiceB": "bbbb3333",
"choiceC": "cccc3333",
"choiceD": "dddd3333",
"hint" : "eeeeee"
}
]
var i;
var str="<form action=''>";
for(i=0;i<obj.length;i++){
	str+="<p>"+obj[i].number+". "+obj[i].question+"<br><input type='radio' name='q"+i+
"'>"+obj[i].choiceA+"</input><br><input type='radio' name='q"+i+
"'>"+obj[i].choiceB+"</input><br><input type='radio' name='q"+i+
"'>"+obj[i].choiceC+"</input><br><input type='radio' name='q"+i+
"'>"+obj[i].choiceD+"</input><br>";
	if(obj[i].hint!="")
		str+="hint:"+obj[i].hint+"<br>";
}
str+="<input type='submit'/></form>";
document.getElementById("reserved").innerHTML = str;
</script>

	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
