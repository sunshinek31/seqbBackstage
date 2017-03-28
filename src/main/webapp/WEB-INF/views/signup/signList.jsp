<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#cityId {
	width: 120px;
}

table td {
	text-align: center;
}
</style>
<style>
#PanelAddAddress {
	padding: 4px;
	border: solid 1px #8bd246;
	font-size: 13px;
	position: absolute;
	width: 160px;
	height: 120px;
	z-index: 2000;
	left: 0px;
	top: 0px;
	display: none;
	background-color: #fff;
}

#PanelAddAddress div {
	padding: 3px;
}
</style>
</head>
<body>
<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><span>与会人员列表</span></li>
		</ul>
		<div class="page-toolbar">
			<button id="showMnForm" class="pull-right tooltips btn green">
				添加人员</button>
			<button onclick="backMeeting(${meetingId})" class="pull-right tooltips btn green">
				返回</button>
		</div>
</div>
	
	<div id="signContent" style="margin-top: 20px">
					<table id="signTable"
						class="table table-hover  table-bordered table-striped"
						style="margin-bottom: 0px; table-layout: fixed;">
						<thead>
							<tr>
								<td width="100">姓名</td>
								<td>性别</td>
								<td width="100">职称</td>
								<td width="100">所属单位</td>
								<td width="100">邮编</td>
								<td width="100">手机号</td>
								<td>邮箱</td>
								<td width="50">是否住宿</td>
								<td width="50">是否考证</td>
								<td width="50">是否提前注册</td>
								<td text-align='center' width="440px">
								<button id="uploadExcelFile" class="pull-right tooltips btn green">导入excel文件</button>
								<div class="page-toolbar"><input id="excelFile" name="file" type="file"></input></div>
							</tr>
						</thead>
						<c:forEach var="sign" items="${signList }"
							varStatus="status">
							<tr>
								<td>${sign.name }</td>
								<td><c:if test="${sign.sex ==0}">未知</c:if> 
								    <c:if test="${sign.sex ==1 }">男</c:if>
									<c:if test="${sign.sex ==2 }">女</c:if></td>
								<td>${sign.position }</td>
								<td>${sign.company }</td>
								<td>${sign.zip }</td>
								<td>${sign.phoneNumber }</td>
								<td>${sign.email }</td>
								<td><c:if test="${sign.isHousing ==0 }">是</c:if> <c:if
										test="${sign.isHousing ==1 }">否</c:if></td>
								<td><c:if test="${sign.isGainCert ==0 }">是</c:if> <c:if
										test="${sign.isGainCert ==1 }">否</c:if></td>
								<td><c:if test="${sign.isRegisterEarly ==0 }">否</c:if> <c:if
										test="${sign.isRegisterEarly ==1 }">是</c:if></td>
								<td><input class="btn green" style="width: 90px;"
							    	value="修改" onclick="updateSign(${sign.signId });" />
									<input class="btn green" style="width: 90px;" value="删除"
									onclick="delSign(${sign.signId });" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
	<div id="formArea" style="margin-top: 20px; display: none">
		  <form id="signForm">
			<input id="signId" type="text" name="signId" style="display: none">
			
			<table class="table table-hover  table-bordered table-striped">
				<tr>
					<td>姓名</td>
					<td><input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<td>性别</td>
					<td>
					           未知<input type="radio" name="sex"   value="0">
					            男<input type="radio" name="sex"  checked = "checked" value="1"> 
						女<input type="radio" name="sex"   value="2"></td>
				</tr>
				<tr>
					<td>职称</td>
					<td><textarea type="text" id="position" name="position"></textarea>
				</tr>
				<tr>
					<td>所属单位</td>
					<td><input type="text" id="company" name="company"></td>
				</tr>
				<tr>
					<td>邮编</td>
					<td><input type="text" id="zip" name="zip"></td>
				</tr>
				<tr>
					<td>手机号</td>
					<td><input type="text" id="phoneNumber" name="phoneNumber"></td>
				</tr>
				<tr>
					<td>邮箱</td>
					<td><input type="text" id="email" name="email"></td>
				</tr>
				<tr>
					<td>是否住宿</td>
					<td>是<input type="radio" name="isHousing"  checked = "checked" value="0"> 
						否<input type="radio" name="isHousing"   value="1"></td>
				</tr>
				<tr>
					<td>是否考证</td>
					<td>是<input type="radio" name="isGainCert"  checked = "checked" value="0"> 
						否<input type="radio" name="isGainCert"   value="1"></td>
				</tr>
				<tr>
					<td>是否提前注册</td>
					<td>是<input type="radio" name="isRegisterEarly"  checked = "checked" value="1"> 
						否<input type="radio" name="isRegisterEarly"   value="0"></td>
				</tr>
				<tr>
					<td>meetingId</td>
					<td><input id="meetingId" type="text" name="meetingId" value="${meetingId} " style="display: none"></td>
				</tr>
			</table>
			<div style="text-align: center;">
				<input type="button" class="btn green" value="返回" id="back">
				<input type="button" class="btn green" value="确定" id="config">
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
function backMeeting(meetingId){
	$("#right_main").load("../meeting/showMeetingDetail?meetingId=${meetingId }");
}

