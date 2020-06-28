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
		background: url(<%=request.getContextPath()%>/img/video.png)no-repeat;
		background-size: 100% 100%;
		position: relative;
		color: #FFFFFF;
	}
	.queryCondition{
		width:99%;
		color: #90a6b7;
		font-size: 10px;
		display: flex;
		flex-direction: row;
		align-items: center;
		margin-top: 1%;
	}
	.queryCondition div{
		width: 18%;
		height: 80%;
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
		margin-top: 10%;
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
	 	text-align: left;
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
</style>
<div class="layout">
	<div class="leftInfo">
		<p>案件列表</p>
		<div class="queryCondition">
			<div>
				<p>案件编号</p>
				<input type="text" name="" id="ajbh" value="" placeholder="请输入案件编号"/>
			</div>
			<div>
				<p>案件名称</p>
				<input type="text" name="" id="ajmc" value="" placeholder="请输入案件名称"/>
			</div>
			<div>
				<p>简要案情</p>
				<input type="text" name="" id="jyaq" value="" placeholder="请输入简要案情"/>
			</div>
			<div>
				<p>受理单位</p>
				<select id="sldw" name="" value="" class="check">
					<option value="" class="option">请选择案件受理单位</option>
					<option value="610626600000" class="option">五谷城派出所 </option>
                    <option value="610626620000" class="option">吴仓堡派出所</option>
                    <option value="610626530000" class="option">周湾派出所</option>
                    <option value="610626510000" class="option">城镇派出所</option>
                    <option value="610626570000" class="option">庙沟派出所</option>
                    <option value="610626580000" class="option">新寨派出所</option>
                    <option value="610626590000" class="option">王洼子派出所  </option>
                    <option value="610626540000" class="option">白豹派出所</option>
                    <option value="610626520000" class="option">薛岔派出所</option>
                    <option value="610626560000" class="option">铁边城派出所</option>
                    <option value="610626610000" class="option">长城派出所</option>
                    <option value="610626550000" class="option">长官庙派出所</option>
				</select>
			</div>
			<div>
				<p>受理时间</p>
				<input type="text" id="slsj" class="form-control" placeholder="例如：20190303"/>
			</div>
			<div>
				<p></p>
				<input type="button" value="查询"  class="queryBtn" id="queryBtn"/>
			</div>
		</div>
		<table border="1" cellspacing="0" id="caseTable">
			<thead>
				<tr>
					<th width="40">序号</th>
					<th width="70">案件编号</th>
					<th width="150">案件名称</th>
					<th width="120">案件类别</th>
					<th width="70">案件状态</th>
					<th>简要案情</th>
					<th width="150">受理单位</th>
					<th width="120">受理时间</th>
					<th width="120">操作</th>
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
	
	function getChuJingCaseCount(curpage) {
		var startNum = (curpage - 1) * length;
		$.ajax({
	        type: "post",
	        url: requestPslesBasePath + "lawenforce/getAllCaseByPage",		       
	        data: {
	        	curPage: curpage,
	        	length: length,
	        	start: startNum,
	        	ajmc: $('#ajmc').val(),
	        	jyaq: $('#jyaq').val(),
	        	sldw: $("#sldw").val(),
	        	slsj: $('#slsj').val(),
	        	ajbh: $('#ajbh').val()
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
				    tr += "<td>" + (data.aaData[i].AJBH==null?"":data.aaData[i].AJBH) + "</td>";
				    tr += "<td>" + (data.aaData[i].AJMC==null?"":data.aaData[i].AJMC) + "</td>";
				    tr += "<td>" + (data.aaData[i].AJLB==null?"":data.aaData[i].AJLB) + "</td>";
				    tr += "<td>" + (data.aaData[i].AJZT==null?"":data.aaData[i].AJZT) + "</td>";
				    tr += "<td>" + (data.aaData[i].JYAQ==null?"":data.aaData[i].JYAQ) + "</td>";
				    tr += "<td>" + (data.aaData[i].BADW==null?"":data.aaData[i].BADW) + "</td>";
				    tr += "<td>" + (data.aaData[i].SLSJ==null?"":data.aaData[i].SLSJ) + "</td>";
				    tr += "<td style=\"text-align:center;\">";
				    if (null != data.aaData[i].ID && "" != data.aaData[i].ID) {
					    tr += "<a style=\"color:#ffffff;text-decoration:none;margin-right:10px;\" onclick=\"resumeWaring('" + data.aaData[i].AJBH + "')\">恢复预警</a>";
				    }
				    tr += "<a style=\"color:#ffffff;text-decoration:none;\" href=\"" + requestPslesBasePath + "lawCaseDetailIndex?pagename=allcase&&caseNumber=" + data.aaData[i].AJBH + "&&type=" + data.aaData[i].TYPE + "\">查看详情</a></td>";
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
</script>
<%@include file="/WEB-INF/views/common/psles-footer.jsp"%>