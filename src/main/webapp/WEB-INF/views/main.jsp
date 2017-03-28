<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.5
Version: 4.5.2
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>优爱优医管理平台</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="${ctx}/UIYouyiBackstage/css/fonts.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/UIYouyiBackstage/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/UIYouyiBackstage/css/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/UIYouyiBackstage/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/UIYouyiBackstage/css/uniform.default.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/UIYouyiBackstage/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="${ctx}/UIYouyiBackstage/css/colorpicker.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/UIYouyiBackstage/css/jquery.minicolors.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="${ctx}/UIYouyiBackstage/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="${ctx}/UIYouyiBackstage/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="${ctx}/UIYouyiBackstage/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/UIYouyiBackstage/css/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="${ctx}/UIYouyiBackstage/css/custom.min.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=0AlVGXIuhGTFvBZdm0Tj17v1"></script>
        <style type="text/css">
        .footer {
		    width: 100%;
		    height: 30px;
		    float: left;
		    position: absolute;
		    bottom: 0;
		    padding-left: 50px;
		}
		#topLog{			
			text-align:center;			
		}
		#bufferImg{
			position:fixed;
			top:4%;
			left:12%;
			display:none;
			width:2000px;
			height:2000px;
			background-color: #111;
			opacity:0.4;
			z-index: 9998;
		}
		#bufferImg img{
			margin:0 auto;
			position: absolute;
			top:20%;
			left:30%;
		}
		.warning{
			color:red;
  		}
		</style>
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
    <!-- END HEAD -->
	<script type="text/javascript">
		function showImg(){
			$("#bufferImg").show();
		}
		function hideImg(){
			$("#bufferImg").hide();
		}
		//取消冒泡事件
		function stopBubbling(e){
			if (e && e.stopPropagation ){
	            e.stopPropagation();
	    } else{       //否则，我们需要使用IE的方式来取消事件冒泡
	     window.event.cancelBubble = true;
	    }
		}
	</script>
    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md">
        <!-- BEGIN HEADER -->
        <div class="page-header navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo" id="topLog">
                    <a href="main" style="height:100%;margin:0 auto;">
                        <img src="img/LOGO1.png" class="logo-default" style="margin:0 0;height:100%;"/> </a>
                    <div class="menu-toggler sidebar-toggler"> </div>
                </div>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN TOP NAVIGATION MENU -->
                <div class="top-menu">
                    <ul class="nav navbar-nav pull-right">
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        <li class="dropdown dropdown-user">
                            <%-- <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <img alt="" class="img-circle" src="http://etosnurnke7xfjgj-uihome-upload-img.oss-cn-hangzhou.aliyuncs.com/1461137370648.jpg" />
                                <span class="username username-hide-on-mobile"> <shiro:principal/>   </span>
                                <i class="fa fa-angle-down"></i>
                            </a> --%>
                            <ul class="dropdown-menu dropdown-menu-default">
                                <li>
                                    <a href="page_user_profile_1.html">
                                        <i class="icon-user"></i> My Profile </a>
                                </li>
                                <li>
                                    <a href="app_calendar.html">
                                        <i class="icon-calendar"></i> My Calendar </a>
                                </li>
                                <li>
                                    <a href="app_inbox.html">
                                        <i class="icon-envelope-open"></i> My Inbox
                                        <!-- <span class="badge badge-danger"> 0 </span> -->
                                    </a>
                                </li>
                                <li class="divider"> </li>
                                <li>
                                    <a href="page_user_lock_1.html">
                                        <i class="icon-lock"></i> Lock Screen </a>
                                </li>
                                <li>
                                    <a href="page_user_login_1.html">
                                        <i class="icon-key"></i> Log Out </a>
                                </li>
                            </ul>
                        </li>
                        <!-- END USER LOGIN DROPDOWN -->
                        <!-- BEGIN QUICK SIDEBAR TOGGLER -->
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        <li class="dropdown dropdown-quick-sidebar-toggler">
                            <a href="javascript:;" class="dropdown-toggle">
                                <i class="icon-logout"></i>
                            </a>
                        </li>
                        <!-- END QUICK SIDEBAR TOGGLER -->
                    </ul>
                </div>
                <!-- END TOP NAVIGATION MENU -->
            </div>
            <!-- END HEADER INNER -->
        </div>
        <!-- END HEADER -->
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->
            <div class="page-sidebar-wrapper">
                <!-- BEGIN SIDEBAR -->
                <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                <div class="page-sidebar navbar-collapse collapse">
                    <!-- BEGIN SIDEBAR MENU -->
                    <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
                    <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
                    <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
                    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                    <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
                    <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                    <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 8px">
                        <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
                        <li class="sidebar-toggler-wrapper hide">
                            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                            <div class="sidebar-toggler">

							</div>
                            <!-- END SIDEBAR TOGGLER BUTTON -->
                        </li>
                        <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
                        <li class="sidebar-search-bordered">
                            <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                            <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
                            <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
                            <div id="calendarMain" class="sidebar-search-bordered sidebar-search-solid" style="font-size:20px;text-align: center;color:white;">
                            	<span id="year"></span>&nbsp;-&nbsp;<span id="month"></span>&nbsp;-&nbsp;<span id="day"></span>
                            </div>
                            <!-- END RESPONSIVE QUICK SEARCH FORM -->
                        </li>
                       
                        <li id="addMeeting" class="nav-item">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="icon-home"></i>
                                <span class="title" >添加会议</span>
                                <i class="icon-plus"></i>
                            </a>
                              
                                <li id="addArea" class="nav-item  "  style="display:none">
	                                    <span id="add" style="padding:6px 15px 6px 55px" class="nav-link">
	                                        <span class="title"><input type="text" id="title" style="width:5em" name="title"><button id="addTitle">添加</button></span>
	                                    </span>
                                </li>
                        </li>
                        
                        <li class="nav-item  active">
                            <a id="meetingManage" href="javascript:;" class="nav-link nav-toggle">
                                <i class="fa fa-heart-o"></i>
                                <span class="title">会议管理</span>
                                <span class="arrow open"></span>
                            </a>
                           
                            <ul class="sub-menu">
                            	<c:forEach items="${meetingList }" var ="meeting" varStatus="status">
                            		<li class="nav-item  ">
	                                    <a id="${meeting.meetingId }" href="#" class="nav-link meetingList">
	                                        <span class="title">${meeting.title }</span>
	                                    </a>
	                                </li>
                            	</c:forEach>
                            </ul>
                        </li> 
                        
                        <li id="businessManage" class="nav-item">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="icon-home"></i>
                                <span class="title" >参展商</span>
                            </a>
                        </li>
                        </ul>
                    <!-- END SIDEBAR MENU -->
                    <!-- END SIDEBAR MENU -->
                </div>
                <!-- END SIDEBAR -->
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
            	<div id="right_main" class="page-content">
			   	 	
            	</div>
            	<div id="bufferImg">
            		<img src="img/circle1.jpg">
           		 </div>
            </div>
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <!-- END FOOTER -->
        <!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->      
        <script src="${ctx}/UIYouyiBackstage/js/jquery.min.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/js.cookie.min.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="${ctx}/UIYouyiBackstage/js/bootstrap-colorpicker.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/jquery.minicolors.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="${ctx}/UIYouyiBackstage/js/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${ctx}/UIYouyiBackstage/js/components-color-pickers.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="${ctx}/UIYouyiBackstage/js/layout.min.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/demo.min.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/quick-sidebar.min.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/moment.min.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/highcharts.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/ajaxfileupload.js" type="text/javascript"></script>
        <script src="${ctx}/UIYouyiBackstage/js/sockjs-0.3.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        	$(window).load(function()
                {
        			showImg();
        			var date=new Date();
        			$("#year").html(date.getFullYear());
        			$("#month").html(date.getMonth()+1);
        			$("#day").html(date.getDate());
		        	$("#right_main").load("overview",hideImg());
                });
                
             $(".meetingList").on("click",function(){
             	//showImg();
        		/* $("ul li ul li").removeClass("active");
        		$("#hospitalList").parent().addClass("active");
        		$("#selectedSpan").parent().parent().removeClass("active");
  	        	$("#selectedSpan").remove(); */
  	    		$("#right_main").load("showMeetingDetail?meetingId=" + this.id,hideImg());	    		
  	    		/* $("#hospitalList").parent().addClass("active"); */
  	    		/* this.append("<span id='selectedSpan' class='selected'></span>"); */
             })
              $("#businessManage").on("click",function(){
             	//showImg();
  	    		$("#right_main").load("../business/showBusinessList");	    		
             }) 
             $("#addMeeting").on("click",function(){
            	 $("#addArea").toggle(500);
             })
            $("#addTitle").on("click",function(){
            	 $.post(
         				"${ctx}/UIYouyiBackstage/meeting/addMeeting",
         				{  
         					title:$("#title").val()
         					
         				},
         				function(data){	
         					if(data['code']==1){
         						location.reload();
         					}else{
         						alert("添加失败，请重试");
         					}
         				}
         				
         		).success(function(){hideImg();}).error(function(){hideImg();alert("系统异常！");});
             })
             
        </script>
        <!-- END THEME LAYOUT SCRIPTS -->
        <script type="text/javascript">  
	        /* if (!window.WebSocket) { 
	            alert("WebSocket not supported by this browser!"); 
	        }

	        function connect() { 
                //var valueLabel = document.getElementById("valueLabel"); 
                //valueLabel.innerHTML = ""; 
                ws=new WebSocket("ws://test.uimama.net/UIYouyiBackstage/websocket"); 
                //监听消息
                ws.onmessage = function(event) { 
                    //valueLabel.innerHTML+ = event.data; 
                    alert(event.data);
                }; 
                // 打开WebSocket 
                ws.onclose = function(event) { 
                  //WebSocket Status:: Socket Closed
                	alert('连接关闭');
                }; 
                // 打开WebSocket
                ws.onopen = function(event) { 
                   //WebSocket Status:: Socket Open
                    //// 发送一个初始化消息
                    ws.send("register"); 
                }; 
                ws.onerror =function(event){
                	alert('连接服务器失败');
                    //WebSocket Status:: Error was reported
                };
            }
	        
	        connect(); */
	    </script> 
    </body>

</html>