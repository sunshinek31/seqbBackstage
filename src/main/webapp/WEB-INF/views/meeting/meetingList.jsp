<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css" media="screen">
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,button,textarea,p,blockquote,th,td
	{
	margin: 0;
	padding: 0
}

fieldset,img {
	border: 0 none
}

:focus {
	outline: 0
}

.dis {
	display: block;
}

.undis {
	display: none;
}

ol,ul {
	list-style: none
}

.fr {
	display: inline;
	float: right !important
}

.fl {
	display: inline;
	float: left !important
}

.show {
	display: block
}

.hide {
	display: none
}

.highlight {
	color: #F30 !important
}

.important {
	font-weight: bold !important
}

.center {
	text-align: center !important
}

body {
	font: 12px/1.5 tahoma, sans-serif;
	color: #333
}

a {
	text-decoration: none;
	color: #333
}

a:hover {
	text-decoration: underline;
	color: #E30751
}

.nav_current {
	float: left;
	background: #FFF;
	color: #F00;
}

.nav_link {
	float: left;
}

.nav_current:hover,.nav_link:hover {
	color: #FF6600;
}

#dww-menu {
	overflow: hidden;
	border: 1px #dcdcdc solid;
}

#dww-menu .mod-hd {
	overflow: hidden;
	height: 30px;
	line-height: 30px;
	position: relative;
	background: #CCCCCC repeat-x 0 0
}

#dww-menu .mod-hd li {
	float: left;
	cursor: pointer;
	text-align: center;
	height: 30px;
	line-height: 30px;
	padding: 0 10px;
	letter-spacing: 1px;
	text-transform: uppercase;
	border-right: 1px #dcdcdc solid
}

#dww-menu .mod-hd li.hover {
	font-weight: 900;
	background: #FFF
}

#dww-menu .mod-bd {
	padding: 5px 10px
}

#dww-menu .mod-bd div {
	line-height: 24px
}

#dww-menu .mod-bd div.show {
	display: block
}

#dww-menu .mod-bd div a {
	display: inline-block;
	padding: 0 4px
}
</style>
<style>
</style>
<link href="${ctx}/UIYouyiBackstage/skin/default/laydate.css"
	rel="stylesheet" type="text/css" />
<link href="${ctx}/UIYouyiBackstage/need/laydate.css" rel="stylesheet"
	type="text/css" />
<script src="${ctx}/UIYouyiBackstage/js/laydate.dev.js"
	type="text/javascript"></script>

