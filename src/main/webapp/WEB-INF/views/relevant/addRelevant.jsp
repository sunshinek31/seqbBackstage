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
						class="caption-subject font-dark sbold uppercase">添加事项</span>
				</div>
			</div>
			<div class="portlet-body form" id="txy4">
				<form class="form-horizontal" id="addRelevantForm" role="form"
					enctype="mutipart/form-data" method="post" accept-charset="utf-8"
					onsubmit="document.charset='utf-8';">
					<div class="form-body"></div>
					<div class="form-group" style="display: none;">
						<label class="col-md-3 control-label">会议id</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="meetingId"
								name="meetingId" value="">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">事项</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="addmatter"
								name="addmatter">
						</div>
					</div>

					<div class="form-actions" style="">
						<div class="row">
							<div class="col-md-offset-3 col-md-5">
								<span class="btn btn-primary btn-lg green"
									onclick="back(${meetingId });"
									style="margin-top: 20px;">返回</span>&nbsp;&nbsp;&nbsp; <span
									class="btn btn-primary btn-lg green"
									onclick="submit(${meetingId })" style="margin-top: 20px;">确定</span>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function back(meetingId){
	$("#right_main").load("showMeetingDetail?meetingId=" + meetingId);	
};

function submit(meetingId){
	var addmatter = $("#addmatter").val();
	if(addmatter==''){
		alert('请完善信息');
		return;
	}
	$.ajax({
		url:"${ctx}/UIYouyiBackstage/relevant/addOrUpdateRelevant",
		type:"post",
		data:{
			  "matter":addmatter,
			  "meetingId":meetingId
			 },
		dataType:"json",
		success:function(result){
			if(result.code==1){
				alert("添加成功");
				back(meetingId);	
			}else{
				alert('添加失败');
			}
		},
		error:function(){
			alert("系统异常");					
		}
	})
	
};
</script>
</html>