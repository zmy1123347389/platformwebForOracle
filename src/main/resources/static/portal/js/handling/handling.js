$(function($) {
	var selectedNodeId = "";
	layui.use(['layer', 'form'], function() {
		showloading(false);
		
	    var pathTable = $("#table_data").DataTable({
	    	"order":[6,"desc"],//默认修改时间倒序
	        "serverSide": true,
	        "pagingType": "full_numbers",
	        "bLengthChange": false,
	        "bFilter": false,
	        "bProcessing":true,
	        "bScrollCollapse": false,
	        "fixedColumns":false,
	        "sScrollX":false,
	        "sScrollY":false,
	        "bAutoWidth": false,
	        "ajax" : {
	            "type"			: "post",
	            "dataType"		: "json",
	            "contentType"	: "application/x-www-form-urlencoded; charset=utf-8",
	            "url" 			:  requestPslesBasePath + "handling/getHandlingPage",
	            "data" 			: function ( d ) {
	            	var searchTime = $("input[name='searchTime']:checked").val();
	            	d.searchTime = searchTime;
	            	d.fullName = $("#fullName").val();
	            	var time = $("#time").val().split("-");
	            	if(!isEmpty(time)){
	            		d.dtStart = time[0]+"-"+time[1]+"-"+time[2];
	            		d.dtEnd = time[3]+"-"+time[4]+"-"+time[5];
	            	}
	            }
	        },
	        "oLanguage": {
	        	"sInfo": "从 _START_ 到 _END_  /  共 _TOTAL_ 条数据",
	        	"sEmptyTable": "暂无数据",
	        	"sInfoEmpty" : "记录数为0",
	        	"sProcessing" : "<img src='" + requestPslesBasePath + "/image/loading.gif'/>",
	        	"oPaginate": {
	        		"sFirst": "首页",
	        		"sNext": "下一页>>",
	        		"sLast": "末页",
	        		"sPrevious": "<<上一页"
	        	}
	        },
	        columns: [
	        	{"data": "ajbh","name":"AJBH","width": "100px",
	        		render: function (data, b, c, d) {
	        			if(!isEmpty(data)){
	        				var context = "<span class=\"lookAjbhInfo\">&nbsp;&nbsp;<font color=\"#44FFFF\"><button style=\"background-color: transparent;\">"+data+"</button></font>&nbsp;&nbsp;</span>";
	        				return context;
	        			}else{
	        				return "";
	        			}
	                }
	        	},
	        	{"data": "code","name":"CODE","width": "100px"},
	        	{"data": "fullName","name":"FULLNAME","width": "100px"},
	        	{"data": "type","name":"TYPE","width": "100px"},
	        	{"data": "name","name":"NAME","width": "100px"},
	        	{"data": "description","name":"DESCRIPTION","width": "100px"},
	        	{"data": "police","name":"POLICE","width": "100px"},
	            {"data": "phoneNum","name":"PHONENUM","width": "100px"},
	            {"data": "compulsoryMeasures","name":"COMPULSORYMEASURES","width": "150px"},
	            {"data": "dtStart","name":"DTSTART","width": "70px"},
	            {"data": "dtEnd","name":"DTEND","width": "140px"},
	            {"data": "iSue","name":"SUE","width": "70px"},
	            {
	                "orderable": false,
	                "data": "deviceId",
	                "width": "80px",
	                "unCriteria":true,
	                render: function (data, b, c, d) {
	                    var context = "<span class=\"lookInfo\">&nbsp;&nbsp;<font color=\"#44FFFF\"><button style=\"background-color: transparent;\">[详情]</button></font>&nbsp;&nbsp;</span>";
	                    return context;
	                }
	            }
	        ],
	        "fnDrawCallback": function( oSettings ) {
	        	$('.dataTables_scrollBody').css('overflow', '');
	        }
	    });
	    
	    //监听提交
	    layui.form.on('submit(formDemo)', function(data) {
			$("#queryPathData").on('click', loadUserTable(pathTable));
		    return false;
		});
	    
	    $("#queryReset").on('click', function () {
	    	tableReset(pathTable);
	    });
	    tableReset(pathTable);
	    loadUserTable(pathTable);
	    tableOperate(pathTable);
	});
	
	function tableReset(pathTable) {
    	selectedNodeId = "";
        $("#searchUnitId, #searchUnitName").val('');
        loadUserTable(pathTable);
	}
	
	function loadUserTable(pathTable) {
        if (pathTable) {
        	pathTable.ajax.reload();
        }
    }
	
	function tableOperate(pathTable) {
		var tableData = $('#table_data'); //表格元素
		// 查看案件详情
		tableData.on('click', '.lookInfo', function() {
			var _this = $(this);
			var code = pathTable.row(_this.parents('tr')).data().code;
			var layerWidth = $(top.window).width() - 150 - 1;
			var layerHeight = $(top.window).height() - 100;
			
			var url = requestPslesBasePath + 'handling/handlingDetailIndex?code=' + code;
			layer_show('查看办案详情', url, layerWidth, layerHeight, 'layerSeeDetail');
		});
		// 查看办案详情
		tableData.on('click', '.lookAjbhInfo', function() {
			//跳转详情页面
				var _this = $(this);
				var ajbh = pathTable.row(_this.parents('tr')).data().ajbh;
				//案件未受理
				/*if (null == ajbh || "" == ajbh) {
			    	if (obj.CJSJ != '0') {
			    		if (flag == '1') {
							alert("该警情未受理无案件信息！接警时间：" + _this.parents('tr')).data().JJSJ + "；处警时间：" + _this.parents('tr')).data().CJSJ + "；反馈：" + _this.parents('tr')).data().WARNFEED));
						} else {
							alert("该警情未受理无案件信息！接警时间：" + _this.parents('tr')).data().JJSJ + "；处警时间：" + _this.parents('tr')).data().CJSJ + "；反馈：" + _this.parents('tr')).data().OVERFEED));
						}
			    	} else {
			    		alert("该警情未受理无案件信息！接警时间：" + _this.parents('tr')).data().JJSJ + "；处警时间：无；反馈：" + _this.parents('tr')).data().OVERFEED);
			    	}
					return;
				}*/
				alert(ajbh)
				window.open(requestPslesBasePath + "lawCaseDetailIndex?caseNumber="+ ajbh);
		});
	}
	
	function showMsg(text, icon) {
		var mText = text == undefined ? '' : text;
		var mIcon = icon == undefined ? 2 : icon;
		top.layer.msg(mText, {
			icon: mIcon,
			time: 2000,
			shade: 0.2
		})
	}
	
	// 页面加载等待
	function showloading(t) {
		if (t) { //如果是true则显示loading
			loading = top.layer.load(0, {
				shade: [0.6, '#fff'] //0.6透明度的白色背景
			});
		} else { 
			//如果是false则关闭loading
			top.layer.closeAll('loading');
		}
	}
	
	function isEmpty(value){
		if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
			return true;
	    }else{
	    	//防止非字符串存在
	    	value += "";
	    	value = value.replace(/\s/g,"");
	        if(value == ""){
	            return true;
	        }
	        return false;
	    }
	}
	
	function layer_show(title, url, w, h, s) {
		if (title == null || title == '') {
			title = false;
		};
		if (url == null || url == '') {
			url = "404.html";
		};
		if (w == null || w == '') {
			w = 800;
		};
		if (h == null || h == '') {
			h = ($(top.window).height() - 50);
		};
		if (s == null || s == '') {
			s = 'popItem';
		}

		top.layer.open({
			type: 2,
			area: [w + 'px', h + 'px'],
			fix: false, //不固定
			// maxmin: true,
			shade: 0.4,
			title: title,
			skin: s,
			content: url
		});
	}
});