</head>
<body>
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><span>会议列表</span></li>
		</ul>
	</div>

	<div id="meetingContent" style="margin-top: 20px">
		<c:choose>
			<c:when test="${!empty meetingVO }">
				<table id="meetingTable"
					class="table table-hover  table-bordered table-striped"
					style="margin-bottom: 0px; table-layout: fixed;">
					<thead>
						<tr>
							<td style="min-width: 120px;">封面</td>
							<td style="min-width: 80px;">标题</td>
							<td >副标题</td>
							<td >简介</td>
							<td >报名地址</td>
							<td >会议地址</td>
							<td >报名截止时间</td>
							<td >报到开始时间</td>
							<td >报到结束时间</td>
							<td >会议开始时间</td>
							<td >会议结束时间</td>
							<td >报名人数</td>
							<td >会议状态</td>
							<td text-align='center' >操作</td>
						</tr>
					</thead>
					<tr>
						<td><img alt=""
							src="${meetingVO.picture }" style="width: 100px; height: 100px;"></td>
						<td>${meetingVO.title }</td>
						<td>${meetingVO.subtitle }</td>
						<td style="text-align: left;">${meetingVO.introduction }</td>
						<td>${meetingVO.registerAddress }</td>
						<td>${meetingVO.address }</td>
						<td>${meetingVO.enrollDeadline }</td>
						<td>${meetingVO.regBeginTime }</td>
						<td>${meetingVO.regEndTime }</td>
						<td>${meetingVO.beginDate }</td>
						<td>${meetingVO.endDate }</td>
						<td>${account }</td>
						<td style="position: relative;">
						<c:if test="${meetingVO.status == 1 }">准备</c:if>
						<c:if test="${meetingVO.status == 2 }">发布</c:if>
						<c:if test="${meetingVO.status == 3 }">过期</c:if>
						<select style="position: absolute; right: 0px;" onchange="checkStatus('${meetingVO.status }');" id="status${meetingVO.status }">
								<option>修改</option>
								<option value="1">准备</option>
								<option value="2">发布</option>
								<option value="3">过期</option>
						</select>
						</td>
						<td>
						<button class="btn green" style="width: 90px;"
							onclick='update(${meetingVO.meetingId })'> 修改</button>
						<button class="btn green" style="width: 90px;"
							onclick="del(${meetingVO.meetingId });" >删除</button>
						<button class="btn green" style="width: 90px;"
							onclick="addMeetingBusiness(${meetingVO.meetingId });" >配置参展商</button>
					    <button class="btn green" style="width: 90px;"
							onclick="signList(${meetingVO.meetingId });" >与会人员</button>
						<button class="btn green" style="width: 90px;"
							onclick="liveList(${meetingVO.meetingId });" >直播资源</button>
						</td>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
				暂无直播信息
		</c:otherwise>

		</c:choose>
	</div>

	<div id="dww-menu" class="mod-tab" style="margin-top: 20px">
		<div class="mod-hd">
			<ul class="tab-nav">
				<li class="nav_current" id="nav1" onclick="javascript:doClick(this)">支付项目</li>
				<li class="nav_link" id="nav2" onclick="javascript:doClick(this)">会议日程</li>
				<li class="nav_link" id="nav3" onclick="javascript:doClick(this)">讲师</li>
				<li class="nav_link" id="nav4" onclick="javascript:doClick(this)">相关事项</li>
				<li class="nav_link" id="nav5" onclick="javascript:doClick(this)">与会人员</li>
				<li class="nav_link" id="nav6" onclick="javascript:doClick(this)">交通路线</li>
				<li class="nav_link" id="nav7" onclick="javascript:doClick(this)">其他细节</li>
			</ul>
		</div>
		<div class="mod-bd">
			<div class="dis" id="sub1">
				<div id="payItemContent" style="margin-top: 20px">
					<table id="payItemTable"
						class="table table-hover  table-bordered table-striped"
						style="margin-bottom: 0px; table-layout: fixed;">
						<thead>
							<tr>
								<td width="100">金额</td>
								<td>用途和说明</td>
								<td width="100">支付类型</td>
								<td text-align='center' width="440px"><input
									class="btn green" style="width: 100px;" value="添加支付项目"
									onclick="addPayItem(${meetingId });" /></td>
							</tr>
						</thead>
						<c:forEach var="payItem" items="${payItemList }"
							varStatus="status">
							<tr>
								<td>${payItem.payItemPrice }</td>
								<td>${payItem.payItemInfo }</td>
								<td><c:if test="${payItem.payItemType ==1 }">注册费</c:if> <c:if
										test="${payItem.payItemType ==2 }">交通费</c:if> <c:if
										test="${payItem.payItemType ==3 }">住宿费</c:if></td>
								<td><input class="btn green" style="width: 90px;"
									value="修改" onclick="updatePayItem(${payItem.uid });" /> <input
									class="btn green" style="width: 90px;" value="删除"
									onclick="delPayItem(${payItem.uid });" /></td>
							</tr>
						</c:forEach>
					</table>

				</div>
			</div>

			<div class="undis" id="sub2">
				<div id="scheduleContent" style="margin-top: 20px">
					<table id="scheduleTable"
						class="table table-hover  table-bordered table-striped"
						style="margin-bottom: 0px; table-layout: fixed;">
						<thead>
							<tr>
								<td width="100">标题</td>
								<td width="100">讲师</td>
								<td width="100">是否直播</td>
								<td width="100">开始时间</td>
								<td width="100">结束时间</td>
								<td text-align='center' width="440px"><input
									class="btn green" style="width: 100px;" value="添加日程"
									onclick="addschedule(${meetingId });" /></td>
							</tr>
						</thead>
						<c:forEach var="schedule" items="${scheduleList }"
							varStatus="status">
							<tr>
								<td>${schedule.title }</td>
								<td>${schedule.lecturerName }</td>
								<td><c:if test="${schedule.needLive ==0 }">是</c:if> <c:if
										test="${schedule.needLive ==1 }">否</c:if></td>
								<td>${schedule.beginTime }</td>
								<td>${schedule.endTime }</td>
								<td><input class="btn green" style="width: 90px;"
									value="修改" onclick="updateSchedule(${schedule.scheduleId });" />
									<input class="btn green" style="width: 90px;" value="删除"
									onclick="delSchedule(${schedule.scheduleId });" /> <input
									class="btn green" style="width: 90px;" value="分配讲师"
									onclick="addLecture('${schedule.scheduleId }','${schedule.meetingId }');" />
									<c:if test="${schedule.scheduleVideoSource.vodId == null }">
										<button class="btn green" style="width: 90px;"
										onclick="configScheduleVideoSource('${schedule.scheduleId }');" >配置视频流</button>
									</c:if>
									<c:if test="${schedule.scheduleVideoSource.vodId != null }">
										<button class="btn green" style="width: 90px;"
										onclick="updateScheduleVideoSource('${schedule.scheduleId }');" >修改视频流</button>
									</c:if>
									</td>
							</tr>
						</c:forEach>
					</table>

				</div>
			</div>
			<div class="undis" id="sub3">
				<div id="lecturerContent" style="margin-top: 20px">
					<table id="lecturerTable"
						class="table table-hover  table-bordered table-striped"
						style="margin-bottom: 0px; table-layout: fixed;">
						<thead>
							<tr>
								<td width="100">头像</td>
								<td width="100">姓名</td>
								<td width="100">职称</td>
								<td width="100">所属单位</td>
								<td text-align='center' width="440px"><input
									class="btn green" style="width: 100px;" value="添加讲师"
									onclick="addlecturer(${meetingId });" /></td>
							</tr>
						</thead>
						<c:forEach var="lecturer" items="${lecturerList }"
							varStatus="status">
							<tr>
								<td width="100" height="100"><img alt=""
									src="${lecturer.picture }" style="width: 100px; height: 100px;"></td>
								<td>${lecturer.name }</td>
								<td>${lecturer.position }</td>
								<td>${lecturer.company }</td>
								<td><input class="btn green" style="width: 90px;"
									value="修改" onclick="updateLecturer(${lecturer.lecturerId });" />
									<input class="btn green" style="width: 90px;" value="删除"
									onclick="delLecturer(${lecturer.lecturerId });" /></td>
							</tr>
						</c:forEach>
					</table>

				</div>
			</div>
			<div class="undis" id="sub4">
				<div id="RelevantContent" style="margin-top: 20px">
					<table id="TrafficTable"
						class="table table-hover  table-bordered table-striped"
						style="margin-bottom: 0px; table-layout: fixed;">
						<thead>
							<tr>
								<td width="100">序号</td>
								<td>相关事项</td>
								<td text-align='center' width="440px"><input
									class="btn green" style="width: 100px;" value="添加事项"
									onclick="addrelevant(${meetingId });" /></td>
							</tr>
						</thead>
						<c:forEach var="relevant" items="${relevantList }"
							varStatus="status">
							<tr>
								<td>${relevant.relevantId }</td>
								<td>${relevant.matter }</td>
								<td><input class="btn green" style="width: 90px;"
									value="修改" onclick="updateRelevant(${relevant.relevantId });" />
									<input class="btn green" style="width: 90px;" value="删除"
									onclick="delRelevant(${relevant.relevantId });" /></td>
							</tr>
						</c:forEach>
					</table>

				</div>
			</div>
			<div class="undis" id="sub5">
				<div id="PartContent" style="margin-top: 20px">
					<table id="TrafficTable"
						class="table table-hover  table-bordered table-striped"
						style="margin-bottom: 0px; table-layout: fixed;">
						<thead>
							<tr>
								<td width="100">序号</td>
								<td>与会人员</td>
								<td text-align='center' width="440px"><input
									class="btn green" style="width: 100px;" value="添加人员"
									onclick="addpart(${meetingId });" /></td>
							</tr>
						</thead>
						<c:forEach var="part" items="${partList }" varStatus="status">
							<tr>
								<td>${part.partId }</td>
								<td>${part.participants }</td>
								<td><input class="btn green" style="width: 90px;"
									value="修改" onclick="updatePart(${part.partId });" /> <input
									class="btn green" style="width: 90px;" value="删除"
									onclick="delPart(${part.partId });" /></td>
							</tr>
						</c:forEach>
					</table>

				</div>

			</div>
			<div class="undis" id="sub6">
				<div id="TrafficContent" style="margin-top: 20px">
					<table id="TrafficTable"
						class="table table-hover  table-bordered table-striped"
						style="margin-bottom: 0px; table-layout: fixed;">
						<thead>
							<tr>
								<td width="100">序号</td>
								<td>路线</td>
								<td text-align='center' width="440px"><input
									class="btn green" style="width: 100px;" value="添加路线"
									onclick="addtraffic(${meetingId });" /></td>
							</tr>
						</thead>
						<c:forEach var="traffic" items="${trafficList }"
							varStatus="status">
							<tr>
								<td>${traffic.trafficId }</td>
								<td>${traffic.route }</td>
								<td><input class="btn green" style="width: 90px;"
									value="修改" onclick="updateTraffic(${traffic.trafficId });" />
									<input class="btn green" style="width: 90px;" value="删除"
									onclick="delTraffic(${traffic.trafficId });" /></td>
							</tr>
						</c:forEach>
					</table>

				</div>
			</div>
			<div class="undis" id="sub7">暂无</div>
		</div>
	</div>




