<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
 
    <%-- 引入JQ和Bootstrap --%>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>    
    <link href="css/style.css" rel="stylesheet">
 
    <title>课程管理 - 编辑页面</title>
</head>
 
<body>
 
<div class="editDIV">
 
    <div class="panel panel-success">
            <div class="panel-heading">
            <h3 class="panel-title">编辑课程</h3>
        </div>
        <div class="panel-body">
 
            <form method="post" action="${pageContext.request.contextPath }/updateCourse" role="form">
                <table class="editTable">
                	<tr>
                        <td>courseId：</td>
                        <td><input type="text" name="cid" id="cid" placeholder="请在这里输入cid"></td>
                    </tr>
                    <tr>
                        <td>memberId：</td>
                        <td><input type="text" name="tid" id="tid" placeholder="请在这里输入memberid"></td>
                    </tr>
                    <tr>
                        <td>姓名：</td>
                        <td><input type="text" name="cname" id="cname" placeholder="请在这里输入名字"></td>
                    </tr>
                    <tr>
                        <td>info：</td>
                        <td><input type="text" name="cinfo" id="cinfo" placeholder="请在这里输入简介"></td>
                    </tr>
                    <tr>
                        <td>type：</td>
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