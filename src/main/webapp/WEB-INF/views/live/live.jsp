<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-md-10" id="form" style="overflow: auto; height: 800px;">
		<!-- BEGIN SAMPLE FORM PORTLET-->
		<div class="portlet light bordered">
			<div class="portlet-body form" id="txy4">
				<form class="form-horizontal" id="updateLiveForm" role="form"
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
						<label class="col-md-3 control-label">视频资源</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="videoSource"
								name="videoSource" value="${liveVO.videoSource }">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label">重播资源</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="reviewSource"
								name="reviewSource" value="${liveVO.reviewSource }">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-3 control-label">视频状态</label>
						<div class="col-md-5">
							未开始<input type="radio" name=liveStatus  ${liveVO.liveStatus==0 ? 'checked="checked"':'' } value="0"> 
							正在<input type="radio" name="liveStatus"  ${liveVO.liveStatus==1 ? 'checked="checked"':'' } value="1">
							结束<input type="radio" name="liveStatus"  ${liveVO.liveStatus==2 ? 'checked="checked"':'' } value="2">
							休息<input type="radio" name="liveStatus"  ${liveVO.liveStatus==3 ? 'checked="checked"':'' } value="3">
						</div>
					</div>
					
			<div class="form-actions">
				<div class="row">
					<div class="col-md-offset-3 col-md-5">
						<input type="button" class="btn btn-primary btn-lg green"
							value="返回" onclick="back(${meetingId});" style="margin-top: 20px;">&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn btn-primary btn-lg green" value="确定" id="submit" style="margin-top: 20px;"
							onclick="updatelive('${liveVO.meetingId}','${liveVO.liveId }')">
					</div>
				</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function back(meetingId) {
	$("#right_main").load("../meeting/showMeetingDetail?meetingId="+meetingId);
};

function updatelive(meetingId,liveId){
	var videoSource = $("#videoSource").val();
	var reviewSource = $("#reviewSource").val();
	var liveStatus = $('input[name="liveStatus"]:checked').val();
	if(liveId == null || liveId == ""){
	$.ajax({
				url : "${ctx}/UIYouyiBackstage/live/addLive",
				type : "post",
				data : {
					"videoSource":videoSource,
					"reviewSource":reviewSource,
					"liveStatus":liveStatus,
					"meetingId":meetingId
				},
				dataType : "json",
				success : function(res) {
					if (res.code == 1) {
						alert("添加成功");
						back(meetingId);
					} else {
						alert(res.info);
					}
				},
				error : function() {

				}
			})
}else{
	$.ajax({
		url : "${ctx}/UIYouyiBackstage/live/updateLive",
		type : "post",
		data : {
			"videoSource":videoSource,
			"reviewSource":reviewSource,
			"liveStatus":liveStatus,
			"meetingId":meetingId,
			"liveId":liveId
		},
		dataType : "json",
		success : function(res) {
			if (res.code == 1) {
				alert("修改成功");
				back(meetingId);
			} else {
				alert(res.info);
			}
		},
		error : function() {

		}
	})
}
};

</script>
</html>