<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/psles-taglib.jsp"%>
<%@include file="/WEB-INF/views/common/psles-header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/basic.css" />
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/plugin/bootstrap/bootstrap.min.css"> --%>
<style type="text/css">
	body{
		width: 100%;			
		background: url(<%=request.getContextPath()%>/image/wqxbasic.jpg)center no-repeat;
		background-size:100% 100%;
		position: relative;01
		overflow: hidden;
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
	
	/*背景层*/
	#popLayer {
		display: none;
		background-color: #B3B3B3;
		position: absolute;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		z-index: 99998;
		-moz-opacity: 0.8;
		opacity:.40;
		filter: alpha(opacity=80);/* 只支持IE6、7、8、9 */
	}

	/*弹出层*/
	#popBox {
		display: none;
		background-color: #FFFFFF;
		z-index: 99999;
		width: 400px;
		height: 200px;
		position:fixed;
		top:0;
		right:0;
		left:0;
		bottom:0;
		margin:auto;
	}
	
	.modal-header {
	    padding: 5px;
	    border-bottom: 1px solid #e5e5e5;
	    text-align: center;
	}
	
	.modal-header h4 {
	    font-size: 18px;
		font-family: inherit;
    	font-weight: 500;
    	line-height: 1.1;
    	color: black;
	}
	
	.modal-title {
	    margin: 0;
	    line-height: 1.42857143;
	}
	
	.modal-footer {
	    padding: 5px;
	    text-align: right;
	    border-top: 1px solid #e5e5e5;
	}
	
	.btn {
	    display: inline-block;
	    padding: 6px 12px;
	    margin-bottom: 0;
	    font-size: 14px;
	    font-weight: 400;
	    line-height: 1.42857143;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: middle;
	    -ms-touch-action: manipulation;
	    touch-action: manipulation;
	    cursor: pointer;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	    background-image: none;
	    border: 1px solid transparent;
	    border-radius: 4px;
	}
	
	.btn-primary {
	    color: #fff;
	    background-color: #337ab7;
	    border-color: #2e6da4;
	}
	.count{
		color: rgb(255, 255, 255); 
		border: 1px solid rgba(144,166,183,0.3);
	    width: 100px;
	    padding: 2% 2%;
	    margin: 3% 15%;
	    color: #90a6b7;
	    cursor: pointer;
	    font-size: 12px;
	    text-align: center;
	}
