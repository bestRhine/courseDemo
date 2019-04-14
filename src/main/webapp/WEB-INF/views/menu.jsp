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

<meta charset="UTF-8">

</head>
<body>
<div id="menuContent" style="background-color:#8FBC8F;color:#000000;height:100px;">
	<h1 style="margin-left:30px;margin-top:5px;">教学管理系统</h1>
	<br/>
	<div style="margin-left:50px;">
	常用：
	<a href="${pageContext.request.contextPath }/editContract">&nbsp 办理合同 &nbsp &nbsp|</a>
	<a href="${pageContext.request.contextPath }/findCourse">&nbsp &nbsp 检索课程  &nbsp &nbsp</a>
	 &nbsp || &nbsp &nbsp &nbsp 导航：
	<a href="${pageContext.request.contextPath}/findBy"> &nbsp合同管理 &nbsp &nbsp|</a>	
	<a href="${pageContext.request.contextPath }/listCourse">&nbsp &nbsp课程管理</a>
	</div>
</div>	
</body>