$("#showMnForm").on("click",function(){
	$("#name").val('');
	$('input[name="sex"]:checked').val();
	$("#meetingId").val();
	$("#position").val('');
	$("#company").val('');
	$("#zip").val('');
	$("#phoneNumber").val('');
	$("#email").val('');
	$('input[name="isHousing"]:checked').val();
	$('input[name="isGainCert"]:checked').val();
	$('input[name="isRegisterEarly"]:checked').val();
	$("#signContent").hide(500);
	$("#formArea").show(500);
});

$("#back").on("click",function(){
	$("#signContent").show(500);
	$("#formArea").hide(500);
})

$('#config').on('click',function(){
			/* var title=$("#itemName").val();
			var cityId=$("#cityId1").val();
			var itemDuration=$("#itemDuration").val();
			var abstractIntro=$("#abstractIntro").val();
			var introduction=$("#introduction").val();
			var	basePrice=$("#basePrice").val();
			var integral=$("#integral").val();
			if(itemName==''||cityId==''||itemDuration==''||abstractIntro==''||introduction=='' || basePrice==''){
				alert('请完善信息');
				return;
			} */
			showImg();
    		$.post(
    				"${ctx}/UIYouyiBackstage/signup/addSign?"+$("#signForm").serialize(),
    				function(data){	
    					if(data['code']==1){
    						alert("添加成功");
    						$("#right_main").load("../signup/showSignList?meetingId=${meetingId}");
    					}else{
    						alert("添加失败，请重试");
    					}
    				}
    				
    		).success(function(){hideImg();}).error(function(){hideImg();alert("系统异常！");});
    	});
    	
function updateSign(signId){
	showImg();
	$.ajax({
		url:"${ctx}/UIYouyiBackstage/signup/querySignById",
		type:"get",
		data:{"signId":signId},
		dataType:"json",
		success:function(result){
			hideImg();
			var sign=result.content;
			$("#signContent").hide(500);			
			
			$("#signId").val(sign.signId);
			$("#name").val(sign.name);
			$("#meetingId").val(sign.meetingId);
			$("#sex").val(sign.sex);
			$("#position").val(sign.position);
			$("#company").val(sign.company);
			$("#zip").val(sign.zip);
			$("#phoneNumber").val(sign.phoneNumber);
			$("#email").val(sign.email);
			$("#isHousing").val(sign.isHousing);
			$("#isGainCert").val(sign.isGainCert);
			$("#isRegisterEarly").val(sign.isRegisterEarly);
			$("#openId").val(sign.openId);
			$("#formArea").show(500);		
		},
		error:function(){
			hideImg();
			alert("系统异常");
		}
	})
	};
	
	function delSign(signId){
		if(confirm("确定删除该人员吗？")){
			$.post(
					"${ctx}/UIYouyiBackstage/signup/delSignUpById?signId="+signId,
					function(data){
						if(data['code']==1){
							$("#right_main").load("../signup/showSignList?meetingId=${meetingId}");
						}else{
							alert("删除失败，请重试");
						}
					}
			);
		}	
	};

$("#uploadExcelFile").on("click",function(){
	$.ajaxFileUpload({  
        url: "${ctx}/UIYouyiBackstage/signup/addSignBatch?meetingId=${meetingId }",
        secureuri : false,  
        fileElementId : "excelFile",  
        dataType : 'multipart/form-data',
        success : function(data, status) {
        	$("#right_main").load("../signup/showSignList?meetingId=${meetingId}");
        },  
        error : function(data, status, e) {  
        	plus.nativeUI.toast(data);
        }  
    });
});		
</script>
</html>