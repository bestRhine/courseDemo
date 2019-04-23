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
<script type="text/javascript">
	function changeType(){
		var type=document.getElementById("indexType").value	
		$("#ctcoursetype").val(type) 
	}
	function searchCourse(){
		var cname = document.getElementById("cnameQuery").value
		addCourse(cname)
	}
	
	function addCourse(cname){
		var type=document.getElementById("indexType").value	
		var message=""
			if(cname!=null){
				message="{'cname':'"+cname+"','ctype':'"+type+"'}"
			}else{
				message="{'cname':'','ctype':'"+type+"'}"
			}
			$.ajax({
				type:'post',
				url: '${pageContext.request.contextPath}/getCourseList',
				contentType:'application/json;charset=utf-8',
				data:message,
				success:function(data){
					var tableHead="<tr>"+"<td><input type='checkbox' onclick='checkAll(this)'></td>"+
							"<td>课程名</td><td>类型</td><td>简介</td><td>教练</td>"+
							"</tr>"
					$("#courseList").html(tableHead)
					for(var i=0;i<data.length;i++){
						var oldHtml=$("#courseList").html()
						var cInfo="<tr>"+"<td><input type='checkbox' id='carrays'  name='carrays' value='"+data[i].cid+"'></td>"+
								"<td>"+data[i].cname+"</td><td>"+data[i].ctype+"</td><td>"+data[i].cinfo+"</td><td>"+data[i].cteacher+"</td>"+"</tr>"
														
						$("#courseList").html(oldHtml+cInfo)
					}								
					$("#courseList").html("<table style='width:400px;text-align:center;' border=1>"+
							$("#courseList").html()+"</table>")    
							 
					$(".courseMask").css("display","block")
				},
				error:function(data) {alert("操作异常！ 重试")}

			});
	}
	function checkAll(obj){
		var isCheck=obj.checked
		var checkList=document.getElementsByName("carrays")
		for(var i=0;i<checkList.length;i++){
			checkList[i].checked=isCheck
		}
	} 

	
	function selectCourse(){
		$("#courseInfo").html("") 
		var myArray=new Array()
		var len=0
		var arrays=document.getElementsByName("carrays")
		for (var i=0;i<arrays.length;i++){
			if(arrays[i].checked){
				myArray[len++]=arrays[i].value
			}
		}
		
		$.ajax({
			type:'post',
			url: '${pageContext.request.contextPath}/getCourseAndAmountList',
			data:{"arrays":myArray},
			traditional:true,
			success:function(data){
				var tableHead="<tr>"+
						"<td>课程名</td><td>类型</td><td>数量</td>"+
						"</tr>"
				$("#courseInfo").html(tableHead)
				for(var i=0;i<data.length;i++){
					var course=data[i].course
					var oldHtml=$("#courseInfo").html()  
					<!--取出来的是List数组，且按id查找只有里面一个元素。存放的是hashmap，所以这里先list.get(0)取出map,再get(key)取出值-->
					var courseInfo="<tr>"+"<td>"+course[0].cname+"</td>"+
							"<td>"+course[0].ctype+"</td><td>"+
							"<input type='number'  style='width:50px' name='camountArrays' min='5' max='500'>课时"+"</td>"+
							"</tr><input type='hidden' name='courseIdArrays' value='"+course[0].cid+"'>"
					
					$("#courseInfo").html(oldHtml+courseInfo)
				}
				$("#courseInfo").html("<table style='width:500px;text-align:center;' border=1>"+
						$("#courseInfo").html()+"</table>")
						
				$(".courseMask").css("display","none")
				$("#courseInfo").css("display","block")
			},
			error:function(data) {alert("操作异常！ 重试")}

		});
    }
		
		
	function cancelEdit(){ 
		$(".courseMask").css("display","none")
		$(".memberMask").css("display","none")
	}
	function cancelWindowMask(){
		$("#cancelWindowMask").css("display","none")    <!--在css中设置布局的，这里直接#。。获取，否则蒙版mask类似上一个函数-->
	}
	 
	function searchMember(){
		<!--addMember($("#mname").val())-->
		var mname = document.getElementById("mnameQuery").value
		addMember(mname)
	}
	function addMember(mname){
		var message=""
			if(mname!=null){
				message="{'mname':'"+mname+"'}"
			}else{
				message="{'mname':''}"
			}
			$.ajax({
				type:'post',
				url: '${pageContext.request.contextPath}/getMemberList',
				contentType:'application/json;charset=utf-8',
				data:message,
				success:function(data){
					var tableHead="<tr>"+"<td><input type='checkbox' onclick='checkAll(this)'></td>"+
							"<td>会员名</td><td>性别</td><td>电话</td>"+
							"</tr>"
					$("#memberList").html(tableHead)
					for(var i=0;i<data.length;i++){
						var oldHtml=$("#memberList").html();
						var memberInfo="<tr>"+"<td><input type='checkbox' id='marrays' name='marrays' value='"+data[i].mid+"'></td>"+
								"<td>"+data[i].mname+"</td><td>"+data[i].mgender+"</td><td>"+data[i].mphone+"</td>"+"</tr>"
						
						$("#memberList").html(oldHtml+memberInfo)
					}
							
					$("#memberList").html("<table style='width:400px;text-align:center;' border=1>"+
							$("#memberList").html()+"</table>")    
							 
					$(".memberMask").css("display","block")
				},
				error:function(data) {alert("操作异常！ 重试")}

			});
	}
	
	function selectMember(){
		$("#memberInfo").html("")
		var myArray=new Array()
		var len=0
		var arrays=document.getElementsByName("marrays")
		for (var i=0;i<arrays.length;i++){
			if(arrays[i].checked){
				myArray[len++]=arrays[i].value;
			}
		}
		$.ajax({
			type:'post',
			url: '${pageContext.request.contextPath}/getMemberJsonList',
			data:{"arrays":myArray},
			traditional:true,
			success:function(data){
				var tableHead="<tr>"+"<td>会员名</td><td>性别</td><td>手机号</td>"+"</tr>"
		       $("#memberInfo").html(tableHead)
				for(var i=0;i<data.length;i++){
					var member=data[i].member
					var oldHtml=$("#memberInfo").html()
					var memberInfo="<tr>"+"<td>"+member[0].mname+"</td>"+
					"<td>"+member[0].mgender+"</td><td>"+member[0].mphone+"</td>"+
					"</tr><input type='hidden' name='memberIdArrays' value='"+member[0].mid+"'>" 
					
					$("#memberInfo").html(oldHtml+memberInfo)	
				}
				$("#memberInfo").html("<table style='width:500px;text-align:center;' border=1>"+
						$("#memberInfo").html()+"</table>") 
				$(".memberMask").css("display","none") 
				$("#memberInfo").css("display","block") 
			},
			error:function(data) {alert("操作异常！ 重试")}

		});
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
			$("#ctteacher").val(empName) 
			cancelEditTeacher()
		}
		function cancelEditTeacher(){
			$(".teacherMask").css("display","none")
		}

	
		function searchSaler(){
			var saler = document.getElementById("salerQuery").value
			addSaler(saler)
		}
		function addSaler(saler){
				$("#salerList").html("")
				var message=""
				if(saler!=null){
					message="{'saler':'"+saler+"'}"
				}else{
					message="{'saler':''}"
				} 
				
				$.ajax({
					type:'post',
					url: '/gymms/getSalerList',
					contentType:'application/json;charset=utf-8',
					data:message,
					success:function(data){
						for(var i=0;i<data.length;i++){
							var oldHtml=$("#salerList").html();
							var salerInfo="<p onclick=\"selectSaler('"+data[i].empName+"')\">"
							      +"☐&nbsp 姓名："+data[i].empName+"&nbsp Tel:"+data[i].empPhone+"</p><hr/>" 
							$("#salerList").html(oldHtml+salerInfo)
						}
						$(".salerMask").css("display","block")
					},
					error:function(data) {alert("操作异常！ 重试")}
				});
			}
			function selectSaler(empName){
				$("#ctsaler").val(empName) 
				cancelEditSaler()
			}
			function cancelEditSaler(){
				$(".salerMask").css("display","none")
			}

		
		
	
	function checkAddContract(){ 
        if($("#ctoperator").val()==null||$("#ctoperator").val()==""){
            alert("操作员工不能为空！");
            return false;
        }
        if($("#ctteacher").val()==null||$("#ctteacher").val()==""||$("#ctsaler").val()==null||$("#ctsaler").val()==""){
            alert("（上课/售课教练）不能为空！");
            return false;
        }
        
        var reg = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/
        if(!(reg.test($("#ctbegin").val())&&reg.test($("#ctend").val()))) 
        { 
            alert("请输入正确完整的日期格式！"); 
            return false; 
        } 
        
        if($("#ctorder").val()==null||$("#ctorder").val()==""||$("#ctpay").val()==null||$("#ctpay").val()==""){
            alert("订单/实付金额不能为空！");
            return false;
        }
       
        return true;
   }
	 
			
