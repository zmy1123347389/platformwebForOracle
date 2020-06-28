<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/psles-taglib.jsp"%>
<%@include file="/WEB-INF/views/common/psles-header.jsp"%>
<style type="text/css">			
	*{
		margin: 0;
		padding: 0;
		border: 0px;
	}
	body{
		width: 100%;
		overflow: hidden;
		background: url(<%=request.getContextPath()%>/img/video.png);
		background-size: cover;
        background-repeat: no-repeat;
		position: relative;
		color: #FFFFFF;
	}
	.queryCondition{
		width:auto;
		color: #90a6b7;
		font-size: 10px;
		display: flex;
		flex-direction: row;
		align-items: center;
		margin-top: 1%;
		padding-left: 50px;
	}
	.queryCondition div{
		width: 90px;
		display: flex;
		flex-direction: column;
		align-items: flex-start;
	}
	.queryBtn{
		width: 70px;
		text-align: center;
		border: 1px solid rgba(144,166,183,0.3);
		color: rgba(144,166,183,0.5);
		cursor: pointer;
		margin-top: 12%;
		height:30px;
	}
	select,input{
		height: 30px;
		background: transparent;
		margin-top: 5%;
		border: 1px solid rgba(144,166,183,0.3);
		color: #FFFFFF;
		padding-left: 2%;
		width: 95%;
	}
	.queryCondition p{
		font-size: 10px;
	}
	 input::-webkit-input-placeholder{
	 	color: rgba(144,166,183,0.5);
	 }
	 select{
	 	color: rgba(144,166,183,0.5)
	 }
	 .videoList{
	 	width: 20%;
	 	height: 25px;			 	
	 }
	 .videoList span{
	 	display: inline-block;
	 	width: 40%;
	 	height: 100%;
	 	line-height:25px;
	 	text-align: center;
	 	color: #FFFFFF;
	 	border: 1px solid rgba(144,166,183,0.3);
		font-size: 10px;
	 }
	 .videoList span:nth-child(2){
	 	color: rgba(144,166,183,0.5)
	 }
	 table{
	 	font-size: 10px;
	 	color: rgba(144,166,183,0.8);
	 	width: 99%;
	 	margin: 2% 3% 0% 0%;
	 	text-align: left;
	 }
	 th{			 
	 	font-weight: normal;
	 	height:35px;
	 	cursor: default;	
	 	text-align: center;	 	
	 }
	 tr{
	 	cursor: pointer;
	 }
	 tr:nth-child(2n+1){
	 	background: rgba(144,166,183,0.1);
	 }
	 tr:nth-child(2n){
	 	background: transparent;
	 }
	 td{				
	 	padding: 10px;
	 	text-align: center;
	 }
	 tr:nth-child(1):hover{
	 	background: rgba(144,166,183,0.1);
	 }
	 tr:hover{
	 	background: rgba(68,255,255, 0.25);
	 }
	 .selectAllVideo{
	 	color: rgba(144,166,183,0.8);
	 	border: 1px solid rgba(144,166,183,0.3);
	 	margin-left: 10%;
	 	background: rgba(144,166,183,0.3);
	 	padding: 0.5% 2%;
	 	cursor: pointer;
	 }
	 .returnImg{
		width:30px;
		margin-top: 0.5%;
		margin-left: 1%;
		cursor: pointer;
	}
	 
	 .layout{
	 	width: 98%;
	 	height: 91%;
	 	margin: auto;
	 	margin-top: 1%;			 
	 	display: flex;
	 	justify-content: space-between;
	 }
	 .leftInfo{
	 	width: 100%;
	 	height: 93%;
	 	background: url(<%=request.getContextPath()%>/img/listvideo.png)no-repeat;
	 	background-size: 100% 100%;	 
	 	padding: 1.5%;	
	 }
	 .basicInfo{
	 	width: 93%;
	 	height:60%;
	 	margin-top: 5%;
	 	background: url(<%=request.getContextPath()%>/img/basicv.png)no-repeat;
	 	background-size: 100% 100%;	 	
	 	padding:2% 4%;
	 	/*border: 1px solid green;*/
	 }
	 .basicInfoBox, .basicInfoBox1, .basicInfoBox2{
	 	height:100%;		 	
	 	width: 100%;
	 	/*border: 1px solid red;*/
	 }
	 .basicInfo p{
	 	color: rgba(144,166,183,0.8);
	 	font-size: 10px;
	 	height: 6.5%;
	 	display: flex;
	 	justify-content: space-between;
	 	align-items: flex-start;
	 	
	 }
	 .basicInfo p:nth-child(1){
	 	color: #FFFFFF;
	 	font-size: 15px;			 	
	 }		
	 .basicInfo p span:nth-child(1){
	 	width: 40%;
	 }
	  .basicInfo p span:nth-child(2){
	 	width: 57%;			 	
	 }
    .option{
    	background: #132456;
    	color: #FFFFFF;
    }
    tr.on td{
		background: rgba(68,255,255, 0.25);
	}
	
	#pageBox{
       	height: 50px;
	 	display: flex;
		flex-direction: row;
		justify-content: space-between;
		align-items: center;
	}
	.rightPage span{
		border: 1px solid rgba(144,166,183,0.3);
		width: 100px;
		color:#90a6b7;   			
		cursor: pointer;
		font-size: 12px;	
		height:30px;
		text-align: center;
		line-height: 30px;
     }	       
    .rightPage span:hover{
         cursor: pointer;
         color: #FFFFFF;
     }
     #allPages{	        	
     	color: #FFFFFF;	     
     }
     #curpage{	        	
     	color: #FFFFFF;	     
     }
     #pageBox p{
     	color: #90a6b7;	
     	font-size: 12px; 
     }
     .rightPage{
     	display: flex;
		justify-content: flex-end;
		align-items: center;
		margin-right: 25px;
	}
	.rightPage span {
		margin-right: 4%;
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
	.queryCondition{
		width:auto;
		color: #90a6b7;
		font-size: 10px;
		display: flex;
		flex-direction: row;
		align-items: center;
		margin-top: 1%;
		padding-left: 50px;
	}
	.queryCondition div{
		width: 90px;
		display: flex;
		flex-direction: column;
		align-items: flex-start;
	}
</style>
<div class="layout">
	<div class="leftInfo">
		<h4><img src="<%=request.getContextPath()%>/img/return.png" class="returnImg" onclick="returnBasic()"/>办案数据列表</h4>
		<div class="queryCondition">
			<div class="queryInput">
				<label>今日<input name="searchTime" type="radio" value="today" onclick="resertDate()"/></label>
			</div>
			<div class="queryInput">
				<label>本周<input name="searchTime" type="radio" value="month" onclick="resertDate()"/></label>
			</div>
			<div class="queryInput">
				<label>本年<input name="searchTime" type="radio" value="year" onclick="resertDate()"/></label>
			</div>
			<div style="width: 160px;height: 60px;">
				<label>开始时间-结束时间<input type="text" id="time" name="time" class="layui-input" style='height:30px;cursor:pointer;margin-left: 0px;background: transparent;border: 1px solid rgba(144,166,183,0.3);color: #FFFFFF;' placeholder="Y-M-D 至 Y-M-D"/>
				</label>
			</div>
			<p class="videoList" style="margin-left:50px;margin-top: 20px;">
				<span onclick="associatedSet()" class= "associated">已关联</span>
				<span onclick="unrelatedSet()" class="unrelated">未关联</span>
			</p>
			<div>
				<label><input type="button" value="查询" class="queryBtn" id="queryBtn"/></label>
			</div>
		</div> 
		<table border="1" cellspacing="0" id="caseTable">
			<thead>
				<tr>
					<th>序号</th>
					<th>案件编号</th>
					<th>办案编号</th>
					<th>案件名称</th>
					<th>案件类别</th>
					<th>案件原因</th>
					<th>嫌疑人</th>
					<th>办案部门</th>
					<th>办案场所</th>
					<th>入区时间</th>
					<th>出区时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<div id="pageBox">
			<p class="allPages">共&nbsp;<span id="allPages"></span>&nbsp;页&nbsp;&nbsp;第&nbsp;<span id="curpage"></span>&nbsp;页&nbsp;&nbsp;共&nbsp;<span id="totalSize"></span>&nbsp;条</p>
			<div class="rightPage">
				<span id="first" onclick ="first()">首页</span>
				<span id="prev" onclick ="prePage()">上一页</span>					   
		        <span id="next" onclick ="nextPage()">下一页</span>
		        <span id="last" onclick ="last()">末页</span>
			</div>
		</div>   
   </div>
</div>		
<script src="<%=request.getContextPath()%>/plugin/laydate/laydate.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	var seqno = 0;
	var h = document.documentElement.clientHeight;
	var body = document.querySelector("body")
	body.style.height = h + "px";
	function returnBasic(){
		window.location.href = requestPslesBasePath + "pslesIndex";
	}
	
	var totalPages = "";
	var currentPage = 1;
	var length = 7;
	$(".queryBtn").on('click',function() {
		seqno = 0;
		getChuJingCaseCount(1);
    });
	var associated = "";
	var unrelated = "";
	function getChuJingCaseCount(curpage) {
		var startNum = (curpage - 1) * length;
		var searchTime = $("input[name='searchTime']:checked").val();
    	var searchTime = searchTime;
    	var fullName = $("#fullName").val();
    	var time = $("#time").val().split("-");
    	if(!isEmpty(time)){
    		var dtStart = time[0]+"-"+time[1]+"-"+time[2];
    		var dtEnd = time[3]+"-"+time[4]+"-"+time[5];
    	}
		$.ajax({
	        type: "post",
	        url: requestPslesBasePath + "handling/getHandlingPage",  
            data: {
            	searchTime:searchTime,
            	fullName:fullName,
            	dtStart:dtStart,
            	dtEnd:dtEnd,
            	searchTime:searchTime,
	        	curPage: curpage,
	        	length: length,
	        	start: startNum,
	        	associated:associated,
	        	unrelated:unrelated
	        },
	        cache:false,
	        dataType: "json",
	        success: function (data,textStatus,jqXHR) {
	        	allData = data.iTotalRecords;
		        totalPages = Math.ceil(allData / length);
		        var tr = "";
			    for(var i=0;i<data.aaData.length;i++) {    //遍历data数组   
			    	seqno = seqno + 1;
			    	tr += "<tr>";
			    	tr += "<td>" + seqno + "</td>";
			    	tr += "<td style=\"text-align:center;\">";
			    	if(!isEmpty(data.aaData[i].ajbh)){
				    	tr += "<a style=\"color:#ffffff;text-decoration:none;\" href=\"" + requestPslesBasePath + "lawCaseDetailIndex?caseNumber=" + data.aaData[i].ajbh + "\"><font color=\"#44FFFF\">"+data.aaData[i].ajbh+"</font></a></td>";
			    	}
				    tr += "<td>" + (data.aaData[i].code==null?"":data.aaData[i].code) + "</td>";
				    tr += "<td>" + (data.aaData[i].fullName==null?"":data.aaData[i].fullName) + "</td>";
				    tr += "<td>" + (data.aaData[i].caption==null?"":data.aaData[i].caption) + "</td>";
				    tr += "<td>" + (data.aaData[i].reason==null?"":data.aaData[i].reason) + "</td>";
				    tr += "<td>" + (data.aaData[i].name==null?"":data.aaData[i].name) + "</td>";
				    tr += "<td>" + (data.aaData[i].dept==null?"":data.aaData[i].dept) + "</td>";
				    tr += "<td>" + (data.aaData[i].inquestDeptCaption==null?"":data.aaData[i].inquestDeptCaption) + "</td>";
				    tr += "<td>" + (data.aaData[i].dtStartUseTime==null?"":data.aaData[i].dtStartUseTime) + "</td>";
				    tr += "<td>" + (data.aaData[i].dtEndUseTime==null?"":data.aaData[i].dtEndUseTime) + "</td>";
				    tr += "<td style=\"text-align:center;\">";
				    tr += "<a style=\"color:#ffffff;text-decoration:none;\" href=\"" + requestPslesBasePath + "handling/handlingDetailIndex?code=" + data.aaData[i].code + "\"><font color=\"#44FFFF\">[查看详情]</font></a></td>";
				    tr += "</tr>";
			    	$("#caseTable tbody").html(tr);
			    }		
			    if (0 < allData) {
			    	$("#allPages").text(totalPages);
			    	$("#curpage").text(curpage);
			    	$("#totalSize").text(allData);
			    } else {
			    	$("#allPages").text("0");
			    	$("#curpage").text("0");
			    	$("#totalSize").text("0");
			    	$("#caseTable tbody").html("");
			    }	
			    $(".loadingWrap").remove();
	        },
	        error:function (data,textStatus) { 
	        	alert("请求案件数据失败，请联系管理员！");
	        	$(".loadingWrap").remove();
	        },
	        beforeSend: function(){  
	        	$('<div class="loadingWrap"></div>').appendTo("body");
	        },     
	        complete: function(){      
	        }  
	 	});  
	}
	
	//恢复案件预警
	function resumeWaring(ajbh) {
		var con = confirm("请确认是否恢复该案件的预警！");
		if (con == true) {
			$.ajax({
		        type: "post",
		        url: requestPslesBasePath + "lawproblem/lawWarningRsume",		       
		        data: {
		        	ajbh: ajbh
		        },
		        cache:false,
		        success: function (data,textStatus,jqXHR) {
		        	getChuJingCaseCount(currentPage);
		    		alert("执法问题预警数据恢复成功！！！");
		        },
		        error:function (data,textStatus) {
		        	alert("执法问题预警数据恢复失败！");
		        },
		        beforeSend: function(){      
		        },     
		        complete: function(){      
		        }  
		 	});
		}
	}
	
	function prePage() {
		if (currentPage > 1) {
			currentPage = currentPage - 1;
			seqno = (currentPage - 1) * length;
			getChuJingCaseCount(currentPage);
		}
	}
	
	function first() {
		if (currentPage != 1) {
			currentPage = 1;
			seqno = 0;
			getChuJingCaseCount(currentPage);
		}
	}
	
	function last() {
		if (currentPage != totalPages) {
			currentPage = totalPages;
			seqno = (currentPage - 1) * length;
			getChuJingCaseCount(currentPage);
		}
	}
	
	function nextPage() {
		if (currentPage < totalPages) {
			currentPage = currentPage + 1;
			seqno = (currentPage - 1) * length;
			getChuJingCaseCount(currentPage);
		}
	}
	
	getChuJingCaseCount(1);
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
	$(function(){
		laydate.render({
		  elem: '#time'
		  ,range: true
		  ,done: function(value, date){ //监听日期被切换
	     	    $('input[type=radio][name="searchTime"]:checked').attr("checked", false);
		  }
		});
	})
	function associatedSet(){
		$(".associated").css("color","#FFFFFF");
		$(".unrelated").css("color","rgba(144,166,183,0.5)");
		associated = "true";
		unrelated = "";
		seqno = 0;
		getChuJingCaseCount(1);
	}
	function unrelatedSet(){
		$(".associated").css("color","rgba(144,166,183,0.5)");
		$(".unrelated").css("color","#FFFFFF");
		associated = "";
		unrelated = "true";
		seqno = 0;
		getChuJingCaseCount(1);
	}
	function resertDate(){
		$("#time").val("")
	}
</script>
<%@include file="/WEB-INF/views/common/psles-footer.jsp"%>
