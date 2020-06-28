<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/psles-taglib.jsp"%>
<%@include file="/WEB-INF/views/common/psles-header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/detail.css"/>
<style type="text/css">			
	*{
		margin: 0;
		padding: 0;
		border: 0px;
	}
	body{
		width: 100%;
		overflow: hidden;
		background: url(<%=request.getContextPath()%>/img/detail.jpg)no-repeat;
		background-size: 100% 100%;
	}
	h4{				
		font-weight: normal;
	}
	.caseInfo h4{
		font-size: 14px;
		margin-top: 2%;
	}
	.loadingWrap{    
	    position:fixed;    
	    top:0;    
	    left:0;    
	    width:100%;    
	    height:100%;    
	    z-index:300;    
	    background-image:url(<%=request.getContextPath()%>/image/loading.gif);    
	    background-repeat:no-repeat;    
	    background-position:center center;    
	    background-color:#000;    
	    background-color:rgba(0,0,0,0.5);     
	}  
	#suspectInfo tr{
		height: 16px;
	}
	.rightPart table {
    	font-size: 14px;
    }
	#suspectInfo td {
    		height: 4%;
	}
</style>
<link href="<%=request.getContextPath()%>/plugin/video/video-js.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/plugin/video/video.min.js"></script>     
<script src="<%=request.getContextPath()%>/plugin/video/videojs-flash.min.js"></script> 
<script src="<%=request.getContextPath()%>/plugin/video/videojs-ie8.min.js"></script>
<body onresize="changeDivHeight()">
		<div class="container">
			<div class="title">
				<img src="<%=request.getContextPath()%>/img/return.png" class="returnImg" onclick="returnBasic()"/>
				<h4>吴起公安局办案场所一体化平台----办案数据详情</h4>
			</div>
			<div class="maincontent">
				<div class="column">
					<div class="oneBlock">
						<div class="leftPart">
							<img src="<%=request.getContextPath()%>/image/ren.png" class="leftTopIcon">
							<div class="personType">
								<p class="suspect">嫌疑人</p>
								<p class="suspect">入区时间</p>
								<p class="suspect">出区时间</p>
							</div>
						</div>
						<div class="rightPart">	
						<table id="suspectInfo">
						</table>
					</div>
				</div>
				<div class="twoBlock">	
					<img src="<%=request.getContextPath()%>/image/juan.png" class="leftTopIcon">													
					<div class="folder">
						<img src="<%=request.getContextPath()%>/image/juanIcon.png" class="juanIcon">
						<div class="electronicFile">
							<p style="margin-left: -110px;" id="inquestArchiveEvidence"><font size="3.5"><span>电子台账</span>&emsp;&emsp;<span style="color:#44ffff;" id="inquestArchiveEvidenceCount">0</span>&nbsp;份</font></p>
						</div>
					</div>
				</div>
			</div>
			<div class="column">
				<div class="threeBlock">
					<div class="goodsCount" style="margin-left: 10%;">
						<div class="goodsconut">
							<span>入库总数</span>
							<span>调取总数</span>
							<span>移交总数</span>
						</div>
					</div>
					<div class="goodsList" style="margin-left: 10%;">
						<table border="1" cellspacing="0" class="caseGoodsList" id="caseGoodsList">
							<thead>
								<tr style="text-align:center;">
									<th width="100px">物品名称</th>
									<th width="40px">数量</th>
									<th width="80px">计量单位</th>
									<th width="80px">特征描述</th>
									<th width="100px">储物柜编号</th>
									<th width="80px">存放柜号</th>
									<th width="40px">状态</th>
									<th width="80px">是否涉案</th>
								</tr>
							</thead>
							<tbody>
							</tbody>							
						</table>
					</div>
					<img src="<%=request.getContextPath()%>/image/wu.png" class="leftTopIcon">
				</div>
				<div class="fourBlock">
					<p class="hearingRoom"><font size="3.5">审讯位置：<span id="policeName"></span></font></p>
					<div class="casePersonList">
						<table border="1" cellspacing="0" class="casePerson" id='inquestList' style="text-align: center;">
							<thead>
							<tr class="suspectInfoTitle">
								<th>姓名</th>
								<th>办案人员</th>
								<th>审讯室</th>
								<th>开始时间</th>
								<th>结束时间</th>
							</tr>		
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
					<img src="<%=request.getContextPath()%>/image/chang.png" class="leftTopIcon">
				</div>
			</div>
		</div>
		<div class="centerContent">
			<h4><font color='#44FFFF' size="5">办案基本信息</font></h4>	
			<p class="caseId"></p>	
			<table border="1" cellspacing="0" id="caseDetailInfo">
				
			</table>
			<div class="videoBtn" onclick="maskAppear()">已关联执法音视频</div>
			<!-- 
			<div class="videoBtn" ><a id="TDEruPlayer"  style="text-decoration:none;color:#44FFFF" href="">已关联执法音视频</a></div>
			 -->
			<div class="mask" onclick="closeMask()"></div>
			<div class="dialogBox">
				<h3 class="title"></h3>
				<img src="<%=request.getContextPath()%>/img/videoBg.png" class="videoBg"/>
				<img src="<%=request.getContextPath()%>/img/close.png" class="closeBtn" onclick="closeDialog()"/>
				<div class="videoArea">
					<div class="left">
						
					</div>
					<div class="right">
						<h5>已关联执法音视频</h5>
						<div id="lawVideo" class="videoList">
							
						</div>
						<div id="inquestVideo" class="videoList">
						
						</div>