</style>
<body onresize="changeDivHeight()">
	<div class="mainArea">
		<div class="leftArea">
			<div class="firstArea">
				<h5 style="margin-left: 5%;margin-top:5%;">执法问题预警</h5>
				<a class="allcase" href="<%=request.getContextPath()%>/allCase" target="_blank">案件列表</a>
				<ul class="proList">						
					<!--<li class="ulist">章黎明车内财物被盗案处警结果未及时反馈！</li>-->
				</ul>
				<span onclick="jump()" class="readMore">查看更多</span>
			</div>
			<div class="propertyGoods">
				<div class="personList">
					<h5 class="handlingPro" onclick="handlingPro()" style="!important;#ffffff">办案区数据</h5>
					<ul class="mapTimeUlist">
						<li class="handlingVideoPro" style="width:100%;color: #90a6b7;"><a style="color:#ffffff;text-decoration:none;" href="<%=request.getContextPath()%>/policeMonitorIndex" target="_blank">办案区监控</a></li>
					</ul>
				</div>
				<ul class="handlingProList" style="margin-top: 10px;width: 94%;height: 65%;overflow-y: auto;padding:0% 2%;border: 1px solid transparent;"></ul>
				<ul class="handlingVideoProList"></ul>
				<span onclick="jumpHanding()" class="readMore Handling">查看更多</span>
			</div>
			<div id="main" style="display: none"></div>
			<div class="propertyGoods" style="height: 30%;">
				<div class="personList">
					<p class="goods1">办案区人员统计</p>
					<ul class="mapTimeUlist" style="margin-left: 30px">
						<li onclick="sameCount('today')" class="liDay" style="color: #FFFFFF;">本日</li>
						<li onclick="sameCount('week')" class="liWeek">本周</li>
						<li onclick="sameCount('month')" class="liMonth">本月</li>
						<li onclick="sameCount('year')" class="liYear">本年</li>
						<!-- <li><input type="text" id="times" placeholder="日历" value=""></li> -->
					</ul>
				</div>
				<div class="personBarList">
					<p class="count" style="margin: 5% 2% 2% 30%;color: #44ffff;">入区总数</p>
			    	<p class="count startUseAllCount" style="margin: 0% 2% 3% 30%;">0</p>
				    <div style="float: left;width: 50%">
					    <p class="count" style="color:#44ffff;">入区人数</p>
					    <p class="count startUseCount">0</p>
				    </div>
				    <div style="float: left;width: 50%">
				      	<p class="count" style="color: #44ffff;">出区人数</p>
				     	<p class="count endUseCount" >0</p>
				    </div>
    			</div>
				    <span onclick="jumpHandlingCountDetail()" class="readMore Handling">查看更多</span>
			</div>
			<!-- <div class="financeTime">
				<div class="personList">
					<p class="goods1">办案区人员统计</p>
					<ul class="mapTimeUlist" style="margin-left: 30px">
						<li onclick="sameCount('today')" class="liDay" style="color: #FFFFFF;">本日</li>
						<li onclick="sameCount('week')" class="liWeek">本周</li>
						<li onclick="sameCount('month')" class="liMonth">本月</li>
						<li onclick="sameCount('year')" class="liYear">本年</li>
						<li><input type="text" id="times" placeholder="日历" value=""></li>
					</ul>
				</div>
				<div class="personBarList">
					<p class="count" style="margin: 5% 2% 2% 30%;color: #44ffff;">入区总数</p>
			    	<p class="count startUseAllCount" style="margin: 0% 2% 3% 30%;">0</p>
				    <div style="float: left;width: 50%">
					    <p class="count" style="color:#44ffff;">入区人数</p>
					    <p class="count startUseCount">0</p>
				    </div>
				    <div style="float: left;width: 50%">
				      	<p class="count" style="color: #44ffff;">出区人数</p>
				     	<p class="count endUseCount" >0</p>
				    </div>
    			</div>
				    <span onclick="jumpHandlingCountDetail()" class="readMore">查看更多</span>
			</div> -->
		</div>
		<div class="centerArea">
			<div style="width: 100%;height: 72%;">
				<div class="mapTime">
					<ul class="mapTimeUlist" style="width:60%;margin-left: 20%;">
						<li onclick="checkDealCaseNum(this.id)" class="sameDay3" id="sameDay3">本日</li>
						<li onclick="checkDealCaseNum(this.id)" class="sameWeek3" id="sameWeek3" style="color: #FFFFFF;">本周</li>
						<li onclick="checkDealCaseNum(this.id)" class="sameMonth3" id="sameMonth3">本月</li>
						<li onclick="checkDealCaseNum(this.id)" class="sameYear3" id="sameYear3">本年</li>
					<!--	<li onclick="checkDealCaseNum(this.id)" class="sameDate3" id="sameDate3"></li>-->
						<li class="sameDate3" id="sameDate3">
							<input type="text" id="calendar" placeholder="日历" name="calendar" value="">
						</li>
					</ul>
				</div>
				<div class="mapbackground">
					<div class="caseCountNumber">
						<div class="caseNumber">
							<!--<div><p>接警数量</p><p class="caseCount1" id="time">230</p></div>
							<div><p>处警数量</p><p class="caseCount2" id="time1">450</p></div>
							<div><p>行政案件受案</p><p class="caseCount3" id="time2">340</p></div>
							<div><p>刑事案件受案</p><p class="caseCount4" id="time3">670</p></div>
							<div><p>刑事案件立案</p><p class="caseCount5" id="time4">870</p></div>-->
						</div>
					</div>
					<div class="mapArea">
						<!-- <div class="leftImg" onclick="mapDisplay()"></div> -->
						<div class="leftImg"></div>
						<div class="mapIcon">	
							<div class="wgcpcsImg">
																										
							</div>	
							<div class="wcbpcsImg">
																										
							</div>	
							<div class="zwpcsImg">
																										
							</div>	
							<div class="czpcsImg">
																										
							</div>	
							<div class="mgpcsImg">
																										
							</div>	
							<div class="xzpcsImg">
																										
							</div>	
							<div class="wwzpcsImg">
																										
							</div>	
							<div class="bbpcsImg">
																										
							</div>	
							<div class="xcpcsImg">
																										
							</div>	
							<div class="tbcpcsImg">
																										
							</div>	
							<div class="ccpcsImg">
																										
							</div>	
							<div class="cgmpcsImg">
																										
							</div>	
							<!-- 
							<div class="wllImg">
																										
							</div>															
							<div class="whlImg">
								
							</div>
							<div class="cnImg">
								
							</div>
							<div class="xxlImg">
								
							</div>
							<div class="dflImg">
								
							</div>
							<div class="hxImg">
								
							</div>
							<div class="hgkfqImg">
								
							</div>
							<div class="cllImg">
								
							</div> -->								
						</div>								
						<div class="heatmap">
							<div class="heatmapFrame1">
								<!--
								<img src="" class="heatmap-wll" id="heatmap0"/>
								<input type="hidden" id="wllCaseCount1" value="">
								<img src="mapImg/wllmap.png" id="wllmap" onmouseover="hovermapShow(id)" onmouseout="hovermapHide(id)"/>
								<div class="hideHeatmap">
									<p style="color: #FFFFFF;">文林路派出所</p>
									<p class='grayCaseCount'><span>处警结果反馈超期</span><span>180</span></p>
									<p class='grayCaseCount'><span>处警结果反馈超期</span><span>180</span></p>
									<p class='grayCaseCount'><span>处警结果反馈超期</span><span>180</span></p>
									<p class='grayCaseCount'><span>处警结果反馈超期</span><span>180</span></p>
									<p class='grayCaseCount'><span>处警结果反馈超期</span><span>180</span></p>
									<p class='grayCaseCount'><span>处警结果反馈超期</span><span>180</span></p>
									<p class='grayCaseCount'><span>处警结果反馈超期</span><span>180</span></p>
									<p class='grayCaseCount'><span>处警结果反馈超期</span><span>180</span></p>
									<p class='grayCaseCount'><span>处警结果反馈超期</span><span>180</span></p>									
								</div>
								-->									
							</div>
							<div class="heatmapFrame2">
								<!--
								<img src="" class="heatmap-dfl"id="heatmap1"/>
								<img src="mapImg/dfmap.png" id="dflmap" onmouseover="hovermapShow(id)" onmouseout="hovermapHide(id)"/>
								<input type="hidden" id="wllCaseCount2" value="">
								-->
							</div>
							<div class="heatmapFrame3">
								<!--
								<img src="" class="heatmap-whl" id="heatmap2"/>
								<img src="mapImg/whlmap.png" id="whlmap" onmouseover="hovermapShow(id)" onmouseout="hovermapHide(id)"/>
								<input type="hidden" id="wllCaseCount3" value="">
								-->
							</div>
							<div class="heatmapFrame4">						
								<!--		
								<img src="" class="heatmap-xxl" id="heatmap3"/>
								<img src="mapImg/xxlmap.png" id="xxlmap" onmouseover="hovermapShow(id)" onmouseout="hovermapHide(id)"/>
								<input type="hidden" id="wllCaseCount4" value="">
								-->
							</div>
							<div class="heatmapFrame5">
								<!--
								<img src="" class="heatmap-hg" id="heatmap4"/>
								<img src="mapImg/hgkfqmap.png" id="hgkfqmap" onmouseover="hovermapShow(id)" onmouseout="hovermapHide(id)"/>
								<input type="hidden" id="wllCaseCount5" value="">
								-->
							</div>
							<div class="heatmapFrame6">
								<!--
								<img src="" class="heatmap-cll" id="heatmap5"/>
								<img src="mapImg/clmap.png" id="cllmap" onmouseover="hovermapShow(id)" onmouseout="hovermapHide(id)"/>
								<input type="hidden" id="wllCaseCount6" value="">
								-->
							</div>
							<div class="heatmapFrame7">
								<!--
								<img src="" class="heatmap-cn" id="heatmap6"/>
								<img src="mapImg/cnmap.png" id="cnmap" onmouseover="hovermapShow(id)" onmouseout="hovermapHide(id)"/>
								<input type="hidden" id="wllCaseCount7" value="">
								-->
							</div>
							<div class="heatmapFrame8">
								<!--
								<img src="" class="heatmap-hx" id="heatmap7"/>
								<img src="mapImg/hxmap.png" id="hxmap" onmouseover="hovermapShow(id)" onmouseout="hovermapHide(id)"/>	
								<input type="hidden" id="wllCaseCount8" value="">
								-->
							</div>
						</div>
						<!-- <div class="rightImg" onclick="heatMapDisplay()"></div> -->
						<div class="rightImg"></div>
					</div>
				</div>
			</div>
			<div class="mapLine">
