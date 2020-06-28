<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/psles-taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>登录-${aifunc:prop("psles.project.name.cn")}</title>
	<meta HTTP-EQUIV="pragma" CONTENT="no-cache"> 
	<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
	<meta HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
	<style type="text/css">
		@font-face {
		  font-family: 'iconfont';  /* project id 919031 */
		  src: url('//at.alicdn.com/t/font_919031_tkm4wz548d.eot');
		  src: url('//at.alicdn.com/t/font_919031_tkm4wz548d.eot?#iefix') format('embedded-opentype'),
		  url('//at.alicdn.com/t/font_919031_tkm4wz548d.woff') format('woff'),
		  url('//at.alicdn.com/t/font_919031_tkm4wz548d.ttf') format('truetype'),
		  url('//at.alicdn.com/t/font_919031_tkm4wz548d.svg#iconfont') format('svg');
		}
	    .iconfont {
	      font-family:"iconfont" !important;      
	      font-size:16px;
	      font-style:normal;
	      -webkit-font-smoothing: antialiased;
	      -moz-osx-font-smoothing: grayscale;
	    }
		*{
			margin: 0;
			padding: 0;
			border: 0px;
		}
		body {
			width: 100%;
			overflow: hidden;
			background: url(<%=request.getContextPath()%>/img/indexBg.png) no-repeat;
		}
		.loginBox {
			width: 300px;
			height: 180px;
			background: #FFFFFF;
			position: absolute;
			left: 50%;
			top: 50%;
			border-radius: 4px;
			padding: 20px;
		}
		#loginBtn{
			width: 260px;
			height: 34px;
			text-align: center;
			line-height: 24px;
			color: #FFFFFF;
			font-size: 14px;
		}
		input{
			outline: none !important;
		}
		.rightTime{
		    float:right;
		    font-size:16px;
		    color:#ffffff;
		    margin: 10px 10px;
		}
		.error{
		    color: #a22020;
		    margin: 5px auto 0;
		}
	</style>
	<!--[if IE 8]>
		<style type="text/css">
			 body{
			 	background-size: cover;
			 	background-repeat: no-repeat;
			 }
			 .loginBox{
			 	margin-left: -50px;
			 	margin-top: -100px;
			 }
		</style>
	<![endif]-->
	<script src="<%=request.getContextPath()%>/plugin/jquery-2.1.3.min.js"></script>
