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
			<li><span>${schedule.title }</span></li>
		</ul>
		<div class="page-toolbar">
			<button class="pull-right tooltips btn green" onclick="back()">
				返回上一级</button>
			<button id="showMnForm" class="pull-right tooltips btn green">
				添加资源</button>
		</div>
	</div>

	<%-- <div id="videoContent" style="margin-top: 20px">
		<c:choose>
			<c:when test="${!empty videoList }"> --%>
				<table id="videoTable"
					class="table table-hover  table-bordered table-striped"
					style="margin-bottom: 0px; table-layout: fixed;">
					<thead>
						<tr>
						    <td width="100">链接地址</td>
							<td text-align='center' width="330px">操作</td>
						</tr>
					</thead>
					<%-- <c:forEach var="video" items="${videoList }" varStatus="status"> --%>
					<c:if test="${schedule.scheduleVideoSource.vodId != null }">
						<tr>
							<td>${schedule.scheduleVideoSource.videoSource }</td>
							<td>
								<input class="btn green" style="width: 90px;" value="修改" onclick='update(${schedule.scheduleVideoSource.vodId })'/>
								<input class="btn green" style="width: 90px;" value="删除" onclick="del(${schedule.scheduleVideoSource.vodId });"/>
							</td>
						</tr>
					</c:if>

					<%-- </c:forEach> --%>
				</table>
			<%-- </c:when>
			<c:otherwise>
				暂无资源信息
		</c:otherwise>

		</c:choose> --%>
	</div>

	<div id="formArea" style="margin-top: 20px; display: none">
		<form id="videoForm">
			<input id="vodId" type="text" name="vodId" style="display: none">
			<input id="scheduleId" type="text" name="scheduleId" style="display: none">
			<table class="table table-hover  table-bordered table-striped">
				<tr>
					<td>资源地址</td>
					<td><input type="text" id="videoSource" name="videoSource"></td>
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
$("#showMnForm").on("click",function(){
	$("#vodId").val('');
	$("#videoSource").val('');
	$("#scheduleId").val('');
	$("#videoContent").hide(500);
	$("#formArea").show(500);
});
$("#back").on("click",function(){
	$("#videoContent").show(500);
	$("#formArea").hide(500);
})

function back(){
	$("#right_main").load("../meeting/showMeetingDetail?meetingId=${meetingId }");
}

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
    				"${ctx}/UIYouyiBackstage/video/addOrUpdateVideo?" + $("#videoForm").serialize(),
    				function(data){
    					if(data['code']==1){
    						alert("添加成功");
    						$("#right_main").load("${ctx}/UIYouyiBackstage/video/showVideo?scheduleId=${scheduleId}");
    					}else{
    						alert("添加失败，请重试");
    					}
    				}

    		).success(function(){hideImg();}).error(function(){hideImg();alert("系统异常！");});
    	});

function del(vodId){
	if(confirm("确定删除该资源吗？")){
		$.post(
				"${ctx}/UIYouyiBackstage/video/delVideo?vodId="+vodId,
				function(data){
					if(data['code']==1){
						$("#right_main").load("../video/showVideo");
					}else{
						alert("删除失败，请重试");
					}
				}
		);
	}
};

function update(vodId){
	showImg();
	$.ajax({
		url:"${ctx}/UIYouyiBackstage/video/queryVideoById",
		type:"get",
		data:{"vodId":vodId},
		dataType:"json",
		success:function(result){
			hideImg();
			var video=result.content;
			$("#videoContent").hide(500);
			$("#scheduleId").val(video.scheduleId);
			$("#vodId").val(video.vodId);
			$("#videoSource").val(video.videoSource);
			$("#formArea").show(500);
		},
		error:function(){
			hideImg();
			alert("系统异常");
		}
	})
	};
</script>
</html>