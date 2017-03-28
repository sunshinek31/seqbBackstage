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
.centerHeight {
	width: 1300px;
}

.rightHeight {
	width: 400px;
}

.centerHeight,.rightHeight {
	padding: 10px;
	display: table-cell;
}
</style>
</head>
<body>
	<div class="contain">
		<div class="centerHeight">
			<table id="meetingBusinessTable"
				class="table table-hover  table-bordered table-striped"
				style="margin-bottom: 0px; table-layout: fixed;">
				<thead>
					<tr>
						<td text-align='center' width="440px"><input
							class="btn green" style="width: 100px;" value="添加日程"
							onclick="addBusiness();" />
							<input
							class="btn green" style="width: 100px;" value="返回"
							onclick="back();" />
						</td>
					</tr>
				</thead>
				<c:forEach var="meetingBusiness" items="${meetingBusinessList }"
					varStatus="status">
					<tr class="meetingBusinessContent">
						<td align="center">${meetingBusiness.company}</td>
						<td align="center">
							<button class="btn green addItem"
								onClick="remove('${meetingBusiness.businessId }','${meetingId}')">移除</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="rightHeight" id="businessList" style="display: none">
			<div class="row">
				<div class="col-md-12">
					<div class="btn-group pull-left">
						<input type="text" placeholder="请输入商户名称" id="companyName">
						<input class=" btn green pull-right"
							style="margin: 0 10px; width: 70px;" value="查询" onclick="check()">
					</div>
				</div>
				<table id="meetingBusinessTable"
					class="table table-hover  table-bordered table-striped"
					style="margin-bottom: 0px; table-layout: fixed;">
					<tbody id="companyContent">
					<c:forEach var="business" items="${businessList }"
						varStatus="status">
						<tr class="businessListContent">
							<td align="center">${business.company}</td>
							<td align="center">
								<button class="btn green addItem"
									onClick="config('${business.businessId }','${meetingId}' )">添加</button>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
</body>
<script type="text/javascript">

function back(){
	$("#right_main").load("../meeting/showMeetingDetail?meetingId=${meetingId }");
}

function addBusiness(){
	$("#businessList").show();
}

function config(businessId,meetingId){
	$.ajax({
		url:"${ctx}/UIYouyiBackstage/business/addMeetingBusiness",
		type:"post",
		data:{
			"businessId":businessId,
			"meetingId":meetingId
			},
		dataType:"json",
		success:function(res){
			if(res.code == 1){
				alert("添加成功！");
				//$("#right_main").load("${ctx}/UIYouyiBackstage/business/showMeetingBusiness?meetingId="+meetingId);
				$("#businessList").show();
			}
		},
		error:function(){
			hideImg();
			alert("添加失败，请重试");
			$("#submit").attr("disabled", false);
		}
	})
};

function remove(businessId,meetingId){
	$.ajax({
		url:"${ctx}/UIYouyiBackstage/business/delMeetingBusiness",
		type:"post",
		data:{
			"businessId":businessId,
			"meetingId":meetingId
			},
		dataType:"json",
		success:function(res){
			if(res.code == 1){
				alert("移除成功！");
				$("#right_main").load("${ctx}/UIYouyiBackstage/business/showMeetingBusiness?meetingId="+meetingId);
				//$("#businessList").show();
			}
		},
		error:function(){
			hideImg();
			alert("移除失败，请重试");
			$("#submit").attr("disabled", false);
		}
	})
};

function check(){
	var companyName = $("#companyName").val();
	$.ajax({
		url:"${ctx}/UIYouyiBackstage/business/selectBusinessByName",
		type:"post",
		data:{
			"companyName":companyName,
			"pageNo":1,
			"pageSize":1000
			},
		dataType:"json",
		success:function(res){
			if(res.code == 1){
				var company=res.content.result;
				if(company.length==0){
					alert("暂无商户信息");
				}else{
					$("#companyContent").empty();
					for(var i=0;i<company.length;i++){
						var business=company[i];
						var $str=getStr(business);
						$("#companyContent").append($str);
					}
					$("#companyContent").append("共有商户：" + result.content.totalNum);
				}			}
		},
		error:function(){
			hideImg();
			alert("查询失败，请重试");
			$("#submit").attr("disabled", false);
		}
	})
};

function getStr(business){
	var str='<tr>'+
	'<td>'+business.company+'</td>'+
	'<td align="center">'+
	'<button class="btn green addItem"'+
		'onClick="config('+business.businessId+',${meetingId} )">添加</button>'+
    '</td></tr>';
 var $str=$(str);
 return $str;
}
</script>
</html>