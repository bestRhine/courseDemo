<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>

<div class="findDIV">
 
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">查询course</h3>
        </div>
        <div class="panel-body">
 
            <form method="post" action="${pageContext.request.contextPath }/findCourse" role="form">
                <table class="addTable">
                    <tr>
                        <td>查询：</td>
                        <td><input type="text" name="cname" id="cname" placeholder="请在这里输入课程名查询"></td>
                  

                        <td>
                            <button type="submit" class="btn btn-success">提 交</button>
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
            <th>courseid</th>
            <th>memberid</th>
            <th>name</th>
            <th>info</th>
            <th>type</th>
 
            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>
 
        <tbody>
        <c:forEach items="${course}" var="course" varStatus="status">
            <tr>
            	<td>${course.cid}</td>
                <td>${course.tid}</td>
                <td>${course.cname}</td>
                <td>${course.cinfo}</td>
                <td>${course.ctype}</td>

 
                <td><a href="${pageContext.request.contextPath }/editCourse?cid=${course.cid}">修改</a></td>
                <td><a href="${pageContext.request.contextPath }/deleteCourse?cid=${course.cid}">删除</a></td>
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
 

 
</body>
</html>