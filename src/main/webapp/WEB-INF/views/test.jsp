<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
	<form action="findCourse.action" method="post">
		coursename:<input type="text" name="cname"/> </br>
		<input type="submit" value="find">
	</form>
	<table width="300px;"  border=1>
	<tr>
	<td>courseid</td><td>memberid</td>
	<td>name</td><td>info</td>
	<td>type</td>
	</tr>
	<c:forEach items="${cList}" var="course" varStatus="status">
		<tr>
		<td>${status.index+1}</td><td>${course.cid}</td>
		<td>${course.tid}</td><td>${course.cname}</td>
		<td>${course.cinfo}</td><td>${course.ctype}</td>
		</tr>
	
	</c:forEach>
	</table>
</body>
</html>