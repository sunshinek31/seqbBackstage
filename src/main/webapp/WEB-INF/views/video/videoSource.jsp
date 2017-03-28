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
		</div>
	</div>

	<div id="videoContent" style="margin-top: 20px">
				<input type="text" id="vodId" name="vodId" value="${schedule.scheduleVideoSource.vodId }" style="display: none;">
				<table id="videoTable"
					class="table table-hover  table-bordered table-striped"
					style="margin-bottom: 0px; table-layout: fixed;">
					<thead>
						<tr>
						    <td width="100">链接地址</td>
							<td text-align='center' width="330px">操作</td>
						</tr>
					</thead>
						<tr>
							<td><input type="text" id="videoSource" name="videoSource" value="${schedule.scheduleVideoSource.videoSource }"> </td>
							<td>
								<input class="btn green" style="width: 90px;" value="修改" onclick='addOrUpdate(${scheduleId })'/>
								<input class="btn green" style="width: 90px;" value="删除" onclick="del(${schedule.scheduleVideoSource.vodId });"/>
							</td>
						</tr>
				</table>
	</div>

</body>
<script type="text/javascript">

function back(){
	$("#right_main").load("../meeting/showMeetingDetail?meetingId=${meetingId }");
}



function del(vodId){
	if(confirm("确定删除该资源吗？")){
		$.post(
				"${ctx}/UIYouyiBackstage/video/delVideo?vodId="+vodId,
				function(data){
					if(data['code']==1){
						alert("删除成功");
						back();
					}else{
						alert("删除失败，请重试");
					}
				}
		);
	}
};

function addOrUpdate(scheduleId){
	var vodId = $("#vodId").val();
	var videoSource = $("#videoSource").val();

	$.ajax({
		url:"${ctx}/UIYouyiBackstage/video/addOrUpdateVideo",
		type:"post",
		data:{
			"vodId":vodId,
			"scheduleId":scheduleId,
			"videoSource":videoSource},
		dataType:"json",
		success:function(result){
			if(result.code==1){
			alert("修改成功");
						back();
					}else{
						alert("删除失败，请重试");
					}
		},
		error:function(){
			hideImg();
			alert("系统异常");
		}
	})
}

</script>
</html>
