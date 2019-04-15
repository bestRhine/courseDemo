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
                <a href="javascript:updateContract('${CtMoreInfo.ctid}','${CtMoreInfo.cname}')"  class="button">刷课	</a>				
                </td> 
                
                 <c:if test="${ctcoursetype==null}">              
                <td>
                <a href="javascript:contractTransCourse('${CtMoreInfo.ctid}','${CtMoreInfo.cname}','${CtMoreInfo.camount}')" class="button">转课</a>
                </td>
                <td>
                <a href="javascript:contractTransCourse('${CtMoreInfo.ctid}')" class="button">更换教练</a>
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
            		<td><font color="red">${CtMoreInfo.mname}</td>
       			    <td><font color="red">${CtMoreInfo.mphone}</td> 
            	  
            </tr>
        </c:forEach>
 
        </tbody>
    </table>
</div>

</body>
</html>