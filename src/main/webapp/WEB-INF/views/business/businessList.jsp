<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><span>商户列表</span></li>
		</ul>
		<div class="page-toolbar">
			<button id="showMnForm" class="pull-right tooltips btn green">
				添加商户</button>
		</div>
	</div>

	<div id="businessContent" style="margin-top: 20px">
		<c:choose>
			<c:when test="${!empty businessList }">
				<table id="businessTable"
					class="table table-hover  table-bordered table-striped"
					style="margin-bottom: 0px; table-layout: fixed;">
					<thead>
						<tr>
						    <td width="100">LOGO</td>
							<td width="100">公司名称</td>
							<td>公司地址</td>
							<td>公司介绍</td>
							<td width="100">联系手机号</td>
							<td width="100">联系电话</td>
							<td width="100">传真</td>
							<td>网址</td>
							<td width="100">展位</td>
							<td text-align='center' width="330px">操作</td>
						</tr>
					</thead>
					<c:forEach var="business" items="${businessList }" varStatus="status">
						<tr>
							<td><img width="80" src="${business.logo }" ></img></td>
							<td>${business.company }(${business.businessId })</td>
							<td style="text-align: left;">${business.address }</td>
							<td style="text-align: left;">${business.introduction }</td>
							<td>${business.phoneNumber }</td>
							<td>${business.tel }</td>
							<td>${business.fax }</td>
							<td style="text-align: left;">${business.siteUrl }</td>
							<td>${business.stand }</td>
							<td>
								<input class="btn green" style="width: 90px;" value="修改" onclick='update(${business.businessId })'/>
								<input class="btn green" style="width: 90px;" value="删除" onclick="del(${business.businessId });"/>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				暂无商户信息
		</c:otherwise>

		</c:choose>
	</div>

	<div id="formArea" style="margin-top: 20px; display: none">
		<form id="businessForm">
			<input id="businessId" type="text" name="businessId" style="display: none">
			<table class="table table-hover  table-bordered table-striped">
				<tr>
					<td>公司名称</td>
					<td><input type="text" id="company" name="company"></td>
				</tr>
				<tr>
					<td>公司地址</td>
					<td><input type="text" id="address" name="address"></td>
				</tr>
				<tr>
					<td>公司介绍</td>
					<td><textarea type="text" id="introduction" name="introduction"></textarea>
				</tr>
				<tr>
					<td>联系手机号</td>
					<td><input type="text" id="phoneNumber" name="phoneNumber"></td>
				</tr>
				<tr>
					<td>联系电话</td>
					<td><input type="text" id="tel" name="tel"></td>
				</tr>
				<tr>
					<td>传真</td>
					<td><input type="text" id="fax" name="fax"></td>
				</tr>
				<tr>
					<td>网址</td>
					<td><input type="text" id="siteUrl" name="siteUrl"></td>
				</tr>
				<tr>
					<td>展位</td>
					<td><input type="text" id="stand" name="stand"></td>
				</tr>
				<tr>
					<td>头像</td>
					<td>
						<div class="col-md-5">
							<form id='upload' enctype="multipart/form-data" method="post">
								<input type="file" name="fileToUpload" id="fileToUpload" onchange="uploadPic()" style="display: none">
							</form>
							<span class="btn btn-default" id="selectPic" name="selectPic" onclick="selectPic()">选择文件</span>
							<img alt="" src="" id="showPicture" style="width: 80px;">
							<input id="logo" style="" value="">
						</div>
					</td>
				</tr>
			</table>
			<div style="text-align: center;">
				<input type="button" class="btn green" value="返回" id="back">
				<input type="button" class="btn green" value="确定" id="submit">
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
$("#showMnForm").on("click",function(){
	$("#businessId").val('');
	$("#company").val('');
	$("#address").val('');
	$("#introduction").val('');
	$("#phoneNumber").val('');
	$("#tel").val('');
	$("#fax").val('');
	$("#siteUrl").val('');
	$("#stand").val('');
	$("#logo").val('');
	$("#businessContent").hide(500);
	$("#formArea").show(500);
});
$("#back").on("click",function(){
	$("#businessContent").show(500);
	$("#formArea").hide(500);
})

$('#submit').on('click',function(){
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
			var picture = $("#logo").val();
    		$.post(
    				"${ctx}/UIYouyiBackstage/business/addBusiness?logo=" + picture + "&"+$("#businessForm").serialize(),
    				function(data){	
    					if(data['code']==1){
    						alert("添加成功");
    						$("#right_main").load("../business/showBusinessList");
    					}else{
    						alert("添加失败，请重试");
    					}
    				}
    				
    		).success(function(){hideImg();}).error(function(){hideImg();alert("系统异常！");});
    	});
    	
function del(businessId){
	if(confirm("确定删除该商户吗？")){
		$.post(
				"${ctx}/UIYouyiBackstage/business/deleteBusiness?businessId="+businessId,
				function(data){
					if(data['code']==1){
						$("#right_main").load("../business/showBusinessList");
					}else{
						alert("删除失败，请重试");
					}
				}
		);
	}	
};

function update(businessId){
	showImg();
	$.ajax({
		url:"${ctx}/UIYouyiBackstage/business/queryBusinessById",
		type:"get",
		data:{"businessId":businessId},
		dataType:"json",
		success:function(result){
			hideImg();
			var business=result.content;
			$("#businessContent").hide(500);			
			
			$("#businessId").val(business.businessId);
			$("#company").val(business.company);
			$("#address").val(business.address);
			$("#introduction").val(business.introduction);
			$("#phoneNumber").val(business.phoneNumber);
			$("#tel").val(business.tel);
			$("#fax").val(business.fax);
			$("#siteUrl").val(business.siteUrl);
			$("#stand").val(business.stand);
			$("#logo").val(business.logo);
			$("#showPicture").attr("src",business.logo);
			$("#formArea").show(500);		
		},
		error:function(){
			hideImg();
			alert("系统异常");
		}
	})
	};

function uploadPic() {
	$.ajaxFileUpload({
		url : "${ctx}/UIYouyiBackstage/uploadController/upload",
		secureuri : false,
		fileElementId : 'fileToUpload',
		dataType : 'text',
		success : function(data, status) {
			$("#showPicture").attr("src", data);
			$("#logo").val(data);
		},
		error : function(data, status, e) {
			plus.nativeUI.toast(data);
		}
	});
	return false;
}

function selectPic() {
	$("#fileToUpload").click();
}
</script>
</html>