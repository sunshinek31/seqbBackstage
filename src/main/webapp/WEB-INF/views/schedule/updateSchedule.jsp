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
			<div class="portlet-title" style="position: relative;">
				<div class="caption">
					<i class="icon-settings font-dark"></i> <span
						class="caption-subject font-dark sbold uppercase">更新日程</span>
				</div>
			</div>
			<div class="portlet-body form" id="txy4">
				<form class="form-horizontal" id="updateItemForm" role="form"
					enctype="mutipart/form-data" method="post" accept-charset="utf-8"
					onsubmit="document.charset='utf-8';">

					<div class="form-group" style="display: none;">
						<label class="col-md-3 control-label">日程id</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="scheduleId" name="scheduleId"
								value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">标题</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="scheduletitle"
								name="scheduletitle" value="${schedule.title }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">开始时间</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="beginTime"
								name="beginTime" value="${schedule.beginTime }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">结束时间</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="endTime"
								name="endTime" value="${schedule.endTime }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">是否直播</label>
						<div class="col-md-5">
							是<input type="radio" name="needLive"  ${schedule.needLive==0 ? 'checked="checked"':'' } value="0"> 
							否<input type="radio" name="needLive"  ${schedule.needLive==1 ? 'checked="checked"':'' } value="1">
						</div>
					</div>

			<div class="form-actions">
				<div class="row">
					<div class="col-md-offset-3 col-md-5">
						<input type="button" class="btn btn-primary btn-lg green"
							value="返回" onclick="back('${schedule.meetingId }');" style="margin-top: 20px;">&nbsp;&nbsp;&nbsp;

						<input type="button" class="btn btn-primary btn-lg green"
							value="更新" id="submit" style="margin-top: 20px;"
							onclick="updateSchedule('${schedule.scheduleId }','${schedule.meetingId }')">
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
	$("#right_main").load("showMeetingDetail?meetingId=" + meetingId);
}


function updateSchedule(scheduleId,meetingId){
	var scheduletitle = $("#scheduletitle").val();
	var beginTime = $("#beginTime").val();
	var endTime = $("#endTime").val();
	var needLive = $('input[name="needLive"]:checked').val();
	if(title==''||beginTime==''||endTime==''){
		alert('请完善信息');
		return;
	}
	$.ajax({
				url : "${ctx}/UIYouyiBackstage/schedule/updateSchedule",
				type : "post",
				data : {
					"title":scheduletitle,
					"beginTime":beginTime,
					"endTime":endTime,
					"needLive":needLive,
					"scheduleId":scheduleId
				},
				dataType : "json",
				success : function(res) {
					if (res.code == 1) {
						back(meetingId);
					} else {
						alert(res.info);
					}
				},
				error : function() {

				}
			})
}

/* $("input[name='needLive']").on('click',function(){
        if($('input[name="needLive"]:checked').val() == $(schedule.needLive )){
        	input[name="needLive"].checked= true;
        }
}) */
</script>
</html>