<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<%-- 引入JQ和Bootstrap --%>
     <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>  
    <link href="css/style.css" rel="stylesheet">

<meta charset="UTF-8">
<title>合同信息</title>
<script type="text/javascript">
function updateContract(id,name){
	if(confirm('是否要刷【'+name+'】课程？确认已预约课程？')){
		location.href="${pageContext.request.contextPath }/updateContract?ctid="+id+"&cname="+name
	}else{}
}

function contractTransCourse(id,name,amount){
	var cid=id
	if(confirm('确认要把【'+name+'】课程，剩余课时【'+amount+'】转给他人？')){
		location.href="${pageContext.request.contextPath }/contractTransCourse?ctid="+cid
	}else{}
}

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
		console.log(message)
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
		var ctid=document.getElementById("getCtid").value	
		$.ajax({
            url : "/gymms/changeTeacher",                           <!--get方式请求,url要从项目名开始重新拼接-->
            type : "get",  
            dataType: "json", 
            data : "ctid="+ctid+"&empName="+empName,                <!--等价于URL后面拼接参数-->
            success:function(result) { 
                alert(result.message)   
                location.href="/gymms/findBy?ctid="+ctid            <!--成功后跳转回上一级界面,重新拼接路径-->
            },
			error:function(result) {alert(result.message)}
     	}); 
	 
	}
	
	function cancelEdit(){
		$(".teacherMask").css("display","none")
	}

</script>
		</head>
<body>
 
 <%@ include file="menu.jsp" %><br/>
 
 <div class="listDIV">
    <table class="table table-striped table-bordered table-hover table-condensed">
        <thead>
        <tr class="success">
			<th>合同号</th>
			<th>教练</th>
			<th>合同类型</th>
			<th>开始时间</th>
			<th>结束时间</th>
        </tr>
        </thead>
 
        <tbody>
        <c:forEach items="${contractList}" var="Contract" varStatus="status">
            <tr>
				<input type="hidden" id="getCtid"  name="getCtid"  value="${Contract.ctid}">
				<td>${Contract.ctid}</td>
            	<td>${Contract.ctteacher}</td>
				<td>${Contract.cttype}</td>
				<td><fmt:formatDate value="${Contract.ctbegin}" pattern="yyyy-MM-dd" /> </td>
                <td><fmt:formatDate value="${Contract.ctend}" pattern="yyyy-MM-dd" /></td>
            </tr>
        </c:forEach>
 
        </tbody>
    </table>
</div>

<div class="listDIV">
    <table class="table table-striped table-bordered table-hover table-condensed">
        <thead>
        <tr class="success">
			<th>课程名</th>
			<th>总课时数</th>
			<th>剩余课时</th>			
			<th>刷课</th>
			<c:if test="${ctcoursetype==null}">
			<th>转课</th>
			<th>更换教练</th>
			</c:if>
        </tr>
        </thead>
 
        <tbody>
        
       <c:forEach items="${showMoreCtInfoList}" var="CtMoreInfo" varStatus="status">    <!-- 用类.属性进行索引遍历ctMoreInfoList -->
            <tr>
                
       			<td>${CtMoreInfo.cname}</td>
       			<td>${CtMoreInfo.camounttotal}</td> 
                <td>${CtMoreInfo.camount}</td>
                
 				
                <td>
                <a href="javascript:updateContract('${CtMoreInfo.ctid}','${CtMoreInfo.cname}')"><button class="btn btn-success" >刷课</button>	</a>				
                </td> 
                
                 <c:if test="${ctcoursetype==null}">              
                <td>
                <a href="javascript:contractTransCourse('${CtMoreInfo.ctid}','${CtMoreInfo.cname}','${CtMoreInfo.camount}')"><button class="btn btn-success" >转课</button></a>
                </td>
                <td>
                <button class="btn btn-success" onclick="addTeacher(null)" >更换教练</button>
                </td>
           		</c:if>
            </tr>
        </c:forEach>    
        </tbody>
    </table>
</div>



<div class="listDIV">
    <table class="table table-striped table-bordered table-hover table-condensed">
        <thead>
        <tr class="success">
			<th>会员名</th>
			<th>电话</th>

        </tr>
        </thead>
 
        <tbody>
        <c:forEach items="${showMoreMemInfoList}" var="CtMoreInfo" varStatus="status">
            <tr>    
            		
       			   <c:if test="${status.last}">
            		<td>${CtMoreInfo.mname}</td>
       			    <td>${CtMoreInfo.mphone}</td> 
            	  </c:if>       
            	  
            	   <c:if test="${!status.last}">
            	 	  <c:if test="${ctcoursetype==null}">  
            	    	  <td><font color="red">${CtMoreInfo.mname}</font></td>
       			  		  <td><font color="red">${CtMoreInfo.mphone}</font></td> 
       			 	  </c:if> 
       			 	  
       			  	 <c:if test="${ctcoursetype!=null}"> 
       			  		 <td>${CtMoreInfo.mname}</td>
       			   		 <td>${CtMoreInfo.mphone}</td> 
            	 	 </c:if>
       			   </c:if>
       			   
            </tr>
        </c:forEach>
 
        </tbody>
    </table>
</div>

<div class="teacherMask">
 <div class="addDIV">
	<div style="background-color:#8FBC8F;height:40px;width:150;color:#000000;font-size:18px;padding-left:7px;">
	教练信息<font style="float:right;padding-right:10px;" onclick="cancelEdit()">X</font>
	</div>
	
	<input  id="teacherQuery" width="width:20%"/>
	
	<button class="btn"   onclick="searchTeacher()">查询</button>
	<div id="teacherList" style="border:2px solid #CCC;height:200px;overflow-y:scroll;margin:10px;">
	
	</div>
 </div>	
</div>

</body>
</html>