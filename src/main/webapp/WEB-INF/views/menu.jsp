<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
<%-- 引入JQ和Bootstrap --%><!--必须先引用jQuery再引用bootstrap-->
     <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>  
    <link href="css/style.css" rel="stylesheet">



        <style>
            .menu_list {
                width: 268px;
                margin: 0;
            }
             
            .menu_head {
                height: 47px;
                line-height: 47px;
                padding-left: 38px;
                font-size: 14px;
                color: #525252;
                cursor: pointer;
                border: 1px solid #f1f1f1;
                position: relative;
                margin: 0px;
                font-weight: bold;
                background: #9FB6CD;
            }
             
            .menu_list .current {
                background: #9FB6CD;
            }
             
            .menu_nva {
                line-height: 38px;
                border-left: 1px solid #9FB6CD;
                backguound: #fff;
                border-right: 1px solid #9FB6CD;
            }
             
            .menu_nva a {
                display: block;
                height: 38px;
                line-height: 38px;
                padding-left: 38px;
                color: #777777;
                background: #fff;
                text-decoration: none;
                border-bottom: 1px solid #9FB6CD;
            }
             
            .menu_nva a:hover {
                text-decoration: none;
            }
        </style>
</head> 
<body>
    <div id="menuContent" style="background-color:#9FB6CD;color:#000000;height:120px;">
		<h1 style="margin-left:30px;margin-top:10px;">健身房管理系统</h1>
		<br/>
	<div style="margin-left:50px;">
		常用：
		<a href="${pageContext.request.contextPath }/editContract">&nbsp; <button class="btn btn-success">办理合同</button> &nbsp; &nbsp;|</a>
		<a href="${pageContext.request.contextPath }/findCourse">&nbsp; &nbsp;<button class="btn btn-success"> 检索课程</button>  &nbsp; &nbsp;|</a>
		<!--  &nbsp || &nbsp &nbsp &nbsp 导航： -->
		<a href="#"> &nbsp;&nbsp; <button class="btn btn-success">查询会员</button> &nbsp; &nbsp;|</a>	
		<a href="#">&nbsp; &nbsp;<button class="btn btn-success">其他</button></a>
		</div>
    </div>	
   
        <div id="firstpaneDiv" class="menu_list">
            <h3 class="menu_head current">主页</h3>
            <div style="display:block" class="menu_nva">
                <a href="${pageContext.request.contextPath }/home">首页</a>                              
            </div>
            <h3 class="menu_head">教学管理</h3>
            <div style="display:none" class="menu_nva">
                <a href="${pageContext.request.contextPath }/editContract">合同办理</a>
                <a href="${pageContext.request.contextPath }/findBy">合同查询</a>
                <a href="${pageContext.request.contextPath }/findBy">合同刷课</a>
                <a href="${pageContext.request.contextPath }/operateCt">转课/换教练</a>
                <a href="${pageContext.request.contextPath }/listCtTable">课时报表</a>  
            </div>
            
            <h3 class="menu_head">课程管理</h3>
            <div style="display:none" class="menu_nva">
                <a href="${pageContext.request.contextPath }/findCourse">课程查询</a>
                <a href="${pageContext.request.contextPath }/listCourse">课程操作</a>
                <a href="${pageContext.request.contextPath }/addCourse">课程添加</a>
            </div>
            <h3 class="menu_head">会员管理</h3>
            <div style="display:none" class="menu_nva">
                <a href="#">会员添加</a>
                <a href="#">会员办卡</a>
                <a href="#">。。。</a>
                <a href="#">。。。</a>
            </div><h3 class="menu_head">员工管理</h3>
            <div style="display:none" class="menu_nva">
                <a href="#">添加员工</a>
                <a href="#">。。。</a>
                <a href="#">。。。</a>

            </div><h3 class="menu_head">设置</h3>
            <div style="display:none" class="menu_nva">
                <a href="#">个人信息</a>
                <a href="#">打印报表</a>
                <a href="#">退出登录</a>

            </div>
         </div>

           
      

<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#firstpaneDiv .menu_nva:eq(0)").show();
    $("#firstpaneDiv h3.menu_head").click(function(){
        $(this).addClass("current").next("div.menu_nva").slideToggle(200).siblings("div.menu_nva").slideUp("slow");
        $(this).siblings().removeClass("current");
    });
    $("#secondpane .menu_nva:eq(0)").show();
    $("#secondpane h3.menu_head").mouseover(function(){
        $(this).addClass("current").next("div.menu_nva").slideDown(400).siblings("div.menu_nva").slideUp("slow");
        $(this).siblings().removeClass("current");
    });
});
</script>
</body>
</html>