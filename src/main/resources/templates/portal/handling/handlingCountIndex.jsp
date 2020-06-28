<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugin/bootstrap/bootstrap.min.css">
	<style>
	body{
		width: 100%;
		overflow: hidden;
		background-size: cover;
        background-repeat: no-repeat;
        background-color: 
	}
	 *{
            margin: 0;
            padding: 0;
        }
	.main{
		padding-top:20px;
		width: 100%;
        height: 100%;
        position: absolute;
	}
	.quarter-div{
		width: 50%;
        height: 50%;
        float: left;
        border:1px solid #000
     }
</style>
</head>
<body>
	<div class="main">
		<div>
			<label>选择月份</label>
			<select>
				<option value="1">1月</option>
				<option value="2">2月</option>
				<option value="3">3月</option>
				<option value="4">4月</option>
				<option value="5">5月</o ption>
				<option value="6">6月</option>
				<option value="7">7月</option>
				<option value="8">8月</option>
				<option value="9">9月</option>
				<option value="10">10月</option>
				<option value="11">11月</option>
				<option value="12">12月</option>
			</select>
		</div>
		<div class="quarter-div" id= "echarts-line">
		
		</div>
		<div class="quarter-div" id= "echarts-line-caseType">
									
		</div>
		<div class="quarter-div" id= "echarts-line-personType">
		
		</div>
		<div class="quarter-div" id= "echarts-line-caseling" style="overflow-y:auto;">
									
		</div>
	</div>
</body>
<script src="<%=request.getContextPath()%>/plugin/jquery-2.1.3.min.js"></script>
<script src="<%=request.getContextPath()%>/plugin/echarts/echarts.min.js"></script>
<script src="<%=request.getContextPath()%>/plugin/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript">

//报警统计
var yearCount = 16;
var categoryCount = 12;

var xAxisData = ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'];
var customData = [];
var legendData = ['','未进行安全检查','SOS求助','未进行吸毒检测','未进行物品暂存','攀高','未进行信息采集','心率异常','手环低电量','进入非法系统','超时未出区','无人看管','单人询问\讯问','同案聚集','手环被恶意破坏拆除','非法脱离办案区域','报警总数'];
var dataList = [];

legendData.push('trend');
var encodeY = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
for (var i = 0; i < yearCount; i++) {
    dataList.push([]);
}

for (var i = 0; i < categoryCount; i++) {
    var val = Math.random() * 1000;
    var customVal = [i];
    customData.push(customVal);

    for (var j = 0; j < dataList.length; j++) {
        var value = j === 0
            ? echarts.number.round(val, 2)
            : echarts.number.round(Math.max(0, dataList[j - 1][i] + (Math.random() - 0.5) * 200), 2);
        dataList[j].push(value);
        customVal.push(value);
    }
}

