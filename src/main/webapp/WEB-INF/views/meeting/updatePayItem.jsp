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
						class="caption-subject font-dark sbold uppercase">更新支付信息</span>
				</div>
			</div>
			<div class="portlet-body form" id="txy4">
				<form class="form-horizontal" id="updateItemForm" role="form"
					enctype="mutipart/form-data" method="post" accept-charset="utf-8"
					onsubmit="document.charset='utf-8';">

					<div class="form-group" style="display: none;">
						<label class="col-md-3 control-label">会议id</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="uid" name="uid"
								value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">金额</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="payItemPrice"
								name="payItemPrice" value="${payItemVO.payItemPrice }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">用途和说明</label>
						<div class="col-md-5">
							<input type="text" class="form-control" id="payItemInfo"
								name="payItemInfo" value="${payItemVO.payItemInfo }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">支付类型</label>
						<div class="col-md-5">
							<select id="payItemType" name="payItemType"
									class="form-control pull-left" style="width: 120px;margin:0 5px;">
									<option value="${payItemVO.payItemType }">状态选择 </option>
									<option value="1" >注册费</option>
									<option value="2" >交通费 </option>
									<option value="3" >住宿费</option>
								</select> 
						</div>
					</div>

			<div class="form-actions">
				<div class="row">
					<div class="col-md-offset-3 col-md-5">
						<input type="button" class="btn btn-primary btn-lg green"
							value="返回" onclick="back('${payItemVO.meetingId }');" style="margin-top: 20px;">&nbsp;&nbsp;&nbsp;

						<input type="button" class="btn btn-primary btn-lg green"
							value="更新" id="submit" style="margin-top: 20px;"
							onclick="updatePayItem('${payItemVO.uid }','${payItemVO.meetingId }')">
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

function updatePayItem(uid,meetingId){
	var payItemPrice = $("#payItemPrice").val();
	var payItemInfo = $("#payItemInfo").val();
	var payItemType = $("#payItemType option:selected").val();
	if(payItemType==''||payItemPrice==''||payItemInfo==''){
		alert('请完善信息');
		return;
	}
	$.ajax({
				url : "${ctx}/UIYouyiBackstage/meeting/updatePayItem",
				type : "post",
				data : {
					"payItemPrice":payItemPrice,
					"payItemInfo":payItemInfo,
					"payItemType":payItemType,
					"uid":uid
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