</script>

</head>
<body>
<%@ include file="menu.jsp" %><br/>

<div class="right">

<form method="post" action="${pageContext.request.contextPath }/addContract" role="form"  onsubmit=" return checkAddContract()">
                                  <!--  onsubmit做校验，如果输入参数不合法，组织表单提交。这里必须是return+function() -->
<div class="addCtDIV">
 
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">办理合同</h3>
        </div>
       <div class="panel-body">
		<table class="addTable">
              <tr>
                 <td>&nbsp; &nbsp; &nbsp; &nbsp;租户：</td>
                  <td><input type="text" name="tid" id="tid" placeholder="请在这里输入租户id"></td>
                  <td>&nbsp;操作员工：</td>
                  <td><input type="text" name="ctoperator" id="ctoperator" placeholder="输入操作人姓名"></td>
              </tr>
              <tr>
                 <td>合同类型：</td>
                  <td><select id="indexType" onchange="changeType()">
                  	<option value="私课">私课</option>
                  	<option value="团课">团课</option>
                  </select>  </td>  &nbsp; &nbsp;(说明：只有团课类型合同才能添加多个会员，多个课程!)
            
                   <input type="hidden" 	name="ctcoursetype" id="ctcoursetype" value="私课"/>
                   <input type="hidden" name="cttype" id="cttype" value="新办"/>        
              </tr>
              <tr> 
                 <td>上课教练：</td>
                  <td><input type="text" name="ctteacher" id="ctteacher" placeholder="输入教练名字" onfocus="addTeacher(null)"></td>
                  <td>&nbsp; &nbsp; &nbsp;售课人：</td>
                  <td><input type="text" name="ctsaler" id="ctsaler" placeholder="输入售课人名" onfocus="addSaler(null)"></td>
              </tr>
			  <tr>
                 <td>起止日期：</td>
                  <td><input type="text" name="ctbegin" id="ctbegin" placeholder="年/月/日"></td>
                  <td>&nbsp;  — &nbsp;到&nbsp; —&nbsp;</td>
                  <td><input type="text" name="ctend" id="ctend" placeholder="年/月/日"></td>
              </tr>
              <tr>
                 <td>订单金额：</td>
                  <td><input type="text" name="ctorder" id="ctorder" placeholder="输入金额"></td>
                  <td>&nbsp; 实付金额：</td>
                  <td><input type="text" name="ctpay" id="ctpay" placeholder="输入金额"></td>
              </tr>
              </table>	
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

