<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<!-- BEGIN HEAD -->

<head>
<meta charset="utf-8" />
<title>软考题库资源管理平台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- BEGIN THEME GLOBAL STYLES -->
<link href="css/components-rounded.min.css" rel="stylesheet" id="style_components" type="text/css">
<link href="css/plugins.min.css" rel="stylesheet" type="text/css">
<!-- END THEME GLOBAL STYLES -->

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="css/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN PAGE LEVEL PLUGINS -->
<!-- <link href="css/jquery.gritter.css" rel="stylesheet" type="text/css"/> -->
<link href="css/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
<link href="css/morris.css" rel="stylesheet" type="text/css" />
<link href="css/fullcalendar.css" rel="stylesheet" type="text/css" />
<link href="css/jqvmap.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->

<!-- start file-input -->
<link href="css/jquery.fileupload.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css" />
<!-- end file-input -->

<!-- BEGIN PAGE STYLES -->
<!-- <link href="css/tasks.css" rel="stylesheet" type="text/css"/> -->
<!-- END PAGE STYLES -->
<link href="css/select2.min.css" rel="stylesheet" type="text/css" />
<link href="css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- start date-picket -->
<link href="css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />
<link href="css/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
<!-- end date-picket -->

<!-- start table_css -->
<link href="css/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="css/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<!-- end table_css -->

<!-- BEGIN THEME LAYOUT STYLES -->
<link href="css/layout.min.css" rel="stylesheet" type="text/css" />
<link href="css/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="css/custom.min.css" rel="stylesheet" type="text/css" />
<!-- END THEME LAYOUT STYLES -->

<link href="css/jquery.page.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="img/favicon.ico">

<link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=0AlVGXIuhGTFvBZdm0Tj17v1"></script>

