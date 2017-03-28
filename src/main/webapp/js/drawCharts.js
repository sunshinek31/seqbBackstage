$(function () {
	function getSum(i,list){
		var sum=0;
		for(var j=0;j<=i;j++){
			sum+=Number(list[j].sum);
		}
		return sum;
	}
	$.ajax({
		url:"/backstage/statistic",
		type:"get",
		success:function(result){
			var map=result.content;
			var users=map.users;
			var techs=map.techs;
			var orders=map.orders;
			var advisors=map.advisors;
			var data=
			{
			        title: {
			            text: '',
			            x: -20 //center
			        },
			        xAxis: {
			            categories: []
			        },
			        yAxis: { 
			            title: {
			                text: ''
			            },
			            plotLines: [{
			                value: 0,
			                width: 1,
			                color: '#808080'
			            }]
			        },
			        legend: {
			            layout: 'vertical',
			            align: 'right',
			            verticalAlign: 'middle',
			            borderWidth: 0
			        },
			        series: [{
			            name: '用户',
			            data: []
			        }, {
			            name: '技师',
			            data: []
			        }, {
			            name: '顾问',
			            data: []
			        }, {
			            name: '订单',
			            data: []
			        }]
			    }
			for(var i=0;i<users.length;i++){
				data.xAxis.categories[i]=users[i].months;
				data.series[0].data[i]=getSum(i,users);
				data.series[1].data[i]=getSum(i,techs);
				data.series[2].data[i]=getSum(i,advisors);
				data.series[3].data[i]=getSum(i,orders);
			}
		    $('#myChart').highcharts(data);	 
		},
		error:function(){
			alert("系统异常！");
		}
	})
	
});