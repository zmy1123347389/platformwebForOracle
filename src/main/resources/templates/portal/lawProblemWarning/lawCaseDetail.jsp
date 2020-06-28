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
</style>
<link href="<%=request.getContextPath()%>/plugin/video/video-js.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/plugin/video/video.min.js"></script>     
<script src="<%=request.getContextPath()%>/plugin/video/videojs-flash.min.js"></script> 
<script src="<%=request.getContextPath()%>/plugin/video/videojs-ie8.min.js"></script>
<body onresize="changeDivHeight()">
		<div class="container">
			<div class="title">
				<img src="<%=request.getContextPath()%>/img/return.png" class="returnImg" onclick="returnBasic()"/>
				<h4>吴起公安局办案场所一体化平台----案件详情</h4>
			</div>
			<div class="maincontent">
				<div class="column">
					<div class="oneBlock">
						<div class="leftPart">
							<img src="<%=request.getContextPath()%>/image/ren.png" class="leftTopIcon">
							<div class="personType">
								<p class="suspect" onclick="getSuspectInfo()">嫌疑人</p>
								<p class="witness" onclick="getWitnessInfo()">证人</p>
								<p class="victim" onclick="getVictimInfo()">受害人</p>
							</div>
						</div>
						<div class="rightPart">	
							<h4 style="font-size: 14px;">人员信息</h4>
						<table id="suspectInfo">
						</table>
					</div>
				</div>
				<div class="twoBlock">	
					<img src="<%=request.getContextPath()%>/image/juan.png" class="leftTopIcon">													
					<div class="folder">
						<img src="<%=request.getContextPath()%>/image/juanIcon.png" class="juanIcon">
						<div class="electronicFile">
							<p><span>电子卷宗总数</span>&emsp;&emsp;10&nbsp;份</p>
							<p><span>在柜</span>&emsp;&emsp;<span style="color:#44ffff;">8</span>&nbsp;份</p>
							<p><span>未在柜</span>&emsp;&emsp;<span style="color:#ff5c77;">2</span>&nbsp;份</p>
						</div>							
					</div>
					<div class="detailBtn" onclick="openInstrumentDetail()">查看详情</div>
				</div>
			</div>
			<div class="column">
				<div class="threeBlock">
					<div class="goodsCount">
						<div class="goodsconut">
							<span>入库总数</span>
							<span>调取总数</span>
							<span>移交总数</span>
						</div>
						<div class="goodsconut">
							<span>10</span>
							<span>7</span>
							<span>3</span>
						</div>
					</div>
					<div class="goodsList">
						<table border="1" cellspacing="0" class="caseGoodsList" id="caseGoodsList">
							<thead>
								<tr style="text-align:center;">
									<th>物品名称</th>
									<th>物品特征</th>
									<th>持有人</th>
									<th>保管状态</th>
									<th>处理状态</th>
									<th>登记时间</th>
								</tr>
							</thead>
							<tbody>
							</tbody>							
						</table>
					</div>
					<img src="<%=request.getContextPath()%>/image/wu.png" class="leftTopIcon">
				</div>
				<div class="fourBlock">
					<p class="hearingRoom">审讯位置：<span id="policeName"></span></p>
					<div class="casePersonList">
						<table border="1" cellspacing="0" class="casePerson" id='tabletest'>
							<tr class="suspectInfoTitle">
								<th>姓名</th>
								<th>性别</th>
								<th>民族</th>
								<th>操作</th>
							</tr>		
						</table>
					</div>
					<img src="<%=request.getContextPath()%>/image/chang.png" class="leftTopIcon">
				</div>
			</div>
		</div>
		<div class="centerContent">
			<h4>案件基本信息</h4>	
			<p class="caseId"></p>	
			<table border="1" cellspacing="0" id="caseDetailInfo">
				
			</table>
			<div class="videoBtn" onclick="maskAppear()">已关联执法音视频</div>
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
			var name = "${param.pagename}";
			if (name == 'main') {
				window.location.href = requestPslesBasePath + "pslesIndex";
			} else if (name == 'allcase') {
				window.location.href = requestPslesBasePath + "allCase";
			} else {
				window.location.href = requestPslesBasePath + "lawProblemIndex";
			}
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
		//获取受害人信息
		function getVictimInfo(){
			persontype = 1
			$(".victim").css("color","#FFFFFF")
			$(".suspect").css("color","#90a6b7")
			$(".witness").css("color","#90a6b7")
			getVictimDetailInfo()	
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
			getWitnessDetailInfo(witnessArr[witnesssub])*/
			getSuspectDetailInformation();
			getLawWaring();
			getArticlesInvolved();
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
		        url: requestPslesBasePath + "caseDetail/getSuspectDetailMessage",
		        data: {
		        	caseNum:urlMsg.caseNumber
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR){	
		        	if(null != data && "" != data){	 	
			        	suspectArr = data
			        	$(".suspectInfoTitle").css("opacity","1")
			        	$(".hearingRoom").css("opacity","1")
			        	$(".suspect").css("color","#FFFFFF")
						$(".victim").css("color","#90a6b7")
						$(".witness").css("color","#90a6b7")
			        	 //左上角嫌疑人信息展示	
			        	var suspect = "";
			        	suspect += "<tr><td>姓名&emsp;<span class='personColor'>"+data[suspectsub].name+"</span>&emsp;</td><td>性别&emsp;<span class='personColor'>"+data[suspectsub].sex+"</span></td><td>民族&emsp;<span class='personColor'>"+data[suspectsub].nation+"</span></td><td>出生&emsp;<span class='personColor'>"+data[suspectsub].birthday+"</span></td></tr>";
	                    suspect += "<tr><td colspan='3'>住址&emsp;<span style='color:#90a6b7;'>"+data[suspectsub].address+"</span></td></tr>";
	                    suspect += "<tr><td colspan='3'>公民身份证号码&emsp;<span style='color:#90a6b7;'>"+data[suspectsub].cardNum+"</span></td></tr>";
	                    suspect += "<tr><td style='font-size: 13px;'>受理流程</td></tr>";
	                    if (null != data[victimsub].acceptPro && "" != data[victimsub].acceptPro) {
	                    //办案流程信息展示                    
			        	for(var i = 0;i < data[suspectsub].acceptPro.length; i++){
	                    	suspect += "<tr><td style='height:28%;border: 1px solid transparent;'><div class='caseInfoList'><p class='flowDetail'>"+data[suspectsub].acceptPro[i].CBRQ+"&emsp;"+data[suspectsub].acceptPro[i].ZDZ+"</p></div></td></tr>";                  	                 			        				        		
			        	}
			        }
			        	suspect += "<tr><td></td></tr>";
						suspect += "<tr><td><span id='prevPerson' onclick='getPrevPersonInfo()'>上一人</span><span id='nextPerson' onclick='getNextPersonInfo()'>下一人</span></td></tr>";
			        	suspect += "<tr><td></td></tr>";
			        	$("#suspectInfo").html(suspect);
//			        	console.log(suspect)
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
		
		//场--嫌疑人信息（右下角）
		function getSuspectDetailInformation(caseNum){			
			$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "caseDetail/getSuspectDetailMessage",
		        data: {
		        	caseNum:urlMsg.caseNumber
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR){	
		        	if(null != data && "" != data){	 		 
		        		if(data.length > 0){
		        			for(var i = 0;i < data.length; i++){		        			        		 
				        		var tr;	
				                tr='<td>'+data[i].name+'</td>'+'<td>'+data[i].sex+'</td>'+'<td>'+data[i].nation+'</td>'+'<td>查看</td>'		             	
				        		$("#tabletest").append('<tr>'+tr+'</tr>')
				        	}
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
		
		//受害人信息
		function getVictimDetailInfo(caseNum){
			$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "caseDetail/getVictimDetailMessage",
		        data: {
		        	caseNum:urlMsg.caseNumber
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR){
		        	if(null != data && "" != data){	 
		        		console.log(data)
			        	$(".victim").css("color","#FFFFFF")
						$(".suspect").css("color","#90a6b7")
						$(".witness").css("color","#90a6b7")
						console.dir(data);
			        	victimArr = data
			        	var victim = "";  	                   							
	                    victim += "<tr><td>姓名&emsp;<span class='personColor'>"+data[victimsub].name+"</span></td><td>性别&emsp;<span class='personColor'>"+data[victimsub].sex+"</span></td><td>民族&emsp;<span class='personColor'>"+data[victimsub].nation+"</span></td><td>出生&emsp;<span class='personColor'>"+data[victimsub].birthday+"</span></td></tr>";
	                    victim += "<tr><td colspan='3'>住址&emsp;<span style='color:#90a6b7;'>"+data[victimsub].address+"</span></td></tr>";
	                    victim += "<tr><td colspan='3'>公民身份证号码&emsp;<span style='color:#90a6b7;'>"+data[victimsub].cardNum+"</span></td></tr>";
	                    victim += "<tr><td style='font-size: 13px;'>受理流程</td></tr>"
	                    if (null != data[victimsub].acceptPro && "" != data[victimsub].acceptPro) {
	                    	for(var i = 0;i < data[victimsub].acceptPro.length; i++){
		                    	victim += "<tr><td style='height:28%;border: 1px solid transparent;'><div class='caseInfoList'><p class='flowDetail'>"+data[victimsub].acceptPro[i].CBRQ+"&emsp;"+data[victimsub].acceptPro[i].ZDZ+"</p></div></td></tr>";                  	                		                    	
	                    	}
	                    }
	                    victim += "<tr><td></td></tr>";
	                    //办案流程信息展示
		        		victim += "<tr class='personTurn'><td><span id='prevPerson' onclick='getPrevPersonInfo()'>上一人</span><span id='nextPerson' onclick='getNextPersonInfo()'>下一人</span></td></tr>";
		        		victim += "<tr><td></td></tr>";
		        		$("#suspectInfo").html(victim);
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
		
		//证人信息
		function getWitnessDetailInfo(caseNum){
			$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "caseDetail/getAttestorDetailMessage",
		        data: {
		        	caseNum:urlMsg.caseNumber
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR){
		        	if(null != data && "" != data){	 
			        	$(".witness").css("color","#FFFFFF")
								$(".suspect").css("color","#90a6b7")
								$(".victim").css("color","#90a6b7")
			        	witnessArr = data
			        	var witness = "";  	                   							
								witness += "<tr><td>姓名&emsp;<span class='personColor'>"+data[witnesssub].name+"</span></td><td>性别&emsp;<span class='personColor'>"+data[witnesssub].sex+"</span></td><td>民族&emsp;<span class='personColor'>"+data[witnesssub].nation+"</span></td><td>出生&emsp;<span class='personColor'>"+data[witnesssub].birthday+"</span></td></tr>";
								witness += "<tr><td colspan='3'>住址&emsp;<span style='color:#90a6b7;'>"+data[witnesssub].address+"</span></td></tr>";
								witness += "<tr><td colspan='3'>公民身份证号码&emsp;<span style='color:#90a6b7;'>"+data[witnesssub].cardNum+"</span></td></tr>";
								witness += "<tr><td style='font-size: 13px;'>受理流程</td></tr>";
								if (null != data[victimsub].acceptPro && "" != data[victimsub].acceptPro) {
								for(var i = 0;i < data[witnesssub].acceptPro.length; i++){
									witness += "<tr><td style='height:28%;border: 1px solid transparent;'><div class='caseInfoList'><p class='flowDetail'>"+data[witnesssub].acceptPro[i].CBRQ+"&emsp;"+data[witnesssub].acceptPro[i].ZDZ+"</p></div></td></tr>";                   	                		                    	
								}
							}
								witness += "<tr><td></td></tr>";
								//办案流程信息展示
		        		witness += "<tr class='personTurn'><td><span id='prevPerson' onclick='getPrevPersonInfo()'>上一人</span><span id='nextPerson' onclick='getNextPersonInfo()'>下一人</span></td></tr>";
		        		witness += "<tr><td></td></tr>";
		        		$("#suspectInfo").html(witness);
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

		//案件基本信息（中间）
		function getCaseDetailInfo(caseNum){			
			$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "caseDetail/getCaseDetailMessage",
		        data: {
		        	caseNum:urlMsg.caseNumber
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR){
		        	if (null != data && "" != data) {	 	 
		        		ajdata = data;
		                $(".caseId").text(data.AJBH)	
		                $("#policeName").text(data.BADW) //显示办案单位
		                //显示除了案件编号的其他案件基本信息
		                var tempHtml = "";                     
	                    tempHtml += "<tr><td>案件名称</td><td title="+data.AJMC+">"+data.AJMC+"</td></tr>";
	                    tempHtml += "<tr><td>案件类别</td><td title="+data.AJLB+">"+data.AJLB+"</td></tr>";
	                    tempHtml += "<tr><td>案件状态</td><td title="+data.AJZT+">"+data.AJZT+"</td></tr>";
	                    tempHtml += "<tr><td>案件描述</td><td title="+data.JYAQ+" class='caseInformation'><span>"+data.JYAQ+"</span></td></tr>";
	                    tempHtml += "<tr><td>办案单位</td><td title="+data.BADW+">"+data.BADW+"</td></tr>";
	                    tempHtml += "<tr><td>办案民警</td><td title="+data.SLR+">"+data.SLR+"</td></tr>";
	                    tempHtml += "<tr><td>受理时间</td><td title="+data.SLSJ+">"+data.SLSJ+"</td></tr>";
	                    tempHtml += "<tr name=\"lawWaringMsg\"><td>预警信息</td><td></td></tr>";
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
		        url: requestPslesBasePath + "caseDetail/getArticlesInvolved",
		        data: {
		        	caseNum:urlMsg.caseNumber
		        },
		        cache: false,
		        dataType: "json",
		        success: function (data,textStatus,jqXHR) {
		        	if (null != data && "" != data) {
		        		var tableHtml = "";
		        		for (var i = 0;i < data.length;i++) {
		        			tableHtml += "<tr style=\"text-align:center;\">";
		        			tableHtml += "<td>" + (data[i].MC==null?"":data[i].MC) + "</td>";
		        			tableHtml += "<td>" + (data[i].TZ==null?"":data[i].TZ) + "</td>";
		        			tableHtml += "<td>" + (data[i].CYR==null?"":data[i].CYR) + "</td>";
		        			tableHtml += "<td>" + (data[i].BGZT==null?"":data[i].BGZT) + "</td>";
		        			tableHtml += "<td>" + (data[i].CLZT==null?"":data[i].CLZT) + "</td>";
		        			tableHtml += "<td>" + (data[i].DJRQ==null?"":data[i].DJRQ) + "</td>";
		        			tableHtml += "</tr>";
		        		}
	                    $("#caseGoodsList tbody").html(tableHtml);
		        	} else {
		        		$("#caseGoodsList tbody").html("");
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
</script>
<%@include file="/WEB-INF/views/common/psles-footer.jsp"%>