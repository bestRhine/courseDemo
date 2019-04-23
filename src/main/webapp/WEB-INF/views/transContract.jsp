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

 <script type="text/javascript">
function checkTransContract(){ 
        if($("#mname").val()==null||$("#mname").val()==""){
            alert("会员名不能为空！");
            return false;
        }      
        var phone = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/
        if(!(phone.test($("#mphone").val())&&phone.test($("#mphone").val()))) 
        { 
            alert("请输入正确完整的电话号码！"); 
            return false; 
        } 
        
        if($("#ctpay").val()==null||$("#ctpay").val()==""){
            alert("转课手续费不能为空！");
            return false;
        }
        if($("#ctoperator").val()==null||$("#ctoperator").val()==""){
            alert("操作员工不能为空！");
            return false;
        }
             
        return true;
   }
</script>

</head>
 
<body>
 
 <%@ include file="menu.jsp" %><br/>
<div class="right">
  
<div class="editDIV">
 
    <div class="panel panel-success">
            <div class="panel-heading">
            <h3 class="panel-title">会员间转课</h3>
        </div>
        <div class="panel-body">
 
            <form method="post" action="${pageContext.request.contextPath }/transContract" role="form" onsubmit="return checkTransContract()">
                <table class="editTable">
                	<tr>
                        <td>转课合同号：</td>
                        <td><c:if test="${ctid!=null}"><font color="red">${ctid}</c:if>
                        </td>
                    </tr>
                		<td><input type="hidden" name="ctid" id="ctid" value="${ctid}"></td>
                	
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
                        <td><input type="text" name="ctpay" id="ctpay" placeholder="请在这里输入手续费"></td>
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
</div>
</body>
</html>