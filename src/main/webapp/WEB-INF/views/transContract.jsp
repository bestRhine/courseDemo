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
 <title>合同管理 - 转课页面</title>

<%-- <script type="text/javascript">
 $.ajax({
		type:'get',
		url: '${pageContext.request.contextPath}/contractTransCourse',
		data:{'cid':cid},
	    success:function(req){
 			   var ctid=document.getElementsByName("ctid").value
	    },
		error:function(req) {alert("操作异常！ 重试")}

	})
</script>
--%>
</head>
 
<body>
 
 <%@ include file="menu.jsp" %><br/>
  
<div class="editDIV">
 
    <div class="panel panel-success">
            <div class="panel-heading">
            <h3 class="panel-title">会员间转课</h3>
        </div>
        <div class="panel-body">
 
            <form method="post" action="${pageContext.request.contextPath }/transContract" role="form">
                <table class="editTable">
                	<tr>
                        <td>转课合同号：</td>
                        <td><input type="text" name="ctid" id="ctid" placeholder="请在这里输入被转合同号"></td>
                    </tr>
                	
                	<tr>
                        <td>姓名：</td>
                        <td><input type="text" name="mname" id="mname" placeholder="请在这里输入被转人姓名"></td>
                    </tr>
                    <tr>
                        <td>电话：</td>
                        <td><input type="text" name="mphone" id="mphone" placeholder="请在这里输入被转人电话"></td>
                    </tr>
                    <tr>
                        <td>手续费：</td>
                        <td><input type="text" name="ctorder" id="ctorder" placeholder="请在这里输入手续费"></td>
                    </tr>
                    <tr>
                        <td>操作员工：</td>
                        <td><input type="text" name="ctoperator" id="ctoperator" placeholder="请在这里输入操作员工号"> </td>
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