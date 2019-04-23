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
<script type="text/javascript">
function searchTeacher(){
	var teacher = document.getElementById("teacherQuery").value
	addTeacher(teacher)
}
function addTeacher(teacher){
		$("#teacherList").html("")
		var message=""
		if(teacher!=null){
			message="{'teacher':'"+teacher+"'}"
		}else{
			message="{'teacher':''}"
		}
		
		$.ajax({
			type:'post',
			url: '/gymms/getTeacherList',
			contentType:'application/json;charset=utf-8',
			data:message,
			success:function(data){
				for(var i=0;i<data.length;i++){
					var oldHtml=$("#teacherList").html();
					var teacherInfo="<p onclick=\"selectTeacher('"+data[i].empName+"')\">"
					      +"☐&nbsp 姓名："+data[i].empName+"&nbsp Tel:"+data[i].empPhone+"</p><hr />" 
					$("#teacherList").html(oldHtml+teacherInfo)
				}
				$(".teacherMask").css("display","block")
			},
			error:function(data) {alert("操作异常！ 重试")}
		});
	}
	function selectTeacher(empName){
		$("#cteacher").val(empName) 
		cancelEditTeacher()
	}
	function cancelEditTeacher(){
		$(".teacherMask").css("display","none")
	}
	function checkEditCourse(){
		if($("#tid").val()==null||$("#tid").val()==""){
            alert("租户不能为空！");
            return false;
        }
		if($("#cinfo").val()==null||$("#cinfo").val()==""){
            alert("课程简介不能为空！");
            return false;
        }
		if($("#ctype").val()==null||$("#ctype").val()==""){
            alert("课程类型不能为空！");
            return false;
        }
		if($("#cteacher").val()==null||$("#cteacher").val()==""){
            alert("课程教练不能为空！");
            return false;
        }
		
		return true;
	}
	
</script>
   
</head>
 
<body>
 <%@ include file="menu.jsp" %>
<div class="right">
<div class="editDIV">
 
    <div class="panel panel-success">
            <div class="panel-heading">
            <h3 class="panel-title">编辑课程</h3>
        </div>
        <div class="panel-body">
 
            <form method="post" action="${pageContext.request.contextPath }/updateCourse" role="form" onsubmit=" return checkEditCourse()">
                <table class="editTable">
                	<tr>
                        <td>课程号：</td>
                        <td><c:if test="${cid!=null}"><font color="red">${cid}</c:if></td>
                    </tr>
                    <input type="hidden" name="cid" id="cid" value="${cid}">
                    <tr>
                        <td>课程名：</td>
                        <td><c:if test="${cname!=null}"><font color="red">${cname}</c:if></td>
                    </tr>
                    <input type="hidden" name="cname" id="cname" value="${cname}">
                    <tr>
                        <td>租户：</td>
                        <td><input type="text" name="tid" id="tid" placeholder="请在这里输入租户"></td>
                    </tr>
                    
                    <tr>
                        <td>简介：</td>
                        <td><input type="text" name="cinfo" id="cinfo" placeholder="输入简介：等级，课时费等"></td>
                    </tr>
                    <tr>
                        <td>类型：</td>
                        <td><input type="text" name="ctype" id="ctype" placeholder="输入课程类型"> </td>
                    </tr>
                    <tr>
                        <td>教练：</td>
                        <td><input type="text" name="cteacher" id="cteacher" placeholder="输入课程教练名" onfocus="addTeacher(null)"> </td>
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
 
 <div class="teacherMask">
 <div class="addDIV">
	<div style="background-color:#8FBC8F;height:40px;width:150;color:#000000;font-size:18px;padding-left:7px;">
	教练列表<font style="float:right;padding-right:10px;" onclick="cancelEditTeacher()">X</font>
	</div>
	
	<input  id="teacherQuery" width="width:20%"/>
	
	<button class="btn"   onclick="searchTeacher()">查询</button>
	<div id="teacherList" style="border:2px solid #CCC;height:200px;overflow-y:scroll;margin:10px;">
	
	</div>
 </div>	
</div>
</body>
</html>