<!-- 				<div class="compareBtn" onclick="compareAnaly()">对比分析</div> -->
				<div id="main3"></div>
			</div>								
		</div>
		<div class="rightArea">
			<div style="float:right;font-size:12px;color:#ffffff;padding:5px 10px 0px 0px;">
				<span>欢迎！${userName}</span>
				<span style="margin-left:20px;"><a style="cursor:pointer;color:#ffffff;" onclick="showModifyPw()">修改密码</a></span>
				<span style="margin-left:10px;"><a style="cursor:pointer;color:#ffffff;" onclick="userQuit()">退出</a></span>
			</div>
			<div class="videoList">
				<div class="videoTime">
					<h5>执法音视频关联</h5>
					<ul class="videoTimeUlist" style="width:62%;">
<!-- 						<li onclick="sameDay1()" class="sameDay1" style="color: #FFFFFF;" id="video11">本日</li> -->
						<li onclick="checkDealCaseNum(this.id)" class="sameWeek1"  id="video12" style="color: #FFFFFF;">本周</li>
						<li onclick="checkDealCaseNum(this.id)" class="sameMonth1"  id="video13">本月</li>
						<li onclick="checkDealCaseNum(this.id)" class="sameYear1"  id="video14">本年</li>
<!-- 						<li onclick="sameDate1()" class="sameDate1"  id="video15">日历</li> -->
					</ul>
				</div>
				<div class="mainList">
					<div id="main1"></div>
				</div>
				<div class="readDetail"><a style="color:#ffffff;text-decoration:none;" href="<%=request.getContextPath()%>/lawVideoIndex" target="_blank">查看详情</a></div>
			</div>
			<div class="propertyGoods">
				<div class="goodsCount">
					<h5>涉案财务中心</h5>
					<ul class="caseTimeUlist" id="caseTimeUlist" style="width:61%;">
						<li onclick="progressbar(this.id)" id="finacial1" style="color: #FFFFFF;">本日</li>
						<li onclick="progressbar(this.id)" id="finacial2">本周</li>
						<li onclick="progressbar(this.id)" id="finacial3">本月</li>
						<li onclick="progressbar(this.id)" id="finacial4">本年</li>
<!-- 						<li onclick="progressbar(this.id)" id="finacial5">日历</li> -->
					</ul>
				</div>
				<div class="caseGoods">
					<div class="progressbarBox">
						<div class="cricle">
				            <div class="pre_left"><div class="left"></div></div>
				            <div class="pre_right"><div class="right"></div></div>
				            <div class="mask">0</div>
				        </div>
			        	<span class="wordDescript">入库总数</span>
					</div>
					<div class="progressbarBox">
						<div class="cricle1">
				            <div class="pre_left1"><div class="left1"></div></div>
				            <div class="pre_right1"><div class="right1"></div></div>
				            <div class="mask1">0</div>
				        </div>
			        	<span class="wordDescript">调取总数</span>
					</div>
					<div class="progressbarBox">
						<div class="cricle2">
				            <div class="pre_left2"><div class="left2"></div></div>
				            <div class="pre_right2"><div class="right2"></div></div>
				            <div class="mask2">0</div>
				        </div>
			        	<span class="wordDescript">移交总数</span>
					</div>
				</div>	
				<div class="readMore1">查看更多</div>
			</div>
			<div class="financeTime">
				<div class="videoTime1">
					<h5>警情预测</h5>
					<ul class="financeTimeUlist">
						<li onclick="sameDay2()" class="sameDay2" style="color: #FFFFFF;" id="future1">未来</li>
						<li onclick="sameWeek2()" class="sameWeek2" id="future2">一周</li>
						<li onclick="sameMonth2()" class="sameMonth2" id="future3">一月</li>
						<li onclick="sameYear2()" class="sameYear2" id="future4">一季度</li>
						<li onclick="sameDate2()" class="sameDate2" id="future5">一年</li>
					</ul>
				</div>
				<div class="casePredit">
					<div id="main2"></div>
				</div>
			</div>
		</div>		
	</div>
	
	<!-- Modal 音视频案件关联弹出框-->
	<div id="popLayer"></div>
	<div id="popBox">
	    <div class="modal-header">
	        <h4 class="modal-title">修改密码</h4>
	    </div>
	    <div class="modal-body" style="padding:15px;">
	    	<div class="dataSourceTable FTPSetsTable">
				<div class="con">
                   	<div class="fl">
                        <label>旧密码：&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <span >
      						<input id="oldPw" type="password" placeholder="请填写原始密码" class="special" style="width:200px;"/>
                        </span>
                    </div>
                    <div class="fl" style="margin-top:10px;">
                        <label>新密码：&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <span>
                               <input id="newPw" type="password" placeholder="请填写新密码" class="special" style="width:200px;"/>
                       </span>
                    </div>
                    <div class="fl" style="margin-top:10px;">
                        <label>确认密码：</label>
                        <span>
                               <input id="confirmPw" type="password" placeholder="请填写确认密码" class="special" style="width:200px;"/>
                       </span>
                    </div>
				</div>
			</div>
	    </div>
	    <div class="modal-footer">
	        <button type="button" class="btn btn-primary modelbtn" id="savePw" >保存</button>
	        <button type="button" title='取消' class="btn btn-default modelbtn" onclick="closeDialog()">取消</button>
	    </div>
	</div>