<!-- 						<div id="110Video" class="videoList" onclick="videoPlay(3)"> -->
<!-- 							<h6 style="font-weight: normal;color:#566986 ;">110报警录音音频</h6> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
<script type="text/javascript">
		var ajdata = "";
		var body = document.querySelector("body")
		window.onload=function(){  
			changeDivHeight();  
		} 
		function changeDivHeight(){
			var h = document.documentElement.clientHeight;
			body.style.height = h + "px";
		}
		function returnBasic(){
			history.back(-1);
		}
		function maskAppear() {
			//执法音视频
			$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "lawenAudioVideo/getAllAudioVideoByPage",		       
		        data: {
		        	ajbh: ajdata.AJBH,
		        	length: 100
		        },
		        cache:false,
		        dataType: "json",
		        success: function (data, textStatus, jqXHR) {
		        	var videoArray = $("video");
					for (var i = 0;i < videoArray.length;i++) {
						var myPlayer = videojs($(videoArray[i]).attr("id"));
						myPlayer.dispose();
					}
		        	$('.dialogBox h3').text(ajdata.AJMC);
		        	if (data.aaData != null && data.aaData.length > 0) {
			        	var videoDiv = $('#lawVideo');
			    		var videoDom = "<h6 style=\"font-weight: normal;color:#566986 ;\">执法记录仪音视频</h6>";
		        		for (var i = 0;i < data.aaData.length;i++) {
		        			var sourceSrc = 'http://10.175.12.114:8081/lawVideoMp/' + data.aaData[i].UPLOAD_IP + '/docfile/' + data.aaData[i].DESTFILE_PATH.replace(/\\/g, "/");
// 				    		var sourceSrc = 'http://' + data.aaData[i].UPLOAD_IP + '/docfile/' + data.aaData[i].DESTFILE_PATH.replace(/\\/g, "/");
				    		videoDom += '<video id="videoId' + data.aaData[i].VIDEO_ID + '" class="video-js vjs-default-skin vjs-big-play-centered" style="object-fit:fill;width:100%;height:100%;margin-top:10px;" preload="auto" data-setup="{}">';
				    		videoDom += '<source id="sourceId' + data.aaData[i].VIDEO_ID + '" src="' + sourceSrc + '" type="video/mp4"/></video>';
				    		videoDiv.html(videoDom);
		        		}
		        		$('#lawVideo video').click(function () {
		        			videoPlay(this);
		        		});
		        	}
		        	$(".mask").css("display","block");
					$(".dialogBox").css("display","block");
		        },
		        error:function (data,textStatus) {   
		        	alert('请求后台失败！');
		        }
		 	});
		}
		
		//审讯视频
		function inquestVideo() {
			//ajax
			var videoDiv = $('#inquestVideo');
    		var videoDom = "<h6 style=\"font-weight: normal;color:#566986 ;\">审讯音视频</h6>";
		}
		
		function closeDialog(){
			$(".mask").css("display","none");
			$(".dialogBox").css("display","none");
			var videoArray = $("video");
			for (var i = 0;i < videoArray.length;i++) {
				var myPlayer = videojs($(videoArray[i]).attr("id"));
				myPlayer.dispose();
			}
		}
		
		function closeMask(){
			$(".mask").css("display","none");
			$(".dialogBox").css("display","none");
		}		
		
		function videoPlay(obj) {
			if ($('#videoTempId').length > 0) {
				var myPlayer = videojs('videoTempId');
				myPlayer.dispose();
			}
			var src = $(obj).children().attr('src')
    		var videoDom = '<video id="videoTempId" class="video-js vjs-default-skin vjs-big-play-centered" style="object-fit:fill;width:100%;height:100%;margin-top:10px;" controls="controls" preload="auto" data-setup="{}">';
    		videoDom += '<source id="sourceTempId" src="' + src + '" type="video/mp4"/></video>';
			$(".videoArea div[class=left]").html(videoDom);
		}
		
		var suspectArr = new Array(); //存放嫌疑人数组
		var victimArr = new Array();//存放受害人数组
		var witnessArr = new Array() //存放证人信息
		var suspectsub = 0; //嫌疑人下标 
		var victimsub = 0; //受害人下标 
		var witnesssub = 0;
		var persontype; //判断是嫌疑人还是受害人还是证人
		
		//获取嫌疑人信息
		function getSuspectInfo(){
			persontype = 0
			$(".suspect").css("color","#FFFFFF")
			$(".victim").css("color","#90a6b7")
			$(".witness").css("color","#90a6b7")
			getSuspectDetailInfo()	
		}
		//获取证人信息
		function getWitnessInfo(){
			$(".witness").css("color","#FFFFFF")
			$(".victim").css("color","#90a6b7")
			$(".suspect").css("color","#90a6b7")
			getWitnessDetailInfo()	
		}
		//上一人
		function getPrevPersonInfo(){			
			if (suspectsub > 0) {
				suspectsub = suspectsub - 1				
			}
			if(victimsub > 0){
				victimsub = victimsub - 1
			}
			if(witnesssub > 0){
				witnesssub = witnesssub - 1
			}
			if(persontype == 0){
				getSuspectDetailInfo(suspectArr[suspectsub])				
			}else if(persontype == 1){
				getVictimDetailInfo(victimArr[victimsub])
			}else{
				getWitnessDetailInfo(witnessArr[witnesssub])
			}
		}
		//下一人
		function getNextPersonInfo(){
			if (suspectsub < suspectArr.length - 1) { //如果下标小于数组的长度
				suspectsub = suspectsub + 1		//每次都加一		
			}
			if(victimsub < victimArr.length - 1){
				victimsub = victimsub + 1
			}	
			if(witnesssub < witnessArr.length - 1){
				witnesssub = witnesssub + 1
			}
			if(persontype == 0){ // 判断是不是嫌疑人
				getSuspectDetailInfo(suspectArr[suspectsub])//展示当前的嫌疑人的信息
			}else if(persontype == 1){
				getVictimDetailInfo(victimArr[victimsub])
			}else{
				getWitnessDetailInfo(witnessArr[witnesssub])
			}
		}
		$(function(){	
			getSuspectDetailInfo(suspectArr[suspectsub]);
			getCaseDetailInfo();
			/*getVictimDetailInfo(victimArr[victimsub])
			getWitnessDetailInfo(witnessArr[witnesssub])
			getSuspectDetailInformation();*/
			getLawWaring();
			getArticlesInvolved();
			getInquestList();
			getInquestArchiveEvidence();
			$(".videoBtn").html("<a style='text-decoration:none;color:#44FFFF' href='TDEruPlayer"+urlMsg.code+"://'>已关联执法音视频</a>")
		})
		
		//打开电子卷宗文书列表页面
		function  openInstrumentDetail() {
			var userId = "${userId}";
			window.open("http://92.1.76.21:8081/elarch-web/caseManage/redirectInstrumentDetail?flwsbh="+ ajdata.AJBH + "&&userId=" + userId);
		}
		
		//解析链接的方法
		function parseUrl(url){
		    if(url.indexOf("?") == -1) {
		        return {};
		    }
		    var query = url.split("?")[1];
		    var queryArr = query.split("&");
		    var obj = {};
		    queryArr.forEach(function(item){
		        var key = item.split("=")[0];
		        var value = item.split("=")[1];
		        obj[key] = decodeURIComponent(value);
		    });
		    return obj;
		}
		//获取列表页面传过来的url链接	
		var url = window.location.href;
		var urlMsg = parseUrl(url);//解析url，分割出需要的参数
		
		//获取案件超期提醒信息
		function getLawWaring() {
			if (null == urlMsg.type || "" == urlMsg.type) {
				return;
			}
			$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "lawproblem/caseDetailLawWarning",
		        data: {
		        	caseNum: urlMsg.caseNumber,
		        	type: urlMsg.type
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR) {
		        		console.dir(data);
		        	if(null != data && "" != data && data.aaData.length > 0) {
		        		var tips = "";
		        		if (urlMsg.type.indexOf('-') > -1) {
		        			var array = urlMsg.type.split('-');
		        			if (array[0] == '1' || array[0] == '2' || array[0] == '3') {
		        				if (array[1] == '1') {
		        					tips = "该警情" + data.aadata.aaData[0].WARNFEED + "；" + "接警时间：" + data.aadata.aaData[0].JJSJ;
							    	if ($.trim(data.aaData[0].CJSJ) != '0') {
							    		tips += "；处警时间：" + data.aaData[0].CJSJ;
							    	} else {
							    		tips += "；处警时间：无";
							    	}
		        				} else {
		        					tips = "该警情" + data.aaData[0].OVERFEED + "；" + "接警时间：" + data.aaData[0].JJSJ;
							    	if ($.trim(data.aaData[0].CJSJ) != '0') {
							    		tips += "；处警时间：" + data.aaData[0].CJSJ;
							    	} else {
							    		tips += "；处警时间：无";
							    	}
		        				}
		        			} else if (array[0] == '4') {
		        				if (array[1] == '1') {
		        					tips = data.aaData[0].WARNFEED;
							    	if ($.trim(data.aaData[0].LARQ) != '0') {
							    		tips += "；立案时间：" + data.aaData[0].LARQ;
							    	} else {
							    		tips += "；立案时间：无";
							    	}
		        				} else {
		        					tips = data.aaData[0].OVERFEED;
		        					if ($.trim(data.aaData[0].LARQ) != '0') {
							    		tips += "；立案时间：" + data.aaData[0].LARQ;
							    	} else {
							    		tips += "；立案时间：无";
							    	}
		        				}
		        			} else if (array[0] == '5') {
								if (array[1] == '1') {
									tips = data.aaData[0].WARNFEED;
		        				} else {
		        					tips = data.aaData[0].OVERFEED;
		        				}
		        			} else if (array[0] == '6' || array[0] == '7' || array[0] == '8' || array[0] == '9') {
								if (array[1] == '1') {
									tips = data.aaData[0].RYXM+data.aaData[0].WARNFEED + "；措施起始时间：" + data.aaData[0].QSSJ + "；措施终止时间：" + data.aaData[0].ZZSJ;
		        				} else {
		        					tips = data.aaData[0].RYXM+data.aaData[0].OVERFEED + "；措施起始时间：" + data.aaData[0].QSSJ + "；措施终止时间：" + data.aaData[0].ZZSJ;
		        				}
		        			}
		        		}
		        		$("#caseDetailInfo tr[name=lawWaringMsg] td:nth-child(2)").html(tips);
		        	}	
		        },
		        error:function (data,textStatus) {      
		             console.log(data)
		        }
	     	});
		}

		//嫌疑人信息
		function getSuspectDetailInfo(caseNum){			
			$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "handling/selectHandlingMap",
		        data: {
		        	code:urlMsg.code
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR){	
		        	console.log(data)
		        	if(null != data && "" != data){	 	
			        	suspectArr = data
			        	$(".suspectInfoTitle").css("opacity","1")
			        	$(".hearingRoom").css("opacity","1")
			        	$(".suspect").css("color","#FFFFFF")
						$(".victim").css("color","#90a6b7")
						$(".witness").css("color","#90a6b7")
			        	 //左上角嫌疑人信息展示	
			        	var suspect = "";
			        	suspect += "<tr><td>姓名&emsp;<span class='personColor'>"+(data.NAME==null?"":data.NAME)+"</span>&emsp;</td><td>性别&emsp;<span class='personColor'>"+(data.SEX==null?"":data.SEX)+"</span></td><td>民族&emsp;<span class='personColor'>"+(data.NATION==null?"":data.NATION)+"</span></td><td>出生&emsp;<span class='personColor'>"+(data.NATION==null?"":data.BIRTHDAY)+"</span></td></tr>";
			        	suspect += "<tr><td>年龄&emsp;<span class='personColor'>"+(data.AGE==null?"":data.AGE)+"</span>&emsp;</td><td>住址&emsp;<span class='personColor'>"+(data.S_DOMICILE==null?"":data.S_DOMICILE)+"</span></td></tr>";
	                    suspect += "<tr><td colspan='3'>公民身份证号码&emsp;<span style='color:#90a6b7;'>"+(data.S_CREDENTIALS_NUM==null?"":data.S_CREDENTIALS_NUM)+"</span></td></tr>";
	                    suspect += "<tr><td colspan='3'><span style='color:#90a6b7;'>"+(data.DT_START_USE_TIME==null?"":data.DT_START_USE_TIME)+"</span></td></tr>";
		        		suspect += "<tr><td colspan='3'><span style='color:#90a6b7;'>"+(data.DT_END_USE_TIME==null?"":data.DT_END_USE_TIME)+"</span></td></tr>";
			        	suspect += "<tr><td></td></tr>";
			        	suspect += "<tr><td></td></tr>";
			        	suspect += "<tr><td></td></tr>";
			        	$("#suspectInfo").html(suspect);
		        	} else {
								var witness = "";  	                   							
								witness += "<tr><td>姓名&emsp;<span class='personColor'></span></td><td>性别&emsp;<span class='personColor'></span></td><td>民族&emsp;<span class='personColor'></span></td><td>出生&emsp;<span class='personColor'></span></td></tr>";
								witness += "<tr><td colspan='3'>住址&emsp;<span style='color:#90a6b7;'></span></td></tr>";
								witness += "<tr><td colspan='3'>公民身份证号码&emsp;<span style='color:#90a6b7;'></span></td></tr>";
								witness += "<tr><td style='font-size: 13px;'>受理流程</td></tr>";
		        		$("#suspectInfo").html(witness);
		        	}
		        },
		        error:function (data,textStatus) {      
		             console.log(data)
		        },
		        beforeSend: function(){      
		            $('<div class="loadingWrap"></div>').appendTo("body");
		        },     
		        complete: function(){      
		           	$(".loadingWrap").remove();
		        }  
	     	});  
		}

		//电子台账
		function getInquestArchiveEvidence(caseNum){	
			$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "handling/selectInquestArchiveEvidenceList",
		        data: {
		        	code:urlMsg.code
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR){
		        	if (data.length > 0) {	
		        		var tableHtml = "";
		        		var emptyNum = 0;
		        		for (var i = 0;i < data.length;i++) {
		        			if(!isEmpty(data[i].CAPTION)){
			        			tableHtml += "<p class=\"suspect\" style=\"opacity: 1;\" onClick=\"downloadDoc('"+data[i].PATH+"')\"><font size=\"3\">"+data[i].CAPTION+"</font></p>";
			        			emptyNum ++;
		        			}
		        		}
		        		if(data.length > 0 && emptyNum >0){
		        			$("#inquestArchiveEvidenceCount").html(data.length);
		                    $("#inquestArchiveEvidence").after(tableHtml); 
		        		}
		        	}
		        },
		        error:function (data,textStatus) {      
		             console.log(data)
		        },
		        beforeSend: function(){      
		            $('<div class="loadingWrap"></div>').appendTo("body");
		        },     
		        complete: function(){      
		           $(".loadingWrap").remove();
		        }  
	     	});  
		}
		
		//案件基本信息（中间）
		function getCaseDetailInfo(caseNum){			
			$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "handling/selectHandlingMap",
		        data: {
		        	code:urlMsg.code
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR){
		        	if (null != data && "" != data) {	 	 
		        		ajdata = data;
		                $(".caseId").append("<font color='#44FFFF'>"+data.CODE+"</font>")	
		                $("#policeName").text(data.DEPT) //显示办案单位
		                //显示除了案件编号的其他案件基本信息
		                var tempHtml = "";                     
	                    tempHtml += "<tr><td>案件名称</td><td title="+data.FULL_NAME+">"+data.FULL_NAME+"</td></tr>";
	                    tempHtml += "<tr><td>案件类别</td><td title="+data.CAPTION+"><font color='#CF4E6D'>"+data.CAPTION+"</font></td></tr>";
	                    tempHtml += "<tr><td>案由</td><td title="+data.REASON+">"+data.REASON+"</td></tr>";
	                    tempHtml += "<tr><td>办案部门</td><td title="+data.DEPT+">"+data.DEPT+"</td></tr>";
	                    tempHtml += "<tr><td>办案场所</td><td title="+data.INQUEST_DEPT_CAPTION+">"+data.INQUEST_DEPT_CAPTION+"</td></tr>";
	                    tempHtml += "<tr><td>办案民警</td><td title="+data.POLICE_NAME+">"+data.POLICE_NAME+"</td></tr>";
	                    tempHtml += "<tr><td>受理时间</td><td title="+data.DT_CREATE_TIME+">"+data.DT_CREATE_TIME+"</td></tr>";
	                    $("#caseDetailInfo").append(tempHtml); 
		        	}
		        },
		        error:function (data,textStatus) {      
		             console.log(data)
		        },
		        beforeSend: function(){      
		            $('<div class="loadingWrap"></div>').appendTo("body");
		        },     
		        complete: function(){      
		           $(".loadingWrap").remove();
		        }  
	     	});  
		}
		
		//涉案物品信息查询
		function getArticlesInvolved(caseNum){	
			$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "handling/selectInquestFollowGoodsList",
		        data: {
		        	code:urlMsg.code
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR) {
		        	console.log(data)
		        	if (data.length > 0) {
		        		var tableHtml = "";
		        		var allNum = 0;
		        		var returnNum = 0;
		        		var detainNum = 0;
		        		for (var i = 0;i < data.length;i++) {
		        			if(data[i].ID!=null){
			        			tableHtml += "<tr style=\"text-align:center;\">";
			        			tableHtml += "<td>" + (data[i].CAPTION==null?"":data[i].CAPTION) + "</td>";
			        			tableHtml += "<td>" + (data[i].COUNT==null?"":data[i].COUNT) + "</td>";
			        			tableHtml += "<td>" + (data[i].UNIT==null?"":data[i].UNIT) + "</td>";
			        			tableHtml += "<td>" + (data[i].REMARK==null?"":data[i].REMARK) + "</td>";
			        			tableHtml += "<td>" + (data[i].LOCKERNUMBER==null?"":data[i].LOCKERNUMBER) + "</td>";
			        			tableHtml += "<td>" + (data[i].CABINETNUM==null?"":data[i].CABINETNUM) + "</td>";
			        			tableHtml += "<td>" + (data[i].PROTECTMEASURE==null?"":data[i].PROTECTMEASURE) + "</td>";
			        			tableHtml += "<td>" + (data[i].INVLOVED==null?"":(data[i].INVLOVED == "0"?"涉案":"非涉案")) + "</td>";
			        			/* if (null != datas[i].id && "" != datas[i].id) {
			        				tableHtml += "<td><button style=\"background-color: transparent;\" onclick=\"resumeWaring('" + datas[i].id + "')\"><font color=\"#44FFFF\">[ 查看 ]</font><button></td>";
							    }else{
							    	tableHtml += "<td></td>";
							    } */
			        			if(!isEmpty(data[i].PROTECTMEASURE)){
			        				if(data[i].PROTECTMEASURE == "返还" || data[i].PROTECTMEASURE == "家人代领"){
			        					returnNum ++;
			        				}
			        				if(data[i].PROTECTMEASURE == "扣押"){
			        					detainNum ++;
			        				}
			        			}
			        			tableHtml += "</tr>";
							    allNum ++;
		        			}
		        		}
		        		returnNum = returnNum > 0?returnNum:0;
		        		detainNum = detainNum >0?detainNum:0;
	                    $("#caseGoodsList tbody").html(tableHtml);
	                    $(".goodsconut").after("<div class=\"goodsconut\"><span>"+allNum+"</span><span>"+returnNum+"</span><span>"+detainNum+"</span></div>")
		        	} else {
		        		$("#caseGoodsList tbody").html();
		        		 $(".goodsconut").after("<div class=\"goodsconut\"><span>0</span><span>0</span><span>0</span></div>")
		        	}
		        },
		        error:function (data,textStatus) { 
		             console.log(data);
		        },
		        beforeSend: function(){      
		        },     
		        complete: function(){      
		        }  
	     	});  
		}
		
		
		//办案区案办案审讯信息
		function getInquestList(caseNum){	
			$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "handling/selectInquestList",
		        data: {
		        	code:urlMsg.code
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR) {
		        	console.log(data)
		        	if (data.length > 0) {
		        		var tableHtml = "";
		        		var allNum = 0;
		        		var returnNum = 0;
		        		var detainNum = 0;
		        		for (var i = 0;i < data.length;i++) {
		        			if(data[i].S_ID!=null){
			        			tableHtml += "<tr style=\"text-align:center;\">";
			        			tableHtml += "<td>" + (data[i].NAME==null?"":data[i].NAME) + "</td>";
			        			tableHtml += "<td>" + (data[i].POLICE==null?"":data[i].POLICE) + "</td>";
			        			tableHtml += "<td>" + (data[i].S_LOCATION==null?"":data[i].S_LOCATION) + "</td>";
			        			tableHtml += "<td>" + (data[i].DT_START==null?"":data[i].DT_START) + "</td>";
			        			tableHtml += "<td>" + (data[i].DT_END==null?"":data[i].DT_END) + "</td>";
			        			tableHtml += "</tr>";
		        			}
		        		}
	                    $("#inquestList tbody").html(tableHtml);
		        	} else {
		        		$("#inquestList tbody").html();
		        	}
		        },
		        error:function (data,textStatus) { 
		             console.log(data);
		        },
		        beforeSend: function(){      
		        },     
		        complete: function(){      
		        }  
	     	});  
		}
		
		
		function resumeWaring(){
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
		function downloadDoc(path){
			window.location.href = path;
		}
</script>
<%@include file="/WEB-INF/views/common/psles-footer.jsp"%>