</body>
<script type="text/javascript">
function checkStatus(meetingId){
	var value1=$("#status"+meetingId+" option:checked").val();
	if(confirm("确定要修改会议状态为"+showStatus(value1)+"吗")){
		showImg();
		$.ajax({
			url:"${ctx}/UIYouyiBackstage/meeting/updateMeetingStatus",
			type:"post",
			data:{
				  "status":value1,
				  "meetingId":meetingId
				 },
			dataType:"json",
			success:function(result){
				hideImg();
				if(result.code==1){
					alert("修改成功");
					$("#right_main").load("showMeetingDetail?meetingId=" + meetingId);
				}else{
					alert('修改失败');
				}
			},
			error:function(){
				hideImg();
				alert("系统异常");
			}
		})
	}
};

function showStatus(i){
	if(i==1){
		return "准备";
	};
	if(i==2){
		return "发布";
	};
	if(i==3){
		return "过期";
	};
};

function del(meetingId){
	if(confirm("确定要删除此会议吗？")){
		$.post(
				"${ctx}/UIYouyiBackstage/meeting/deleteMeeting?meetingId="+meetingId,
				function(data){
					if(data['code']==1){
						$("#right_main").load("../meeting/showMeetingDetail?meetingId=${meetingId }");
					}else{
						alert("删除失败，请重试");
					}
				}
		);
	}
};

