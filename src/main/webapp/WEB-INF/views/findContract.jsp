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
<title>合同</title>
<script type="text/javascript">

function getType(){
	var type= document.getElementsByName("ctcoursetype")
	for(var i=0;i<type.length;i++){
		if(type[i].checked){
			$("#ctcoursetype").val(type[i].value)
		}
	}
	
}

</script>
</head>
<body>
<%@ include file="menu.jsp" %><br/>
<div class="right">

<div class="findcontractDIV">
 
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">按以下条件查询合同</h3>
        </div>
        <div class="panel-body">
        
	<form method ="get"  action="${pageContext.request.contextPath }/findBy?ctteacher=${ctteacher}&ctbegin=${ctbegin}&ctend=${ctend}&ctid=${ctid}&ctcoursetype=${ctcoursetype}&mname=${mname}&cname=${cname}" role="form">
	                <table class="addTable">
		            <tr>                     
                        <td>合同号:</td>
                        <td><input type="text" name="ctid" id="ctid"  placeholder="合同号"></td>
                        <td>会员名:</td>
                        <td><input type="text" name="mname" id="mname"  placeholder="会员名"></td>                     
                    </tr>  
                    
                    <tr>
                        <td>合同类型:</td>
                        <td><input type="radio" name="ctcoursetype" id="ctcoursetype"  value="私课" onclick="getType()">私课
                            <input type="radio" name="ctcoursetype" id="ctcoursetype"  value="团课" onclick="getType()">团课
                        </td> 
                    </tr>                  
                    <tr> 
                        <td>教练名:</td>
                        <td><input type="text" name="ctteacher" id="ctteacher"  placeholder="教练名"></td>                      
                        <td>课程名:</td>
                        <td><input type="text" name="cname" id="cname"  placeholder="课程名"></td>                      
                    </tr>
                    
                     <tr>
                        <td>日期：</td>
                        <td><input type="datatime-local" name="ctbegin" id="ctbegin" placeholder="开始日期 年/月/日"></td>
                        <td>--到--</td>
                        <td><input type="datatime-local" name="ctend" id="ctend" placeholder="结束日期 年/月/日"></td>
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
      <c:if  test="${contractList!=null}">
      <table class="table table-striped table-bordered table-hover table-condensed">
        <thead>
        <tr class="success">
        	<th>序号</th>  
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
            	<td>${status.count}</td>
            	<td>${Contract.ctid}</td>
                <td>${Contract.tid}</td>
                <td>${Contract.ctteacher}</td>
                <td>${Contract.ctsaler}</td>
                <td><fmt:formatDate value="${Contract.ctbegin}" pattern="yyyy-MM-dd" /> </td>
                <td><fmt:formatDate value="${Contract.ctend}" pattern="yyyy-MM-dd" /></td>
                
				<td>${Contract.ctorder}</td> 
			    <td>${Contract.ctpay}</td>
				<td>${Contract.ctoperator}</td>
				
				<td>${Contract.cttype}</td>


                <td><a href="${pageContext.request.contextPath}/showMoreInfo?ctid=${Contract.ctid}" class=button> 详细》</a></td>
		
            </tr>
        </c:forEach>
        
	</tbody>
		
	</table>
	
	</c:if>

<div class="addDIV">
	<c:if  test="${resultMessage!=null}">
       <b><font color="red">${resultMessage}</b>
   </c:if>
</div>	

</div>


<div>
	
	

</div>

</div>

</body>
</html>