</body>
<script src="<%=request.getContextPath()%>/plugin/echarts.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/mainDashboard/heatmap.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/mainDashboard/echartsList.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/plugin/laydate/laydate.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">		
	//对比分析
	function compareAnaly(){
		
	}
	var body = document.querySelector("body")
	window.onload=function(){  
		changeDivHeight();  
	} 
	function changeDivHeight(){
		var h = document.documentElement.clientHeight;
		body.style.height = h + "px";
	}
	function jump(){
		window.location.href = requestPslesBasePath + "lawProblemIndex";
	}
	function heatMapDisplay(){
		$(".heatmap").css("display","block")
		$(".mapIcon").css("display","none")				
	}
	function mapDisplay(){
		$(".heatmap").css("display","none")
		$(".mapIcon").css("display","block")
	}
			//各个派出所接警数
	function getPoliceCaseNum(type,currentDate, weekEndDate){
     	$.ajax({
	        type: "post",
	        url: requestPslesBasePath + "lawenforce/getPoliceMapCount",
	        data: {
	        	type:type,
	        	startDate:currentDate,
	        	endDate:weekEndDate
	        },
	        cache: false,
	        dataType: "json",
	        success: function (data,textStatus,jqXHR){
	        	var array = ['610626600000','610626620000','610626530000','610626510000','610626570000','610626580000','610626590000','610626540000','610626520000','610626560000','610626610000','610626550000'];
	        	for(var j = 0;j < array.length; j++){
	        		var flag = false;
	        		if (null != data && "" != data) {	
		        		for(var i = 0; i < data.length; i++){
		        			if(data[i].areaPoliceCode == array[j]) {
		        				flag = true;
		        				var html = "";
					        	html+="<div class='hideWllCaseCount'>"
					        	html+="<p style='color:#00f8fe;'>"+formatterType(data[i].areaPoliceCode)+"</p>"
						       	html+="<p class='grayCaseCount'><span>处警数量</span><span>"+data[i].alarmCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>处警数量</span><span>"+data[i].policeCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>行政案件受案</span><span>"+data[i].adminCaseAcceptCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>刑事案件受案</span><span>"+data[i].criminalCaseAcceptCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>刑事案件立案</span><span>"+data[i].criminalCaseFiledCount+"</span></p>"
					          html+="</div>"
					          html+="<img src='img/1.png' class='one'/>"
										html+="<img src='img/2.png' class='two'/>"
					          html+="<p class='name'>"+formatterType(data[i].areaPoliceCode)+"</p>"	
					        	if(data[i].areaPoliceCode == "610626600000"){
				        			$(".wgcpcsImg").html(html); 
				        		}else if(data[i].areaPoliceCode == "610626620000"){
				        			$(".wcbpcsImg").html(html); 
				        		}else if(data[i].areaPoliceCode == "610626530000"){
				        			$(".zwpcsImg").html(html); 
				        		}else if(data[i].areaPoliceCode == "610626510000"){
				        			$(".czpcsImg").html(html); 
				        		}else if(data[i].areaPoliceCode == "610626570000"){
				        			$(".mgpcsImg").html(html); 
				        		}else if(data[i].areaPoliceCode == "610626580000"){
				        			$(".xzpcsImg").html(html); 
				        		}else if(data[i].areaPoliceCode == "610626590000"){
				        			$(".wwzpcsImg").html(html); 
				        		}else if(data[i].areaPoliceCode == "610626540000"){
				        			$(".bbpcsImg").html(html); 
				        		}else if(data[i].areaPoliceCode == "610626520000"){
				        			$(".xcpcsImg").html(html); 
				        		}else if(data[i].areaPoliceCode == "610626560000"){
				        			$(".tbcpcsImg").html(html); 
				        		}else if(data[i].areaPoliceCode == "610626610000"){
				        			$(".ccpcsImg").html(html); 
				        		}else if(data[i].areaPoliceCode == "610626550000"){
				        			$(".cgmpcsImg").html(html); 
				        		}
		        				break;
		        			}
		        		}
	        		}
	        		if (!flag) {
	        			var html = "";
			        	html+="<div class='hideWllCaseCount'>"
				        html+="<p style='color:#00f8fe;'>"+formatterType(array[j])+"</p>"
				       	html+="<p class='grayCaseCount'><span>处警数量</span><span>0</span></p>"
				       	html+="<p class='grayCaseCount'><span>处警数量</span><span>0</span></p>"
				       	html+="<p class='grayCaseCount'><span>行政案件受案</span><span>0</span></p>"
				       	html+="<p class='grayCaseCount'><span>刑事案件受案</span><span>0</span></p>"
				       	html+="<p class='grayCaseCount'><span>刑事案件立案</span><span>0</span></p>"
			          html+="</div>"
			          html+="<img src='img/1.png' class='one'/>"
								html+="<img src='img/2.png' class='two'/>"
				        html+="<p class='name'>"+formatterType(array[j])+"</p>"	
			        	if(array[j] == "610626600000"){								
	        				$(".wgcpcsImg").html(html); 
		        		}else if(array[j] == "610626620000"){
	        				$(".wcbpcsImg").html(html); 
		        		}else if(array[j] == "610626530000"){
	        				$(".zwpcsImg").html(html); 
		        		}else if(array[j] == "610626510000"){
	        				$(".czpcsImg").html(html); 
		        		}else if(array[j] == "610626570000"){
	        				$(".mgpcsImg").html(html); 
		        		}else if(array[j] == "610626580000"){
	        				$(".xzpcsImg").html(html); 
		        		}else if(array[j] == "610626590000"){
	        				$(".wwzpcsImg").html(html); 
		        		}else if(array[j] == "610626540000"){
	        				$(".bbpcsImg").html(html); 
	        			}else if(array[j] == "610626520000"){
	        				$(".xcpcsImg").html(html); 
	        			}else if(array[j] == "610626560000"){
	        				$(".tbcpcsImg").html(html); 
	        			}else if(array[j] == "610626610000"){
	        				$(".ccpcsImg").html(html); 
	        			}else if(array[j] == "610626550000"){
	        				$(".cgmpcsImg").html(html); 
	        			}
	        		}
        		}		        	      		
	        },
	        error:function (data,textStatus) {      
	             console.log(data)
	        },
	        beforeSend: function(){      
	            //$('<div class="loadingWrap"></div>').appendTo("body");
	        },     
	        complete: function(){      
	           	$(".loadingWrap").remove();
	        }  
     	});  
	}	
	//热力图
	function getHeatmapData(type,currentDate, weekEndDate){
		$.ajax({
	        type: "post",
	        url: requestPslesBasePath + "lawenforce/getAreaLawChartCount",		       
	        data: {
	        	type:type,
	        	startDate:currentDate,
	        	endDate:weekEndDate
	        },
	        cache:false,
	        dataType: "json",
	        success: function (data,textStatus,jqXHR){
	        	var array = ['610626600000','610626620000','610626530000','610626510000','610626570000','610626580000','610626590000','610626540000','610626520000','610626560000','610626610000','610626550000'];
	        	for(var j = 0;j < array.length; j++) {
	        		var flag = false;
	        		if(null != data && "" != data) {
	        			for(var i = 0; i < data.length; i++) {
	        				if(data[i].policeCode == array[j]) {
	        					flag = true;
					        	var html = "";
					        	var heatmap1 = "";
					        	var heatmap2 = "";
					        	var heatmap3 = "";
					        	var heatmap4 = "";
					        	var heatmap5 = "";
					        	var heatmap6 = "";
					        	var heatmap7 = "";
					        	var heatmap8 = "";
					        	var heatmap9 = "";
					        	var heatmap10 = "";
					        	var heatmap11 = "";
					        	var heatmap12 = "";
					        	heatmap1+="<img src='' class='heatmap-wll' id='heatmap0'/>"
					        	heatmap1+="<input type='hidden' id='wllCaseCount1' value='"+data[i].totalCount+"'>"
					        	heatmap1+="<img src='mapImg/wllmap.png' id='wllmap' onmouseover='hovermapShow(id)' onmouseout='hovermapHide(id)'/>"
					        	heatmap2+="<img src='' class='heatmap-dfl' id='heatmap1'/>"
					        	heatmap2+="<input type='hidden' id='wllCaseCount2' value='"+data[i].totalCount+"'>"
					        	heatmap2+="<img src='mapImg/dfmap.png' id='dflmap' onmouseover='hovermapShow(id)' onmouseout='hovermapHide(id)'/>"
					        	heatmap3+="<img src='' class='heatmap-whl' id='heatmap2'/>"
					        	heatmap3+="<input type='hidden' id='wllCaseCount3' value='"+data[i].totalCount+"'>"
					        	heatmap3+="<img src='mapImg/whlmap.png' id='whlmap' onmouseover='hovermapShow(id)' onmouseout='hovermapHide(id)'/>"
					        	heatmap4+="<img src='' class='heatmap-xxl' id='heatmap3'/>"
					        	heatmap4+="<input type='hidden' id='wllCaseCount4' value='"+data[i].totalCount+"'>"
					        	heatmap4+="<img src='mapImg/xxlmap.png' id='xxlmap' onmouseover='hovermapShow(id)' onmouseout='hovermapHide(id)'/>"
					        	heatmap5+="<img src='' class='heatmap-hg' id='heatmap4'/>"
					        	heatmap5+="<input type='hidden' id='wllCaseCount5' value='"+data[i].totalCount+"'>"
					        	heatmap5+="<img src='mapImg/hgkfqmap.png' id='hgkfqmap' onmouseover='hovermapShow(id)' onmouseout='hovermapHide(id)'/>"
					        	heatmap6+="<img src='' class='heatmap-cll' id='heatmap5'/>"
					        	heatmap6+="<input type='hidden' id='wllCaseCount6' value='"+data[i].totalCount+"'>"
					        	heatmap6+="<img src='mapImg/clmap.png' id='cllmap' onmouseover='hovermapShow(id)' onmouseout='hovermapHide(id)'/>"
					        	heatmap7+="<img src='' class='heatmap-cn' id='heatmap6'/>"
					        	heatmap7+="<input type='hidden' id='wllCaseCount7' value='"+data[i].totalCount+"'>"
					        	heatmap7+="<img src='mapImg/cnmap.png' id='cnmap' onmouseover='hovermapShow(id)' onmouseout='hovermapHide(id)'/>"
					        	heatmap8+="<img src='' class='heatmap-hx' id='heatmap7'/>"
					        	heatmap8+="<input type='hidden' id='wllCaseCount8' value='"+data[i].totalCount+"'>"
					        	heatmap8+="<img src='mapImg/hxmap.png' id='hxmap' onmouseover='hovermapShow(id)' onmouseout='hovermapHide(id)'/>"
					        	heatmap9+="<img src='' class='heatmap-hx' id='heatmap8'/>"
					        	heatmap9+="<input type='hidden' id='wllCaseCount9' value='"+data[i].totalCount+"'>"
					        	heatmap9+="<img src='mapImg/hxmap.png' id='hxmap' onmouseover='hovermapShow(id)' onmouseout='hovermapHide(id)'/>"
				        		heatmap10+="<img src='' class='heatmap-hx' id='heatmap9'/>"
					        	heatmap10+="<input type='hidden' id='wllCaseCount10' value='"+data[i].totalCount+"'>"
					        	heatmap10+="<img src='mapImg/hxmap.png' id='hxmap' onmouseover='hovermapShow(id)' onmouseout='hovermapHide(id)'/>"
				        		heatmap11+="<img src='' class='heatmap-hx' id='heatmap10'/>"
					        	heatmap11+="<input type='hidden' id='wllCaseCount11' value='"+data[i].totalCount+"'>"
					        	heatmap11+="<img src='mapImg/hxmap.png' id='hxmap' onmouseover='hovermapShow(id)' onmouseout='hovermapHide(id)'/>"
				        		heatmap12+="<img src='' class='heatmap-hx' id='heatmap11'/>"
					        	heatmap12+="<input type='hidden' id='wllCaseCount12' value='"+data[i].totalCount+"'>"
					        	heatmap12+="<img src='mapImg/hxmap.png' id='hxmap' onmouseover='hovermapShow(id)' onmouseout='hovermapHide(id)'/>"
					        	html+="<div class='hideHeatmap'>"
					        	html+="<p style='color:#00f8fe;'>"+formatterType(data[i].policeCode)+"</p>"
						       	html+="<p class='grayCaseCount'><span>处警结果反馈超期</span><span>"+data[i].receivePoliceCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>行政案件受理超期</span><span>"+data[i].adminCaseCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>刑事案件受理超期</span><span>"+data[i].criminalCaseCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>刑事案件立案超期</span><span>"+data[i].criminalRegisterCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>行政案件办理超期</span><span>"+data[i].adminCaseDealCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>刑事案件拘留超期</span><span>"+data[i].criminalCaseDetentionCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>刑事案件逮捕超期</span><span>"+data[i].criminalCaseArrestCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>刑事案件取保候审超期</span><span>"+data[i].criminalCaseBPTCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>刑事案件监视居住超期</span><span>"+data[i].criminalCaseSORCount+"</span></p>"
						       	html+="<p class='grayCaseCount'><span>执法问题总数</span><span>"+data[i].totalCount+"</span></p>"
					          html+="</div>";
					        	if(data[i].policeCode == "610626600000"){
					        		$(".heatmapFrame1").html(heatmap1); 	
				        			$(".heatmapFrame1").append(html); 
				        		}else if(data[i].policeCode == "610626620000"){
				        			$(".heatmapFrame2").html(heatmap7);
				        			$(".heatmapFrame2").append(html); 
				        		}else if(data[i].policeCode == "610626530000"){
				        			$(".heatmapFrame3").html(heatmap4);
				        			$(".heatmapFrame3").append(html); 
				        		}else if(data[i].policeCode == "610626510000"){
				        			$(".heatmapFrame4").html(heatmap3);
				        			$(".heatmapFrame4").append(html); 
				        		}else if(data[i].policeCode == "610626570000"){
				        			$(".heatmapFrame5").html(heatmap2);
				        			$(".heatmapFrame5").append(html); 
				        		}else if(data[i].policeCode == "610626580000"){
				        			$(".heatmapFrame6").html(heatmap5);
				        			$(".heatmapFrame6").append(html); 
				        		}else if(data[i].policeCode == "610626590000"){
				        			$(".heatmapFrame7").html(heatmap8);
				        			$(".heatmapFrame7").append(html); 
				        		}else if(data[i].policeCode == "610626540000"){
				        			$(".heatmapFrame8").html(heatmap6);
				        			$(".heatmapFrame8").append(html); 
				        		}else if(data[i].policeCode == "610626520000"){
				        			$(".heatmapFrame9").html(heatmap6);
				        			$(".heatmapFrame9").append(html); 
				        		}else if(data[i].policeCode == "610626560000"){
				        			$(".heatmapFrame10").html(heatmap6);
				        			$(".heatmapFrame10").append(html); 
				        		}else if(data[i].policeCode == "610626610000"){
				        			$(".heatmapFrame11").html(heatmap6);
				        			$(".heatmapFrame11").append(html); 
				        		}else if(data[i].policeCode == "610626550000"){
				        			$(".heatmapFrame12").html(heatmap6);
				        			$(".heatmapFrame12").append(html); 
				        		}
	        					break;
	        				}
	        			}
	        		}
	        	}
	        	hovermapInit();
	        },
	        error:function (data,textStatus) {      
	             console.log(data);
	        },
	        beforeSend: function(){      
	            //$('<div class="loadingWrap"></div>').appendTo("body");
	        },     
	        complete: function(){      
	           $(".loadingWrap").remove();
	        }  
     	});  
	}
	//获取执法问题
	function getLawEnforcePro(currentPage,length, start){
		//接警数
		var startNum = (currentPage - 1) * length;
		$.ajax({
	        type: "post",
	        url: requestPslesBasePath + "lawenforce/getLawEnforceProblemData",		       
	        data: {
	        	curPage:currentPage,
	        	length:length,
	        	start: startNum
	        },
	        cache:false,
	        dataType: "json",
	        success: function (data,textStatus,jqXHR){   
		        var list = "";
			    for(var i=0;i<data.length;i++){    //遍历data数组   	
			    	if (i > 6) {
			    		return;
			    	}
			    	var tips = (data[i].WARNFEED==null?"":data[i].WARNFEED);
			    	if (null != data[i].JJSJ && $.trim(data[i].JJSJ) != '0') {
			    		tips += "；处警时间：" + data[i].CJSJ;
			    	}
			    	if (null != data[i].CJSJ && $.trim(data[i].CJSJ) != '0') {
			    		tips += "；处警时间：" + data[i].CJSJ;
			    	}
			    	if (null != data[i].SLSJ && $.trim(data[i].SLSJ) != '0') {
				    	tips += "；受理时间：" + data[i].SLSJ;
			    	}
			    	list+="<li class=\"ulist\"><a title=\"" + tips + "\" class=\"lawTips\"></a><a class=\"ajhover\" title=\""+data[i].AJMC+"\" onclick='jumpDetail1(" + JSON.stringify(data[i]) + ")'>"+data[i].AJMC+"</a></li>";
			    	$(".proList").html(list);
			    }
			    $(".loadingWrap").remove();
	        },
	        error:function (data,textStatus) {      
	             console.log(data)
	             $(".loadingWrap").remove();
	        },
	        beforeSend: function(){      
	            $('<div class="loadingWrap"></div>').appendTo("body");
	        },     
	        complete: function(){      
	           $(".loadingWrap").remove();
	        }  
     	});  
	}

	//获取办案数据
	function getHandlingPro(currentPage,length, start){
		$(".handlingVideoProList").css("display","none");
		$(".HandingVideo").css("display","none");
		$.ajax({
	        type: "post",
	        url: requestPslesBasePath + "handling/selectHandling",		       
	        cache:false,
	        dataType: "json",
	        success: function (data,textStatus,jqXHR){   
		        var list = "";
			    for(var i=0;i<data.length;i++){    //遍历data数组   	
			    	if (i > 5) {
			    		return;
			    	}
			    	list+="<li class=\"ulist\"><a class=\"ajhover\" title=\""+data[i].FULL_NAME+"\" onclick='jumpHandlingDetail(" + JSON.stringify(data[i]) + ")'><font size='2.5'>"+data[i].FULL_NAME+"</font></a></li>";
			    	$(".handlingProList").html(list);
			    	if (i == 5) {
			    		$(".loadingWrap").remove();
			    	}
			    }
			    $(".loadingWrap").remove();
	        },
	        error:function (data,textStatus) {      
	             $(".loadingWrap").remove();
	        },
	        beforeSend: function(){      
	            $('<div class="loadingWrap"></div>').appendTo("body");
	        },     
	        complete: function(){      
	           //$(".loadingWrap").remove();
	        }  
     	});  
	}
	
	//获取音视频数据
	function getHandlingVideoPro(currentPage,length, start){
		//接警数
		var startNum = (currentPage - 1) * length;
		$.ajax({
	        type: "post",
	        url: requestPslesBasePath + "handling/getHandlingVideoData",		       
	        data: {
	        	
	        },
	        cache:false,
	        dataType: "json",
	        success: function (data,textStatus,jqXHR){   
		        var list = "";
			    for(var i=0;i<data.length;i++){    //遍历data数组   	
			    	if (i > 6) {
			    		return;
			    	}
			    	list+="<li class=\"ulist\"><a class=\"ajhover\" title=\""+data[i].DESCRIPTION+"\" onclick='jumpHandlingVideoDetail(" + JSON.stringify(data[i]) + ")'>"+data[i].DESCRIPTION+"</a></li>";
			    	$(".handlingVideoProList").html(list);
			    	if (i == 6) {
			    		$(".loadingWrap").remove();
			    	}
			    }
	        },
	        error:function (data,textStatus) {      
	             console.log(data)
	             $(".loadingWrap").remove();
	        },
	        beforeSend: function(){      
	            $('<div class="loadingWrap"></div>').appendTo("body");
	        },     
	        complete: function(){      
	           //$(".loadingWrap").remove();
	        }  
     	});  
	}
	
	function jumpDetail1 (obj) {
		//案件未受理
		if (null == obj.AJBH || "" == obj.AJBH) {
	    	if (obj.CJSJ != '0') {
	    		alert("该警情未受理无案件信息！接警时间：" + obj.JJSJ + "；处警时间：" + obj.CJSJ + "；反馈：" + obj.WARNFEED);
	    	} else {
	    		alert("该警情未受理无案件信息！接警时间：" + obj.JJSJ + "；处警时间：无；反馈：" + obj.OVERFEED);
	    	}
			return;
		}
		window.open(requestPslesBasePath + "lawCaseDetailIndex?caseNumber="+ obj.AJBH);
	}
	
	function getCaseCount(type,currentDate, weekEndDate){
		//接警数
		$.ajax({
	        type: "post",
	        url: requestPslesBasePath + "lawenforce/getRecepolCount",
	        data: {
	        	type:type,
	        	startDate:currentDate,
	        	endDate:weekEndDate
	        },
	        cache: false,
	        dataType: "json",
	        success: function (data,textStatus,jqXHR){
	        	$('.caseNumber').empty();
	        	$(".caseNumber").append('<div><p>接警数量</p><p>'+data.JJS+'</p></div><div><p>处警数量</p><p>'+data.CJS+'</p></div><div><p>行政案件受案</p><p>'+data.XZAJ+'</p></div><div><p>刑事案件受案</p><p>'+data.XSAJ+'</p></div><div><p>刑事案件立案</p><p>'+data.XSLA+'</p></div>')					
	        },
	        error:function (data,textStatus) {      
	             console.log(data)
	        },
	        beforeSend: function(){      
	            //$('<div class="loadingWrap"></div>').appendTo("body");
	        },     
	        complete: function(){      
	           	$(".loadingWrap").remove();
	        }  
     	});  
	}
	
	var myDate = new Date();
	var month=myDate.getMonth()+1;
 	var myMonth = (month<10 ? "0"+month:month); 
	var nowDay = myDate.getDate();
	var day = (nowDay<10 ? "0" +nowDay:nowDay);
	
	var now = new Date(); //当前日期
    var nowDayOfWeek = now.getDay(); //今天本周的第几天
    var nowDay = now.getDate(); //当前日
    var nowMonth = now.getMonth(); //当前月
    var nowYear = now.getFullYear(); //当前年
    //格式化日期函数
	function formatDate(date) {
        var myyear = date.getFullYear();
        var mymonth = date.getMonth()+1;
        var myweekday = date.getDate();
 
        if(mymonth < 10){
            mymonth = "0" + mymonth;
        }
        if(myweekday < 10){
            myweekday = "0" + myweekday;
        }
        return (myyear+""+mymonth + "" + myweekday);
   }
	//本周初始日期
	function getWeekStartDate() {
        var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
        return formatDate(weekStartDate);
   	}
	//本周结束日期
       function getWeekEndDate() {
        var weekEndDate = new Date(nowYear, nowMonth, nowDay + (7 - nowDayOfWeek));
        return formatDate(weekEndDate);
    }       		
	function checkDealCaseNum(caseid){
		if(caseid == "sameDay3"){
			getCaseCount(3,myDate.getFullYear().toString()+ myMonth.toString() + day.toString())
			getPoliceCaseNum(3,myDate.getFullYear().toString()+ myMonth.toString() + day.toString())
			currentColor1("sameDay3")  
	       	getAllCase(3,myDate.getFullYear().toString()+ myMonth.toString() + day.toString())
	       	getHeatmapData(3,myDate.getFullYear().toString()+ myMonth.toString() + day.toString())
		}else if(caseid == "sameWeek3"){
			getCaseCount(4, getWeekStartDate(now), getWeekEndDate(now))
			getPoliceCaseNum(4,getWeekStartDate(now), getWeekEndDate(now))
			currentColor1("sameWeek3")
	        getAllCase(4,getWeekStartDate(now), getWeekEndDate(now))
	        getHeatmapData(4,getWeekStartDate(now), getWeekEndDate(now))
		}else if(caseid == "sameMonth3"){
			getCaseCount(2, myDate.getFullYear().toString()+ myMonth.toString())
			getPoliceCaseNum(2,myDate.getFullYear().toString()+ myMonth.toString())
			currentColor1("sameMonth3")
	        getAllCase(2, myDate.getFullYear().toString()+ myMonth.toString())	 
	        getHeatmapData(2, myDate.getFullYear().toString()+ myMonth.toString())
		}else if(caseid == "sameYear3"){
			getCaseCount(1, myDate.getFullYear())
			getPoliceCaseNum(1,myDate.getFullYear())
			currentColor1("sameYear3")	
	        getAllCase(1, myDate.getFullYear())	
	        getHeatmapData(1, myDate.getFullYear())	
		}else if(caseid == "sameDate3"){			

		} else if (caseid == "video12") {//音视频本周
			currentVideo("video12");
			getEchartVideoCount(4, getWeekStartDate(now), getWeekEndDate(now));
		} else if (caseid == "video13") {//音视频本月
			currentVideo("video13");
			getEchartVideoCount(2, myDate.getFullYear().toString()+ myMonth.toString());
		} else if (caseid == "video14") {//音视频本年
			currentVideo("video14");
			getEchartVideoCount(1, myDate.getFullYear());
		}
	}
	laydate.render({
	  	elem: '#calendar',
	  	type: 'date',
	  	range: "-",
	  	format:'yyyyMMdd',
/*	  	min: '1900-1-1',
	  	max: 'myDate.getFullYear().toString()+ myMonth.toString() + myDate.getDate().toString()',*/
	  	done: function(value, date){
//		    console.log(value); //得到日期生成的值，如：2017-08-18
			var selectedDate = value
			var dateArr = selectedDate.split(" - ");
			selectStartDate = dateArr[0]
			selectEndDate = dateArr[1]
			getCaseCount(5, selectStartDate, selectEndDate)
			getPoliceCaseNum(5,selectStartDate, selectEndDate)
			currentColor1("sameDate3")
	        getAllCase(5,selectStartDate, selectEndDate)
	        getHeatmapData(5,selectStartDate, selectEndDate)
		}
	});