<!-- END THEME LAYOUT STYLES -->
<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white" ng-app="backstage" id="backstage" ng-controller="mainController">
	<!-- BEGIN HEADER -->
	<div class="page-header navbar navbar-fixed-top">
		<!-- BEGIN HEADER INNER -->
		<div class="page-header-inner ">
			<!-- BEGIN LOGO -->
			<div class="page-logo" id="topLog">
				<a href="main" style="height:100%;margin:0 auto;"> <img src="img/logo_s.png" class="logo-default" style="margin:0 0;height:100%;" />
				</a>
				<div class="menu-toggler sidebar-toggler"></div>
			</div>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<div class="top-menu">
				
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END HEADER INNER -->
	</div>
	<!-- END HEADER -->
	<!-- BEGIN HEADER & CONTENT DIVIDER -->
	<div class="clearfix"></div>
	<!-- END HEADER & CONTENT DIVIDER -->
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar-wrapper">
			<!-- BEGIN SIDEBAR -->
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<div id="list_one">
				<div class="page-sidebar navbar-collapse collapse">
					<!-- BEGIN SIDEBAR MENU -->
					<ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 8px">
						<!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
						<li class="sidebar-toggler-wrapper hide">
							<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
							<div class="sidebar-toggler"></div>
							<!-- END SIDEBAR TOGGLER BUTTON -->
						</li>
						<!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
						<li class="sidebar-search-bordered">
							<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
							<!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
							<!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
							<div id="calendarMain" class="sidebar-search-bordered sidebar-search-solid" style="font-size:20px;text-align: center;color:white;">
								<span id="year"></span>
								&nbsp;-&nbsp;
								<span id="month"></span>
								&nbsp;-&nbsp;
								<span id="day"></span>
							</div>
							<!-- END RESPONSIVE QUICK SEARCH FORM -->
						</li>
						<li id="overview" class="nav-item start active">
							<a id="overviewPage" href="javascript:;" class="nav-link nav-toggle"> <i class="icon-home"></i> <span class="title">总览</span> <span id="selectedSpan" class="selected"></span>
							</a>
						</li>
						
						<li class="nav-item  ">
							<a id="promotion" href="javascript:;" class="nav-link nav-toggle"> <i class="icon-paper-plane"></i> <span class="title">软考中级</span> <span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li class="nav-item  ">
									<a href="#" class="nav-link " id="promotionList"> <span class="title">软件设计师</span>
									</a>
								</li>

							</ul>
						</li>
						
					</ul>
					<!-- END SIDEBAR MENU -->
				</div>
			</div>
			
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div id="right_main" class="page-content" ui-view></div>
			<div id="bufferImg">
				<img src="img/circle1.jpg">
			</div>
		</div>
		<!-- END CONTENT -->
		  
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="page-footer">
		<div class="page-footer-inner">
			2017 © SUNSHINEK31 
		</div>
		<div class="scroll-to-top" style="display: block;">
			<i class="icon-arrow-up"></i>
		</div>
	</div>
	<!-- END FOOTER -->
	<!--[if lt IE 9]>
	<!-- BEGIN CORE PLUGINS -->
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="js/jquery.page.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/js.cookie.min.js" type="text/javascript"></script>
	<script src="js/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
	<script src="js/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="js/jquery.blockui.min.js" type="text/javascript"></script>
	<script src="js/jquery.uniform.min.js" type="text/javascript"></script>
	<script src="js/bootstrap-switch.min.js" type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="js/bootstrap-colorpicker.js" type="text/javascript"></script>
	<script src="js/jquery.minicolors.min.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN THEME GLOBAL SCRIPTS -->
	<script src="js/app.js" type="text/javascript"></script>
	<!-- END THEME GLOBAL SCRIPTS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="js/components-color-pickers.min.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<!-- BEGIN THEME LAYOUT SCRIPTS -->
	<script src="js/layout.min.js" type="text/javascript"></script>
	<script src="js/demo.min.js" type="text/javascript"></script>
	<script src="js/quick-sidebar.min.js" type="text/javascript"></script>
	<script src="js/moment.min.js" type="text/javascript"></script>
	<script src="js/highcharts.js" type="text/javascript"></script>
	<script src="js/ajaxfileupload.js" type="text/javascript"></script>
	<script src="js/sockjs-0.3.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui.min.js" type="text/javascript"></script>

	<!--  -->
	<script src="js/select2.full.js" type="text/javascript"></script>
	<script src="js/components-select2.js" type="text/javascript"></script>
	<script src="js/bootstrap-datepicker.js" type="text/javascript"></script>
	<script src="js/bootstrap-datepicker.zh-CN.min.js" type="text/javascript"></script>
	<script src="js/bootstrap-datetimepicker.js" type="text/javascript"></script>
	<!--  -->

	<!-- start table_js -->
	<script src="js/datatable.js" type="text/javascript"></script>
	<script src="js/datatables.min.js" type="text/javascript"></script>
	<script src="js/datatables.bootstrap.js" type="text/javascript"></script>
	<!-- end table_js -->

	<!-- start angular -->
	<script src="angularJs/angular.js"></script>
	<script src="angularJs/angular-animate.js"></script>
	<script src="angularJs/angular-ui-router.js"></script>
    <script src="angularJs/angular-cookies.js"></script>
	<script src="angularJs/angularRoute.js"></script>
	<script type="text/javascript" src="angularJs/angularCommon.js"></script>
	<!-- end angular -->

	<script src="http://app.cloopen.com/im50/MD5.min.js" type="text/javascript"></script>
	<script src="http://app.cloopen.com/im50/base64.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		
		$(".sub-menu .nav-item").click(function() {
			console.log("click---nav-item");
			$("ul li ul li").removeClass("active");
			$(".nav-item").removeClass("active");
			$("#selectedSpan").remove();
			$(this).parent().parent().addClass("active");
			$(this).parent().parent().children(".nav-link").append("<span id='selectedSpan' class='selected'></span>");
		});
	</script>
	<!-- END THEME LAYOUT SCRIPTS -->
	
</body>

</html>