<div class="salerMask">
 <div class="addDIV">
	<div style="background-color:#8FBC8F;height:40px;width:150;color:#000000;font-size:18px;padding-left:7px;">
	售卡人列表<font style="float:right;padding-right:10px;" onclick="cancelEditSaler()">X</font>
	</div>
	
	<input  id="salerQuery" width="width:20%"/>
	
	<button class="btn"   onclick="searchSaler()">查询</button>
	<div id="salerList" style="border:2px solid #CCC;height:200px;overflow-y:scroll;margin:10px;">
	
	</div>
 </div>	
</div>

	
<div class="Info">
 
   <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">课程信息</h3>
        </div>

                <div class="btn btn-div" onclick="addCourse(null)" style="float:right">➕添加
              	</div>
              		<div id="courseInfo" style="display:none">
              		
              		 <p id="cname"></p>
              		 <p id="ctype"></p>
              		 <p id="camount"></p>
              		 
              		 <input name="cid" id="cid" type="hidden"/>
					 </div>
        
    </div>
</div> <br/>



 
             
<div class="Info">
<div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">会员信息</h3>
        </div>

            <div class="btn btn-div" onclick="addMember(null)" style="float:right">➕添加
            </div>
              	<div id="memberInfo" style="display:none">
              	   <p id="mname"></p>
              	   <p id="mgender"></p>
              	   <p id="mphone"></p>
              	   <input name="mid" id="mid" type="hidden"/>
               </div>
	
</div>
</div>	<br/>	

<div class="addCtDIV">
<div class="panel-body">
		<table class="addCtTable">
  
			   <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
 
               </tr>
	</table>
	</div>
</div>

</form>

<div class="courseMask">
 <div class="addCtDIV"> 
	<div style="background-color:#8FBC8F;height:40px;width:150;color:#000000;font-size:18px;padding-left:7px;">
	课程信息<font style="float:right;padding-right:10px;" onclick="cancelEdit()">X</font>
	</div>
	
	<input type="text" id="cnameQuery" width="width:20%"/>
	
	<button class="btn"  onclick="searchCourse()">查询</button>
	<div id="courseList" style="border:2px solid #CCC;height:230px;overflow-y:scroll;margin:10px;">	
	</div>
	 <button class="btn" onclick="selectCourse()">确定</button>
 </div>	
</div><br/>

<div class="memberMask">
 <div class="addCtDIV">
	<div style="background-color:#8FBC8F;height:40px;width:150;color:#000000;font-size:18px;padding-left:7px;">
	会员信息<font style="float:right;padding-right:10px;" onclick="cancelEdit()">X</font>
	</div>
	
	<input type="text" id="mnameQuery" width="width:20%"/>
	
	<button class="btn"   onclick="searchMember()">查询</button>
	<div id="memberList" style="border:2px solid #CCC;height:230px;overflow-y:scroll;margin:10px;">
	
	</div>
	   <button class="btn" onclick="selectMember()">确定</button>
 </div>	
</div>

<div class="editDIV">
		<c:if test="${resultMessage!=null}">
		<div id="cancelWindowMask" style="display:block">
		<div style="background-color:#B4EEB4;height:70px;width:400;color:#FF3030;font-size:18px;padding-left:20px;">
		<font style="float:right;padding-right:20px;" onclick="cancelWindowMask()">X</font>
		<b>${resultMessage}</b>

		</div>
		</div>
		</c:if>
</div>

</div>





</body>
</html>