//页面加载完调用
	$(function(){	
		getCaseCount(4,getWeekStartDate(now), getWeekEndDate(now))
		getPoliceCaseNum(4,getWeekStartDate(now), getWeekEndDate(now))
		getAllCase(4,getWeekStartDate(now), getWeekEndDate(now))
		getEchartVideoCount(4, getWeekStartDate(now), getWeekEndDate(now));
		getLawEnforcePro(1, 6);
		getHandlingPro(1, 5);
		getHeatmapData(4,getWeekStartDate(now), getWeekEndDate(now))
	})

	function formatterType(value) {
		if(value=="610626600000"){	
			return "五谷城派出所";
		}else if(value=="610626620000"){
			return "吴仓堡派出所";
		}else if(value=="610626530000"){
			return "周湾派出所";
		}else if(value=="610626510000"){
			return "城镇派出所";
		}else if(value=="610626570000"){
			return "庙沟派出所";
		}else if(value=="610626580000"){
			return "新寨派出所";
		}else if(value=="610626590000"){
			return "王洼子派出所";
		}else if(value=="610626540000"){
			return "白豹派出所";
		}else if(value=="610626520000"){
			return "薛岔派出所";
		}else if(value=="610626560000"){
			return "铁边城派出所";
		}else if(value=="610626610000"){
			return "长城派出所";
		}else if(value=="610626550000"){
			return "长官庙派出所";
		}else {
			return null;
		}
	}
	
	//退出系统
	function userQuit() {
		window.location = requestPslesBasePath + "pslesLogout";
	}
	
	$('#savePw').on('click', function() {
	    var $oldPwd = $('#oldPw').val();
	    var $newPwd = $('#newPw').val();
	    var $reNewPwd = $('#confirmPw').val();
	    var _this = this;
        var regtitleCn = /[^\u4e00-\u9fa5]/;
        // 密码长度应为6~20个字符
        var regtitle = /^[0-9a-zA-Z\D]{6,20}$/;
        if($oldPwd==""||$newPwd==""||$reNewPwd==""){
            alert("密码不能为空！");
            return false;
        }
        if ((!regtitleCn.test($oldPwd))||(!regtitleCn.test($newPwd))||(!regtitleCn.test($reNewPwd))) {
            alert("密码不能含中文！");
            return false;
        }
        if ((!regtitle.test($oldPwd))||(!regtitle.test($newPwd))||(!regtitle.test($reNewPwd))) {
            alert("密码长度应为6~20个字符！");
            return false;
        }
        if($newPwd!=$reNewPwd){
            alert("两次密码输入不一致！");
            return false;
        }
	    $.ajax({
	        type : "POST",
	        dataType:"json",
	        data:{oldPwd:$oldPwd,newPwd:$newPwd},
	        async:false,
	        url : requestPslesBasePath + "userInfo/modifyPwd",
	        success : function(data) {
	        	if (data.respCode == "0") {
	        		userQuit();
                } else {
                    alert(data.respDesc);
                }
	        },
	        error:function(){
				alert("请求后台出错！");
	        }
		});
	});

	//数字自增到某一值动画参数（目标元素,自定义配置） 
  	function NumAutoPlusAnimation(targetEle, options) {  
	/*可以自己改造下传入的参数，按照自己的需求和喜好封装该函数*/ 
	//不传配置就把它绑定在相应html元素的data-xxxx属性上吧 
	options = options || {};   
	var $this = document.getElementById(targetEle), 
	time = options.time || $this.data('time'), //总时间--毫秒为单位    
	finalNum = options.num || $this.data('value'), //要显示的真实数值 
	regulator = options.regulator || 100, //调速器，改变regulator的数值可以调节数字改变的速度   
	step = finalNum / (time / regulator),/*每30ms增加的数值--*/ 
	count = 0, //计数器 
	initial = 0;   
	 	var timer = setInterval(function() {  
	 	count = count + step;  
		if(count >= finalNum) { 
		  	clearInterval(timer); 
		  	count = finalNum; 
		} 
	 //t未发生改变的话就直接返回 
	 //避免调用text函数，提高DOM性能 
	 var t = Math.floor(count); 
	 if(t == initial) return;   
	 	initial = t;   
	 	$this.innerHTML = initial; 
	}, 30); 
  	}  
	
	//打开修改密码窗口
	function showModifyPw() {
		$('#oldPw').val("");
	    $('#newPw').val("");
	    $('#confirmPw').val("");
		$("#popLayer").css("display","block");
		$("#popBox").css("display","block");
	}
	
  	function closeDialog() {
		$("#popLayer").css("display","none");
		$("#popBox").css("display","none");
	}
	function handlingPro(){
    	$(".handlingPro").css("color","#ffffff");
    	$(".handlingVideoPro").css("color","#90a6b7");
    	$(".handlingVideoProList").find("li").remove();
    	$(".handlingProList").css("display","block");
    	$(".handlingVideoProList").css("display","none");
    	
    	$(".Handling").css("display","block");
    	$(".HandingVideo").css("display","none");
    	getHandlingPro(1,6);
    }
    function handlingVideoPro(){
    	$(".handlingPro").css("color","#90a6b7");
    	$(".handlingVideoPro").css("color","#ffffff");
    	$(".handlingProList").find("li").remove();
    	
    	$(".handlingProList").css("display","none");
    	$(".handlingVideoProList").css("display","block");
    	
    	$(".Handling").css("display","none");
    	$(".HandingVideo").css("display","block");
    	getHandlingVideoPro(1,6);
    }
    //跳转更多办案数据页面
    function jumpHanding(){
    	window.location.href = requestPslesBasePath + "/handling/handlingIndex";
    }
    //跳转更多办案音视频页面
    function jumpHandingVideo(){
    	window.location.href = requestPslesBasePath + "handlinghandlingVideoIndex";
    }
    //办案数据详情页面
    function jumpHandlingDetail(obj){
		window.open(requestPslesBasePath + "handling/handlingDetailIndex?code="+ obj.CODE);
    }
    //办案音视频详情页面
	function jumpHandlingVideoDetail(obj){
		window.open(requestPslesBasePath + "handling/handlingVideoDetailIndex?code="+ obj.CODE);
    }
    
	/* laydate.render({
	  	elem: '#times',
	  	type: 'date',
	  	range: "-",
	  	format:'YYYY-MM-dd',
	  	done: function(value, date){
			var selectedDate = value
			var dateArr = selectedDate.split(" - ");
			dtStart = dateArr[0];
			dtEnd = dateArr[1];
			getAccessCount("",dtStart,dtEnd);
		}
	});
	
	function sameCount(searchTime){
		$("#times").val("")
		getAccessCount(searchTime,"","");
	} */
	
	sameCount("today","","");
	function sameCount(searchTime){
		if('today' == searchTime){
			$(".liDay").css("color","#FFFFFF")
			$(".liWeek").css("color","#90a6b7")
			$(".liMonth").css("color","#90a6b7")
			$(".liYear").css("color","#90a6b7")
		}
		if('week' == searchTime){
			$(".liDay").css("color","#90a6b7")
			$(".liWeek").css("color","#FFFFFF")
			$(".liMonth").css("color","#90a6b7")
			$(".liYear").css("color","#90a6b7")			
		}
		if('month' == searchTime){
			$(".liDay").css("color","#90a6b7")
			$(".liWeek").css("color","#90a6b7")
			$(".liMonth").css("color","#FFFFFF")
			$(".liYear").css("color","#90a6b7")
		}
		if('year' == searchTime){
			$(".liDay").css("color","#90a6b7")
			$(".liWeek").css("color","#90a6b7")
			$(".liMonth").css("color","#90a6b7")
			$(".liYear").css("color","#FFFFFF")
		}
		//接警数
		$.ajax({
	        type: "post",
	        url: requestPslesBasePath + "handling/selectHandlingCount",
	        data: {
	        	searchTime:searchTime
	        },
	        cache: false,
	        dataType: "json",
	        success: function (data,textStatus,jqXHR){
	        	console.log(data)
	        	$(".startUseAllCount").html(data.STARTUSEALLCOUNT);
	        	$(".startUseCount").html(data.STARTUSECOUNT);
	        	$(".endUseCount").html(data.ENDUSECOUNT);
	        },
	        error:function (data,textStatus) {      
	             console.log(data)
	        },
	        beforeSend: function(){      
	        },     
	        complete: function(){      
	           	$(".loadingWrap").remove();
	        }  
     	});  
	}
	function jumpHandlingCountDetail(){
		window.location.href = requestPslesBasePath + "handling/handlingCountIndex";
	}
</script>
<%@include file="/WEB-INF/views/common/psles-footer.jsp"%>
