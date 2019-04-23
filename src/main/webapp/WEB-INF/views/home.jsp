<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

<%-- 引入JQ和Bootstrap --%>
     <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>  
    <link href="css/style.css" rel="stylesheet">
    
<style type="text/css">
.pics{
	position : fixed;
	top : 124px;
	left: 268px;
	
}
</style>

<meta charset="UTF-8">
<title>主页</title>

</head>
<body>
	<%@ include file="menu.jsp" %>

	<div class="pics">
	<img alt="picture" src="images/img1.jpg" width="100%" height="67%">
	</div>

</body>
</html>