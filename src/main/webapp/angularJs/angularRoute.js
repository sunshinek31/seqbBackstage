var mainApp = angular.module('backstage',['ui.router']);
mainApp.run([ '$rootScope', '$window', '$location', '$log', '$templateCache', function($rootScope, $window, $location, $log, $templateCache) {

	var stateChangeSuccess = $rootScope.$on('$stateChangeSuccess', stateChangeSuccess);

	function stateChangeSuccess($rootScope) {
		$templateCache.removeAll();
	}

} ]);

mainApp.controller('mainController',function($scope, $state){

	$scope.search=function(){
		alert(1);
	}
	$scope.show = function(uiserf,param){
		$state.go(uiserf, {'param':JSON.stringify(param)});
	}
})
mainApp.config(function($stateProvider,$urlRouterProvider){

	$stateProvider.state("serviceItem",{
		url:"/serviceItem?param",
		templateUrl: function($stateParams){
			if($stateParams.param!=null){
				console.log($stateParams.param)
				return f("service/showServiceItemList",$stateParams.param);
			}else{
				console.log("stateParams has no param")
				return "service/showServiceItemList";
			}
		} ,
		cache:false
	}).state("techList",{
		url:"/technician",
		templateUrl:"technician/toLoadTechList"
	}).state("dTechnician",{
		url:"/dTechnician",
		templateUrl:"technician/showDoulaTechnicianList"
	}).state("technicianList",{
		url:"/technicianList?param",
		templateUrl: function($stateParams){
			if($stateParams.param!=null){
				console.log($stateParams.param)
				return f("technician/showTechnicianList",$stateParams.param);
			}else{
				console.log("stateParams has no param")
				return "technician/showTechnicianList";
			}
		} ,
		cache:false
	})
})

function f(url, param){
	//console.log('param:'+param.toString());
	param = JSON.parse(param);
	var urlParam="";
	if(param!=null&&param!=""&&param!='null'){
		urlParam+="?";
		for (var key in param) {
			 if (param.hasOwnProperty(key)) {
				 if(param[key]!=null){
					 urlParam+=key+"="+param[key]+"&";
				 }
			 }
			}
		urlParam = urlParam.substring(0,urlParam.length-1);
	}
	return url+urlParam;
}