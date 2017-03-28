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
						class="caption-subject font-dark sbold uppercase">更新讲师信息</span>
				</div>
			</div>
			<div class="portlet-body form" id="txy4">
				<form class="form-horizontal" id="updateLecturerForm" role="form"
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
						<label class="col-md-3 control-label">姓名</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="upname"
								name="upname" value="${lectureVO.name }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">职称</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="position"
								name="position" value="${lectureVO.position }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">所属医院</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="company"
								name="company" value="${lectureVO.company }">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label" style="text-align: right;">修改讲师头像
							&nbsp;</label>
						<div class="col-md-5" style="padding: 0 9px;">
							<input type="file" class="btn btn-default" id="pictureFile" 
							name="pictureFile" value="选择文件" onchange="uploadLecturerpicture()"> 
						    <img alt="" src="${lectureVO.picture }" id="lecturerImg" style="width: 80px;"> 
						    <input id="showLecturerPicture" style="display: none" value="">
						    <input id="picture" value="${lectureVO.picture }">
						</div>
					</div>
					
			<div class="form-actions">
				<div class="row">
					<div class="col-md-offset-3 col-md-5">
						<input type="button" class="btn btn-primary btn-lg green"
							value="返回" onclick="back(${meetingId});" style="margin-top: 20px;">&nbsp;&nbsp;&nbsp;

						<input type="button" class="btn btn-primary btn-lg green"
							value="更新" id="submit" style="margin-top: 20px;"
							onclick="updatelecturer('${meetingId}','${lectureVO.lecturerId }')">
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

function updatelecturer(meetingId,lecturerId){
	var upname = $("#upname").val();
	var position = $("#position").val();
	var company = $("#company").val();
	var picture = $("#picture").val();
	if(upname==''||position==''||company==''||picture==''){
		alert('请完善信息');
		return;
	}
	$.ajax({
				url : "${ctx}/UIYouyiBackstage/lecturer/addOrUpdateLecturer",
				type : "post",
				data : {
					"name":upname,
					"position":position,
					"company":company,
					"picture":picture,
					"lecturerId":lecturerId
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

function uploadLecturerpicture(){
	uploadPic('pictureFile', function(data) {
		$("#lecturerImg").attr("src",data);
		$("#picture").attr("value",data);
	})
}
</script>
</html>