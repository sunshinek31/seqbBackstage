function uploadPic() {
			$.ajaxFileUpload({
				url : "http://localhost:8080/backstage/uploadController/upload",
				secureuri : false,
				fileElementId : 'fileToUpload',
				dataType : 'text',
				success : function(data, status) {
					$("#showPicture").attr("src", data);
					$("#picture").val(data);
					alert(data);
				},
				error : function(data, status, e) {
					plus.nativeUI.toast(data);
				}
			});
			return false;
		}

		function selectPic() {
			$("#fileToUpload").click();
		}
		$("#advisorList").click(function(){
			$("#mainContent").html("<p>1234</p>");
		}),
		$(document)
		.ready(
				function() {

							$("#repwd").blur(function() {
								$("#warning_2").html("");
								$("#warning_3").html("");
								var pwd = $("#pwd").val();
								var repwd = $("#repwd").val();
								if (pwd != repwd) {
									$("#warning_2").html("两次密码输入不一致");
									$("#warning_3").html("两次密码输入不一致");
								}
							}),
							
							$("#submit1")
									.click(
											function() {
												var ok = true;
												var phoneNumber = $(
														"#phoneNumber")
														.val();
												//alert(1);
												$("#warning_1").html("");
												$
														.ajax({
															url : "http://localhost:8080/backstage/advisor/checkLoginByPhone",
															type : "get",
															async : false,
															data : {
																"phoneNumber" : phoneNumber
															},
															dataType : "json",
															success : function(
																	result) {
																if (result.code == 1) {
																	ok = false;
																	$(
																			"#warning_4")
																			.html(
																					"该手机号已注册");
																} else {
																	ok = true;
																}
															},
															error : function() {
																alert("系统异常！");
															}
														});
												var advisorName = $(
														"#advisorName")
														.val();
												var pwd = $("#pwd").val();
												var repwd = $("#repwd")
														.val();
												var phoneNumber = $(
														"#phoneNumber")
														.val();
												var picture = $(
														"#picture")
														.val();
												alert(picture);
												if (advisorName == "") {
													ok = false;
													$("#warning_1").html(
															"用户名不能为空");
												}
												if (pwd == "") {
													ok = false;
													$("#warning_2").html(
															"密码不能为空");
												}
												if (repwd == "") {
													ok = false;
													$("#warning_3").html(
															"密码不能为空");
												}
												if (phoneNumber == "") {
													ok = false;
													$("#warning_4").html(
															"手机号码不能为空");
												}
												if (ok) {
													$
															.ajax({
																url : "http://localhost:8080/backstage/base/advisoryGroupController/addAdvisor",
																type : "post",

																data : {
																	"advisorName" : advisorName,
																	"password" : pwd,
																	"phoneNumber" : phoneNumber,
																	"picture" : picture
																},
																dataType : "json",
																success : function(
																		result) {
																	if (result.code == 1) {
																		alert("注册成功！")
																	}
																},
																error : function() {

																}
															})
												}
											})

				});