function renderItem(params, api) {
    var xValue = api.value(0);
    var currentSeriesIndices = api.currentSeriesIndices();
    var barLayout = api.barLayout({
        barGap: '30%', barCategoryGap: '20%', count: currentSeriesIndices.length - 1
    });

    var points = [];
    for (var i = 0; i < currentSeriesIndices.length; i++) {
        var seriesIndex = currentSeriesIndices[i];
        if (seriesIndex !== params.seriesIndex) {
            var point = api.coord([xValue, api.value(seriesIndex)]);
            point[0] += barLayout[i - 1].offsetCenter;
            point[1] -= 20;
            points.push(point);
        }
    }
    var style = api.style({
        stroke: api.visual('color'),
        fill: null
    });

    return {
        type: 'polyline',
        shape: {
            points: points
        },
        style: style
    };
}
$(function(){
	optionLine = {
		title: {
	        text: '案件数据',
	        left:'center'   
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data: legendData
	    },
	    dataZoom: [{
	        type: 'slider',
	        start: 50,
	        end: 70
	    }, {
	        type: 'inside',
	        start: 50,
	        end: 70
	    }],
	    xAxis: {
	        data: xAxisData
	    },
	    yAxis: {},
	    series: [{
	        type: 'custom',
	        name: 'trend',
	        renderItem: renderItem,
	        itemStyle: {
	            borderWidth: 2
	        },
	        encode: {
	            x: 0,
	            y: encodeY
	        },
	        data: customData,
	        z: 100
	    }].concat(echarts.util.map(dataList, function (data, index) {
	        return {
	            type: 'bar',
	            animation: false,
	            name: legendData[index + 1],
	            itemStyle: {
	                opacity: 0.5
	            },
	            data: data
	        };
	    }))
	};
	optionCaseType = {
	title: {
        text: '办案类型',
        left:'center'   
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '8%',
        containLabel: true
    },
    xAxis: [
        {
            type: 'category',
            data: ['刑事', '空案件', '行政', '执行', '海事海商纠纷', '赔偿', '民事','经济','知识产权','合计']
        }
    ],
    yAxis: [
        {
            type: 'value'
        }
    ],
    series: [
        {
            name: '案件数量',
            data: [120, 200, 150, 80, 70, 110, 130, 130, 130, 130],
	        type: 'bar',
	        itemStyle: {
	            normal: {
	                color: function(params) {
	                    var colorList = ['#c23531','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83', '#ca8622','#91c7ae','#2f4554','#c23531'];
	                    return colorList[params.dataIndex]
	                }
	            }
	        }
        }
    ]
};
		
	optionLinePerson = {
	    title: {
	        text: '人员类型',
	        left: 'center',
	    },
	    tooltip: {
	        trigger: 'item'
	    },
	    legend: {
	        bottom: 10,
	        left: 'center',
	        data: ['残疾人', '正常','未成年']
	    },
	    series: [
	        {
	            type: 'pie',
	            radius: '70%',
	            center: ['50%', '55%'],
	            selectedMode: 'single',
	            emphasis: {
	                itemStyle: {
	                    shadowBlur: 10,
	                    shadowOffsetX: 0,
	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	                }
	            },
	            data: [{value:1,name:'残疾人'},{value:1,name:'正常'},{value:5,name:'未成年'},]
	        }
	    ]
	};
	
	optionCaseling = {
		title: {
	        text: '案件原由',
	        left: 'center',
	    },	
	    tooltip: {
	        trigger: 'axis',
	        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
	            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    legend: {
	    	bottom: 10,
	        left: 'center',
	        data: ['直接访问']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '8%',
	        containLabel: true
	    },
	    xAxis: [
	        {
	            type: 'category',
	            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日','周一', '周二', '周三', '周四', '周五', '周六', '周日','周一', '周二', '周三', '周四', '周五', '周六', '周日','周一', '周二', '周三', '周四', '周五', '周六', '周日']
	        }
	    ],
	    yAxis: [
	        {
	            type: 'value'
	        }
	    ],
	    series: [
	        {
	            name: '直接访问',
	            type: 'bar',
	            data: [320, 332, 301, 334, 390, 330, 320,320, 332, 301, 334, 390, 330, 320,320, 332, 301, 334, 390, 330, 320,320, 332, 301, 334, 390, 330, 320],
	            itemStyle: {
		            normal: {
		                color: function(params) {
		                    var colorList = ['#c23531','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83', '#ca8622','#c23531','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83', '#ca8622','#c23531','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83', '#ca8622','#c23531','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83', '#ca8622'];
		                    return colorList[params.dataIndex]
		                }
		            }
		        }
	        }
	    ]
	};

	var echartsLine = echarts.init(document.getElementById('echarts-line'));
	var echartsLineCaseType = echarts.init(document.getElementById('echarts-line-caseType'));
	var echartsLinePersonType = echarts.init(document.getElementById('echarts-line-personType'));
	var echartsLineCaseling = echarts.init(document.getElementById('echarts-line-caseling'));
	echartsLine.setOption(optionLine);
	echartsLineCaseType.setOption(optionCaseType);
	echartsLinePersonType.setOption(optionLinePerson);
	echartsLineCaseling.setOption(optionCaseling);
	//handlingCountMonth();
})
</script>
<script type="text/javascript">
function handlingCountMonth(){
	$.ajax({
		url:requestLawappBasePath+"/handling/handlingCountMonth", 
		type:"post",
		dataType:"json",
		async:false,
		success:function(data){
			alert(data)
		},
		error:function(){
			console.log('调用当前接口出错！');
		}
	});
}
</script>
<%@include file="/WEB-INF/views/common/psles-footer.jsp"%>
