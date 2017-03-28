<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${ctx}/UIYouyiBackstage/skin/default/laydate.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/UIYouyiBackstage/need/laydate.css" rel="stylesheet"
	type="text/css" />
<script src="${ctx}/UIYouyiBackstage/js/laydate.dev.js"
	type="text/javascript"></script>
</head>
<body>
<div class="col-md-10" id="form" style="overflow: auto; height: 800px;">
		<!-- BEGIN SAMPLE FORM PORTLET-->
		<div class="portlet light bordered">
			<div class="portlet-title" style="position: relative;">
				<div class="caption">
					<i class="icon-settings font-dark"></i> <span
						class="caption-subject font-dark sbold uppercase">更新会议信息</span>
				</div>
			</div>
			<div class="portlet-body form" id="txy4">
				<form class="form-horizontal" id="updateItemForm" role="form"
					enctype="mutipart/form-data" method="post" accept-charset="utf-8"
					onsubmit="document.charset='utf-8';">

					<div class="form-group" style="display: none;">
						<label class="col-md-3 control-label">会议id</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="meetingId" name="meetingId"
								value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">标题</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="uptitle"
								name="uptitle" value="${meeting.title }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">副标题</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="subtitle"
								name="subtitle" value="${meeting.subtitle }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">简介</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="introduction"
								name="introduction" value="${meeting.introduction }">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label">报名地址</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="registerAddress"
								name="registerAddress" value="${meeting.registerAddress }">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label">会议地址</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="address"
								name="address" value="${meeting.address }">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">会议开始时间</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="beginDate"
								name="beginDate" value="${meeting.beginDate }" onClick="laydate()" >
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label">会议结束时间</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="endDate"
								name="endDate" value="${meeting.endDate }" onClick="laydate()" >
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label">报名截止时间</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="enrollDeadline"
								name="enrollDeadline" value="${meeting.enrollDeadline }" onClick="laydate()">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label">报到开始时间</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="regBeginTime"
								name="regBeginTime" value="${meeting.regBeginTime }" >
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label">报到结束时间</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="regEndTime"
								name="regEndTime" value="${meeting.regEndTime }" >
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label" style="text-align: right;">修改会议封面(建议200*200)
							&nbsp;</label>
						<div class="col-md-5" style="padding: 0 9px;">
							<input type="file" class="btn btn-default" id="pictureFile" 
							name="pictureFile" value="选择文件" onchange="uploadMeetingpicture()"> 
						    <img alt="" src="${meeting.picture }" id="meetingImg" style="width: 80px;"> 
						    <input id="showMeetingPicture" style="display: none" value="">
						    <input id="picture" value="${meeting.picture }">
						</div>
					</div>
					
			<div class="form-actions">
				<div class="row">
					<div class="col-md-offset-3 col-md-5">
						<input type="button" class="btn btn-primary btn-lg green"
							value="返回" onclick="back();" style="margin-top: 20px;">&nbsp;&nbsp;&nbsp;

						<input type="button" class="btn btn-primary btn-lg green"
							value="更新" id="submit" style="margin-top: 20px;"
							onclick="updateMeeting(${meetingId})">
							</div>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function back() {
	$("#right_main").load("../meeting/showMeetingDetail?meetingId=${meetingId }");
}

function updateMeeting(meetingId){
	var uptitle = $("#uptitle").val();
	var subtitle = $("#subtitle").val();
	var introduction = $("#introduction").val();
	var registerAddress = $("#registerAddress").val();
	var address = $("#address").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var enrollDeadline = $("#enrollDeadline").val();
	var picture = $("#picture").val();
	var regBeginTime = $("#regBeginTime").val();
	var regEndTime = $("#regEndTime").val();
	
	$.ajax({
				url : "${ctx}/UIYouyiBackstage/meeting/updateMeeting",
				type : "post",
				data : {
					"title":uptitle,
					"subtitle":subtitle,
					"introduction":introduction,
					"registerAddress":registerAddress,
					"address":address,
					"beginDate":beginDate,
					"endDate":endDate,
					"enrollDeadline":enrollDeadline,
					"picture":picture,
					"regBeginTime":regBeginTime,
					"regEndTime":regEndTime,
					"meetingId":meetingId
				},
				dataType : "json",
				success : function(res) {
					if (res.code == 1) {
						back();
					} else {
						alert(res.info);
					}
				},
				error : function() {

				}
			})
}


function uploadPic(targetElementId, handle) {

	$.ajaxFileUpload({
		url : "${ctx}/UIYouyiBackstage/uploadController/upload",
		secureuri : false,
		fileElementId : targetElementId,
		dataType : 'text',
		success : function(data, status) {
			handle(data);
		},
		error : function(data, status, e) {
			plus.nativeUI.toast(data);
		}
	});
}

function uploadMeetingpicture(){
	uploadPic('pictureFile', function(data) {
		$("#meetingImg").attr("src",data);
		$("#picture").attr("value",data);
	})
}
</script>
</html>