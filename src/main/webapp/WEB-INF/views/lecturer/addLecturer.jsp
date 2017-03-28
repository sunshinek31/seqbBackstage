<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						class="caption-subject font-dark sbold uppercase">添加讲师</span>
				</div>
			</div>
			<div class="portlet-body form" id="txy4">
				<form class="form-horizontal" id="addLecturerForm" role="form"
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
						<label class="col-md-3 control-label">姓名</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="addname"
								name="addname">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">职称</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="position"
								name="position">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">所属单位</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="company"
								name="company">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label" style="text-align: right;">头像
							&nbsp;</label>
						<div class="col-md-5">
							<form id='upload' enctype="multipart/form-data" method="post">
								<input type="file" name="fileToUpload" id="fileToUpload" onchange="uploadPic()" style="display: none">
							</form>
							<span class="btn btn-default" id="selectPic" name="selectPic" onclick="selectPic()">选择文件</span>
							<img alt="" src="" id="showPicture" style="width: 80px;">
							<input id="picture" style="" value="">
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
}

function submit(meetingId){
	var addname = $("#addname").val();
	var position = $("#position").val();
	var company = $("#company").val();
	var picture = $("#picture").val();
	if(addname==''||position==''||company==''){
		alert('请完善信息');
		return;
	}
	$.ajax({
		url:"${ctx}/UIYouyiBackstage/lecturer/addOrUpdateLecturer",
		type:"post",
		data:{
			  "name":addname,
			  "position":position,
			  "company":company,
			  "picture":picture,
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
	
}

function uploadPic() {
	$.ajaxFileUpload({
		url : "${ctx}/UIYouyiBackstage/uploadController/upload",
		secureuri : false,
		fileElementId : 'fileToUpload',
		dataType : 'text',
		success : function(data, status) {
			$("#showPicture").attr("src", data);
			$("#picture").val(data);
		},
		error : function(data, status, e) {
			plus.nativeUI.toast(data);
		}
	});
	return false;
}

function selectPic() {
	$("#fileToUpload").click();
};


</script>
</html>