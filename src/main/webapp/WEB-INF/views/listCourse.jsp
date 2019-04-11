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
<title>课程管理</title>
<script type="text/javascript">
function addCtInfo(){
	$("#addCtInfo").css("display","block")
}

function deleteCourse(cid,cname){
	if(confirm('是否要删除【编号'+cid+':'+cname+'】课程？')){
		location.href="${pageContext.request.contextPath }/deleteCourse?cid="+cid
	}else{}
}

<%--function editCourse(cid){
	  var url="${pageContext.request.contextPath}/editCourse?cid="+cid

	  window.open(url,"编辑","height=310,width=700,top=300,left=400,scrollbars=no")     
}  --%>


</script>

</head>
<body>
<%@ include file="menu.jsp" %><br/>
<div class="findDIV">
 
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">查询课程</h3>
        </div>
        <div class="panel-body">
 
           <form method="get" action="${pageContext.request.contextPath }/findCourse?cname=${cname}" role="form">
                <table class="addTable">
                    <tr>
                        <td>查询：</td>
                        <td><input type="text" name="cname" id="cname" placeholder="请在这里输入课程名查询"></td>
                  

                        <td>
                            <button type="提交" class="btn btn-success">提交</button>
                        </td>
 
                    </tr>  
 
                </table>
            </form>
        </div>  
   </div>
</div>    
   
 

 
<div class="listDIV">
    <table class="table table-striped table-bordered table-hover table-condensed">
        <thead>
        <tr class="success">
            <th>课程号</th>
            <th>租户</th>
            <th>课程名</th>
            <th>简介</th>
            <th>类型</th>
 
            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>
 
        <tbody>
        <c:forEach items="${course}" var="Course" varStatus="status">
            <tr>
            	<td>${Course.cid}</td>
                <td>${Course.tid}</td>
                <td>${Course.cname}</td>
                <td>${Course.cinfo}</td>
                <td>${Course.ctype}</td>

 
                <td><a href="${pageContext.request.contextPath}/editCourse?cid=${Course.cid}">修改</a></td>
                <td><a href="javascript:deleteCourse('${Course.cid}','${Course.cname}')"  class="button">删除</a></td>
            </tr>
        </c:forEach>
 
        </tbody>
    </table>
</div>
 
 <nav class="pageDIV">

    <ul class="pagination">
        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?page.start=0">
                <span>«</span>
            </a>
        </li>
 
        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?page.start=${page.start-page.count}">
                <span>‹</span>
            </a>
        </li>
 
        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
 
            <c:if test="${status.count*page.count-page.start<=30 && status.count*page.count-page.start>=-10}">
                <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                    <a
                            href="?page.start=${status.index*page.count}"
                            <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                    >${status.count}</a>
                </li>
            </c:if>
        </c:forEach>
 
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?page.start=${page.start+page.count}">
                <span>›</span>
            </a>
        </li>
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?page.start=${page.last}">
                <span>»</span>
            </a>
        </li>
    </ul>

</nav>
 

<div class="addDIV">
 
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">增加课程</h3>
        </div>
        <div class="panel-body">
 			<div class="btn btn-div" onclick="addCtInfo()" style="float:right">➕添加
            <form method="post" action="${pageContext.request.contextPath }/addCourse" role="form">
            <div id="addCtInfo" style="display:none">
                <table class="addTable">
                    <tr>
                        <td>租户：</td>
                        <td><input type="text" name="tid" id="tid" placeholder="请在这里输入租户"></td>
                    </tr>
                    <tr>
                        <td>姓名：</td>
                        <td><input type="text" name="cname" id="cname" placeholder="请在这里输入名字"></td>
                    </tr>
                    <tr>
                        <td>简介：</td>
                        <td><input type="text" name="cinfo" id="cinfo" placeholder="请在这里输入简介"></td>
                    </tr>
                    <tr>
                        <td>类型：</td>
                        <td><input type="text" name="ctype" id="ctype" placeholder="1万能课/2私课/3团课"> </td>
                    </tr>

                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
 
                    </tr>
 
                </table>
               </div>
            </form>
        </div>
    </div>
 
</div>
	
</body>
</html>