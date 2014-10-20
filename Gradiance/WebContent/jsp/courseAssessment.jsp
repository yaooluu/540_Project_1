<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Course Assesments</title>
	<div id="header"><h1>Course Assesments</h1></div>
	
	
<p><strong>Filter</strong></p>
<!--form id="filter" method="post"-->
<label for="topic">Topic</label><br>
<input type="text" name="topic" placeholder="Input Topic Here"/><br><br>
<label for="difficulty level">Difficulty Level</label><br>
<input type="number" id="min" name="min" placeholder="Input min Diffculty Level"/>
<br>To<br>
<input type="number" id="max" name="max" placeholder="Input max Diffculty Level"/>
<br><input type="button" onclick="submit()" value="submit"/><br>
<!--/form-->
<p id="demo"></p>


<script>
function submit(){
var min,max;
min=document.getElementById("min").value;
max=document.getElementById("max").value;
console.log(min+" "+max);
var str;
if(isNaN(min)||min<1||min>6){
	str="min input not valid!";
}else if(isNaN(max)||max<1||max>6||max<min){
	str="max input not valid!";
}else{
	console.log("here");
	document.getElementById("filter").submit();
}
document.getElementById("demo").innerHTML=str;
}
</script>

	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
