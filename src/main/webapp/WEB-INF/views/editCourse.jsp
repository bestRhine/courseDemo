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
   <title>课程管理-编辑页面</title>
</head>
 
<body>
 <%@ include file="menu.jsp" %><br/>
 
<div class="editDIV">
 
    <div class="panel panel-success">
            <div class="panel-heading">
            <h3 class="panel-title">编辑课程</h3>
        </div>
        <div class="panel-body">
 
            <form method="post" action="${pageContext.request.contextPath }/updateCourse" role="form">
                <table class="editTable">
                	<tr>
                        <td>课程号：</td>
                        <td><input type="text" name="cid" id="cid" placeholder="课程ID不能改变!"></td>
                    </tr>
                    <tr>
                        <td>租户：</td>
                        <td><input type="text" name="tid" id="tid" placeholder="请在这里输入租户"></td>
                    </tr>
                    <tr>
                        <td>课程名：</td>
                        <td><input type="text" name="cname" id="cname" placeholder="请在这里输入名字"></td>
                    </tr>
                    <tr>
                        <td>简介：</td>
                        <td><input type="text" name="cinfo" id="cinfo" placeholder="请在这里输入简介"></td>
                    </tr>
                    <tr>
                        <td>类型：</td>
                        <td><input type="text" name="ctype" id="ctype" placeholder="请在这里输入类型"> </td>
                    </tr>
                    
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="cid" value="${cid}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
 
                    </tr>
 
                </table>
            </form>
        </div>
    </div>
 
</div>
 
</body>
</html>