function delPayItem(uid){
	if(confirm("确定要删除此项目吗？")){
		$.post(
				"${ctx}/UIYouyiBackstage/meeting/deletePayItem?uid="+uid,
				function(data){
					if(data['code']==1){
						$("#right_main").load("../meeting/showMeetingDetail?meetingId=${meetingId }");
					}else{
						alert("删除失败，请重试");
					}
				}
		);
	}
};

function delLecturer(lecturerId){
	if(confirm("确定要删除此讲师吗？")){
		$.post(
				"${ctx}/UIYouyiBackstage/lecturer/delLecturer?lecturerId="+lecturerId,
				function(data){
					if(data['code']==1){
						$("#right_main").load("../meeting/showMeetingDetail?meetingId=${meetingId }");
					}else{
						alert("删除失败，请重试");
					}
				}
		);
	}
};

function delRelevant(relevantId){
	if(confirm("确定要删除此事项吗？")){
		$.post(
				"${ctx}/UIYouyiBackstage/relevant/delRelevant?relevantId="+relevantId,
				function(data){
					if(data['code']==1){
						$("#right_main").load("../meeting/showMeetingDetail?meetingId=${meetingId }");
					}else{
						alert("删除失败，请重试");
					}
				}
		);
	}
};

function delPart(partId){
	if(confirm("确定要删除这些与会人员吗？")){
		$.post(
				"${ctx}/UIYouyiBackstage/participants/delPart?partId="+partId,
				function(data){
					if(data['code']==1){
						$("#right_main").load("../meeting/showMeetingDetail?meetingId=${meetingId }");
					}else{
						alert("删除失败，请重试");
					}
				}
		);
	}
};

	function uploadPic(targetElementId, handle) {

		$.ajaxFileUpload({
			url : "uploadController/upload",
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

	function addPayItem(meetingId){
		$("#right_main").load("showAddPayItem?meetingId="+meetingId);
	};

	function updatePayItem(uid){
		$("#right_main").load("showUpdatePayItem?uid="+uid);
	};

	function doClick(o){
		//当前被中的对象设置css
		o.className="nav_current";
		var j;
		var id;
		var e;
		//遍历所有的页签，没有被选中的设置其没有被选中的css
		for(var i=1;i<=7;i++){ //i<7 多少个栏目就填多大值
		id ="nav"+i;
		j = document.getElementById(id);
		e = document.getElementById("sub"+i);
		if(id != o.id){
		j.className="nav_link";
		e.style.display = "none";
		}else{
		e.style.display = "block";
		}
	}
};

function delSchedule(scheduleId){
	if(confirm("确定要删除此日程吗？")){
		$.post(
				"${ctx}/UIYouyiBackstage/schedule/deleteSchedule?scheduleId="+scheduleId,
				function(data){
					if(data['code']==1){
						$("#right_main").load("../meeting/showMeetingDetail?meetingId=${meetingId }");
					}else{
						alert("删除失败，请重试");
					}
				}
		);
	}
};

function delTraffic(trafficId){
	if(confirm("确定要删除此路线吗？")){
		$.post(
				"${ctx}/UIYouyiBackstage/traffic/delTraffic?trafficId="+trafficId,
				function(data){
					if(data['code']==1){
						$("#right_main").load("../meeting/showMeetingDetail?meetingId=${meetingId }");
					}else{
						alert("删除失败，请重试");
					}
				}
		);
	}
};

function configScheduleVideoSource(scheduleId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/video/showScheduleVideoSource?meetingId=${meetingId }&scheduleId="+scheduleId);
}
function updateScheduleVideoSource(scheduleId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/video/showScheduleVideoSource?meetingId=${meetingId }&scheduleId="+scheduleId);
}

function update(meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/meeting/showUpdateMeeting?meetingId="+meetingId);
};

function updateSchedule(scheduleId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/schedule/showUpdateSchedule?scheduleId="+scheduleId);
};

function addschedule(meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/schedule/showAddSchedule?meetingId="+meetingId);
};

function addLecture(scheduleId,meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/schedule/showAddLecture?meetingId=${meetingId }&scheduleId="+scheduleId);
};

function addMeetingBusiness(meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/business/showMeetingBusiness?meetingId="+meetingId);
};

function addlecturer(meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/lecturer/showAddLecturer?meetingId="+meetingId);
};

function updateLecturer(lecturerId,meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/lecturer/showUpdateLecturer?meetingId=${meetingId }&lecturerId=" + lecturerId);
};

function addtraffic(meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/traffic/showAddTraffic?meetingId="+meetingId);
};

function updateTraffic(trafficId,meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/traffic/showUpdateTraffic?meetingId=${meetingId }&trafficId=" + trafficId);
};

function addrelevant(meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/relevant/showAddRelevant?meetingId="+meetingId);
};

function updateRelevant(relevantId,meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/relevant/showUpdateRelevant?meetingId=${meetingId }&relevantId=" + relevantId);
};

function addpart(meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/participants/showAddPart?meetingId="+meetingId);
};

function updatePart(partId,meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/participants/showUpdatePart?meetingId=${meetingId }&partId=" + partId);
};

function signList(meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/signup/showSignList?meetingId="+meetingId);
};

function liveList(meetingId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/live/showLive?meetingId="+meetingId);
};

function videoSource(scheduleId){
	$("#right_main").load("${ctx}/UIYouyiBackstage/video/showVideo?meetingId=${meetingId }&scheduleId="+scheduleId);
};
</script>
</html>