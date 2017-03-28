$(function(){
	$("#login").click(function(){
		//清除原有提示信息
		$("#count_span").html("");
		$("#password_span").html("");
		//获取请求提交数据
		var name = $("#count").val().trim();
		var password = $("#password").val().trim();
		//检测数据格式
		var ok = true;//表单是否通过检测
		if(name==""){
			ok = false;
			$("#count_span").html("用户名不能为空");
		}
		if(password==""){
			ok = false;
			$("#password_span").html("密码不能为空");
		}
		//通过检测发送ajax请求
		if(ok){
			//发送ajax
			$.ajax({
				url:"adviser/adviserController/checkLogin" +
						"",
				type:"post",
				data:{"userName":name,"password":password},
				dataType:"json",
				success:function(result){
					//成功处理
					if(result.code==0){//成功
						//将返回的用户ID写入Cookie
						var userId = result.content.uid;//用户ID
						addCookie("userId",userId,2);//写入,2小时有效
						window.location.href="baseLoginController/main#";
					}else if(result.code==1){//用户名错误
						$("#count_span").html(result.content);
					}else if(result.code==2){//密码错误
						$("#password_span").html(result.content);
					}
				},
				error:function(){
					//异常处理
					alert("登录异常");
				}
			});
		}
	});
});