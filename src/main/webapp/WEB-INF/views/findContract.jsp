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
<title>合同</title>
</head>
<body>

<div class="findcontractDIV">
 
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">按条件查询contract</h3>
        </div>
        <div class="panel-body">
        
	<form method ="get"  action="${pageContext.request.contextPath }/findBy?ctteacher=${ctteacher}&ctbegin=${ctbegin}&ctend=${ctend}&ctid=${ctid}" role="form">
	                <table class="addTable">
		            <tr>                       
                        <td>合同号:</td>
                        <td><input type="text" name="ctid" id="ctid"  placeholder="合同号"></td>
                        <td>教练:</td>
                        <td><input type="text" name="ctteacher" id="ctteacher"  placeholder="教练名"></td>
                    </tr>
                     <tr>
                        <td>日期：</td>
                        <td><input type="datatime-local" name="ctbegin" id="ctbegin" placeholder="开始日期"></td>
                        <td>-到-</td>
                        <td><input type="datatime-local" name="ctend" id="ctend" placeholder="结束日期"></td>
                    </tr>
                    <tr>    
                       <td>    <button type="提交" class="btn btn-success">提交</button>
                       </td>
                   </tr>  
 
                </table>
            </form>
        </div>  
   </div>
</div>  


<div class="listcontractDIV">
      <table class="table table-striped table-bordered table-hover table-condensed">
        <thead>
        <tr class="success">
            <th>合同号</th>
            <th>租户号</th>
            <th>教练</th>
            
            <th>售课人</th>
            <th>开始日期</th>
            <th>结束日期</th>
            <th>订单</th>
       		
 			<th>实付</th>
 			<th>操作人</th>
            <th>类型</th>
            
            <th>更多..</th>
        </tr>
        </thead>
 
        <tbody>
                    
            <c:forEach items="${contractList}" var="Contract" varStatus="status">
            <tr>
            	<td>${Contract.ctid}</td>
                <td>${Contract.tid}</td>
                <td>${Contract.ctteacher}</td>
                <td>${Contract.ctsaler}</td>

                <td>${Contract.ctbegin}</td>
                <td>${Contract.ctend}</td>
                
				<td>${Contract.ctorder}</td>
			    <td>${Contract.ctpay}</td>
				<td>${Contract.ctoperator}</td>
				
				<td>${Contract.cttype}</td>


                <td><a href="${pageContext.request.contextPath }/showMoreInfo?ctid=${Contract.ctid}">详细》</a></td>
                
            </tr>
        </c:forEach>
	</tbody>
	</table>
</div>

</body>
</html>