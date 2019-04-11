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
<title>合同信息</title>
<script type="text/javascript">
function updateContract(id,name){
	if(confirm('是否要刷【'+name+'】课程？')){
		location.href="${pageContext.request.contextPath }/updateContract?ctid="+id+"&cname="+name
	}else{}
}
</script>
		</head>
<body>
 
<div class="listDIV">
    <table class="table table-striped table-bordered table-hover table-condensed">
        <thead>
        <tr class="success">
			<th>合同号</th>
            <th>课程类型</th>
			<th>教练</th>
			<th>课程名</th>
			<th>课时数量</th>
			<th>操作1</th>
			<th>操作2</th>
        </tr>
        </thead>
 
        <tbody>
        
       <c:forEach items="${showMoreCtInfoList}" var="CtMoreInfo" varStatus="status">    <!-- 用类.属性进行索引遍历ctMoreInfoList -->
            <tr>
           
                <td>${CtMoreInfo.ctid}</td>
                <td>${CtMoreInfo.ctype}</td>    
                <td>${CtMoreInfo.ctteacher}</td> 
                
       			<td>${CtMoreInfo.cname}</td>
                <td>${CtMoreInfo.camount}</td>
 				
                <td><a href="javascript:updateContract('${CtMoreInfo.ctid}','${CtMoreInfo.cname}')"  class=button>刷课	<a>				
                </td>
                
                <td><a href="${pageContext.request.contextPath }/transContract">转课</a></td>
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

				<td>${CtMoreInfo.mname}</td>
            	<td>${CtMoreInfo.mphone}</td>

            </tr>
        </c:forEach>
 
        </tbody>
    </table>
</div>

</body>
</html>