</head>
<body>
	<div class="rightTime">
		<time id="timeDate"></time>
	</div>
	<div class="loginBox">
		<form class="form-horizontal m-t-20" id="psles-login-form" method="post" action="<c:url value="/authc/pslesLogin"/>">
			<input id="clientIP" name="clientIP" type="hidden" />
			<div class="input-group">
			    <span class="input-group-addon"><i class="iconfont">&#xe611;</i></span>
			    <input type="text" class="form-control" placeholder="账号" name="userName" id="psles-userInput">
			</div>
			<div class="input-group" style="margin-top:10px;">
			    <span class="input-group-addon"><i class="iconfont">&#xe63d;</i></span>
			    <input type="password" class="form-control" placeholder="密码" name="password" id="psles-pwdInput">
			</div>
			<div class="error">${authcFailResult}</div>
			<div class="input-group" style="margin-top:10px;">
				<input id="loginBtn" class="btn btn-primary" type="button" value="登  录">
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function($){
			if (BrowserType() == "IE6" || BrowserType() == "IE7" || BrowserType() == "IE8"){
			}else{
				$("body").css("background-size","100% 100%")
				$("body").css("position","relative")
				$(".loginBox").css("margin-left","-150px")
				$(".loginBox").css("margin-top","-90px")
			}
			var body = document.querySelector("body");
			var h = window.screen.availHeight;
			body.style.height = h + "px";
			
			function getIPs(callback){
				var ip_dups = {};
	
		        //compatibility for firefox and chrome
		        var RTCPeerConnection = window.RTCPeerConnection
		            || window.mozRTCPeerConnection        || window.webkitRTCPeerConnection;
		        var mediaConstraints = {
		            optional: [{RtpDataChannels: true}]
		        };
	
		        //firefox already has a default stun server in about:config
		        //    media.peerconnection.default_iceservers =
		        //    [{"url": "stun:stun.services.mozilla.com"}]
		        var servers = undefined;
	
		        //add same stun server for chrome
		        if(window.webkitRTCPeerConnection)
		            servers = {iceServers: [{urls: "stun:stun.services.mozilla.com"}]};
	
		        //construct a new RTCPeerConnection
		        var pc = new RTCPeerConnection(servers, mediaConstraints);
	
		        //listen for candidate events
		        pc.onicecandidate = function(ice){
	
		            //skip non-candidate events
		            if(ice.candidate){
	
		                //match just the IP address
		                var ip_regex = /([0-9]{1,3}(\.[0-9]{1,3}){3})/
		                var ip_addr = ip_regex.exec(ice.candidate.candidate)[1];
	
		                //remove duplicates
		                if(ip_dups[ip_addr] === undefined)
		                    callback(ip_addr);
	
		                ip_dups[ip_addr] = true;
		            }
		        };
	
		        //create a bogus data channel
		        pc.createDataChannel("");
	
		        //create an offer sdp
		        pc.createOffer(function(result){
	
		            //trigger the stun server request
		            pc.setLocalDescription(result, function(){});
	
		        }, function(){});
			}
			if(window.parent.length){
		        window.parent.location.reload();
			}
		    var isIE = navigator.userAgent.indexOf("MSIE")>-1;
		    function myBrowser() {
		        var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
		        if (userAgent.indexOf("MSIE") != -1) {
		            var version = userAgent.match(/MSIE\s\d+/);
		            var vNumber = version[0].split(" ")[1];
		            return vNumber;
		        }
		    }
		    if(myBrowser()<=9&&isIE){
		       $("input:text").placeholder();
		        $("input:password").placeholder();
		    }
		    //时间
		    var newDate = new Date();
		    var week = ["日","一","二","三","四","五","六"];
		    $("#timeDate").html(
		        newDate.getFullYear()+'年'+(newDate.getMonth()+1)+'月'+newDate.getDate()+'日 星期'+week[newDate.getDay()]
			);
			//登录
		    getIPs(function(ip){
		    	$("#clientIP").val(ip);
		    });
		    
			$("#loginBtn").on('click',function() {
				var name = $.trim($("#psles-userInput").val());
				var pwd = $.trim($("#psles-pwdInput").val());
				// var code = $.trim($("#dep-checkCode").val());
				if (name == '') {
					alert('账号不能为空！');
					return;
				} else if (pwd == '') {
		            alert('密码不能为空！');
		            return;
		        }
				$(this).attr('disabled',true).val('登录中...');
				$(this).closest('div').addClass('disabled');
				$("#psles-login-form").submit();
			});
			
			$("#psles-userInput").on('click',function() {
				//$(this).val("");
		        //$(".error").text("");
			}).keydown(function(e) {
				if (e.keyCode == 13 && $.trim($(this).val()) != "") {
					if ($.trim($("#psles-pwdInput").val()) != "") {
						$("#loginBtn").click();
					} else {
						$("#psles-pwdInput").focus();
					}
				}
			});
			
			$("#psles-pwdInput").on('click',function() {
				//$(this).val("");
		        //$(".error").text("");
			}).keydown(function(e){
				if (e.keyCode == 13 && $.trim($(this).val()) != "") {
					if ($.trim($("#psles-userInput").val()) != "") {
						$("#loginBtn").click();
					}
				}
			});
		});
		function BrowserType() {
			var e = navigator.userAgent;
			var t = e.indexOf("Opera") > -1;
			var i = window.ActiveXObject || "ActiveXObject" in window;
			var n = e.indexOf("Edge") > -1;
			var a = e.indexOf("Firefox") > -1;
			var r = e.indexOf("Safari") > -1 && e.indexOf("Chrome") == -1;
			var o = e.indexOf("Chrome") > -1 && e.indexOf("Safari") > -1 && !n;
			if (i) {
				var l = new RegExp("MSIE (\\d+\\.\\d+);");
				l.test(e);
				var s = parseFloat(RegExp["$1"]);
				if (e.indexOf("MSIE 6.0") != -1) {
					return "IE6"
				} else {
					if (s == 7) {
						return "IE7"
					} else {
						if (s == 8) {
							return "IE8"
						} else {
							if (s == 9) {
								return "IE9"
							} else {
								if (s == 10) {
									return "IE10"
								} else {
									if (e.toLowerCase().match(
											/rv:([\d.]+)\) like gecko/)) {
										return "IE11"
									} else {
										return "0"
									}
								}
							}
						}
					}
				}
			}
			if (a) {
				return "FF"
			}
			if (t) {
				return "Opera"
			}
			if (r) {
				return "Safari"
			}
			if (o) {
				return "Chrome"
			}
			if (n) {
				return "Edge"
			}
		}
	</script>
</body>
</html>