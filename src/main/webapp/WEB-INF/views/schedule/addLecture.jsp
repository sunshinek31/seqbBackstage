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
<div class="col-md-10" id="form" style="overflow: auto;height:800px;">
		<!-- BEGIN SAMPLE FORM PORTLET-->
		<div class="portlet light bordered">
			<div class="portlet-title" style="position: relative;">
				<div class="caption">
					<i class="icon-settings font-dark"></i> <span
						class="caption-subject font-dark sbold uppercase">分配技师</span>
				</div>
			</div>
			<div class="portlet-body form" id="txy4">
				<form class="form-horizontal" id="addDoulaForm" role="form"
					enctype="mutipart/form-data" method="post" accept-charset="utf-8"
					onsubmit="document.charset='utf-8';">

					<div class="form-group">
						<label class="col-md-3 control-label">讲师</label>
						<div class="col-md-5">
							<select name="lecturerId" id="lecturerId" class="form-control"
										style="width: 150px; ">
										<option>==请选择讲师==</option>
										<c:forEach items="${lectureList }" var="lecture">
											<option value="${lecture.lecturerId }">${lecture.name }</option>
										</c:forEach>
									</select>
						</div>
					</div>
			</div>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-offset-3 col-md-5">
						<input type="button" class="btn btn-primary btn-lg green"
							value="返回" onclick="back('${meetingId }');" style="margin-top:20px;">&nbsp;&nbsp;&nbsp;

						<input type="button" class="btn btn-primary btn-lg green"
							value="添加" id="submit" style="margin-top:20px;"
							onclick="addLecturer('${scheduleId }','${meetingId }')">


					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
function back(meetingId) {
	$("#right_main").load("showMeetingDetail?meetingId=" + meetingId);
}

function addLecturer(scheduleId,meetingId){
	var lecturerId=$("#lecturerId option:selected").val();
	$
			.ajax({//获取可配置某服务的技师列表
				url : "${ctx}/UIYouyiBackstage/schedule/addLecturer",
				type : "post",
				data : {
					"lecturerId" : lecturerId,
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

</script>
</html>