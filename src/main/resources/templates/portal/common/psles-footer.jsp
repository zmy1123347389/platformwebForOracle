<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${PSLES_IS_AJAX==false}">
<script type="text/javascript">
// $.ajaxSetup({
// 	type:'post',
//     cache:false,
//     complete:function(XMLHttpRequest, textStates) {
//     	var responseJSON = XMLHttpRequest.responseJSON;
//         if(responseJSON){
//         	if(responseJSON.respCode=="403" || responseJSON.respCode=="500" ){//无权访问
//         		$(".dnLoading").remove();
//             	swal(responseJSON.respDesc,'','warning');
//         	}else if(responseJSON.respCode=="600" || responseJSON.respCode=="601"){//用户被踢出
//         		 swal({
//                      title				: responseJSON.respDesc,
//                      type				: "warning",
//                      closeOnConfirm		: false,
//                      confirmButtonText	: "确定",
//                      confirmButtonColor	: "#ec6c62"
//                  }, function() {
//                  	if(window.parent.length){
//                  		window.parent.location.href=requestDepBasePath+"depLogout";
//                  	}else{
//                  		window.location.href=requestDepBasePath+"depLogout";
//                  	}
//                  });
//         	}
//         } 
//     }
// });
// var url=window.location.pathname.substr(1,window.location.pathname.length).replace("pha-web/","").split("/");
// var pageUrl=url.join("_");
// var pageOperArr = JSON.parse(localStorage.getItem('caiNiao_userInfo')).menuOperMap[pageUrl];//获取该页面隐藏按钮id集合
// var str="";
// var idArrStr="";
// if(Array.isArray(pageOperArr)&&pageOperArr.length>0){
//     $.each(pageOperArr,function(index,item){
//         if(pageUrl=="companyFlowData_companyFlowDataIndex"){
//                 if(item=="checkPendTab"){//待审批tab隐藏
//                     $(".log-list .log-Item").eq(2).hide();
//                 }
//                 if(item=="submittPendTab"){
//                     $(".log-list .log-Item").eq(3).hide();
//                 }
//         }else if(pageUrl=="menu_menuIndex"){
//             if(item=="addFunction"){//菜单
//                 $("#addFunction").remove();
//             }
//         }
//         idArrStr+="#"+item+","
//         if($(".hoverTip").length>0&&$(".hoverTip #"+item).length>0){//判断页面是否有树结构
//           $(".hoverTip #"+item).remove();
//         }
//     })
//     idArr=idArrStr.substr(0,idArrStr.length-1);
//     str="<style>"+idArr+"{display:none!important}<style>";
//     $("body").append(str);

//     var num=0;
//     var timer=setInterval(function(){
//         var $table=$.fn.dataTable;
//         if($table&&$table.tables().length>0){
//             $.each( $table.tables(), function () {
//                 var $this=$(this);
//                 $.each($("#"+$this.attr("id")+"_wrapper").find(".dataTable_caoZuo"),function(){
//                     var hideBtnNum=0;
//                     $(this).find(".btnShow a").each(function(index,item){
//                         var $that=$(item);
//                         if($that.css("display")=="none"){
//                             hideBtnNum++;
//                         }
//                     })
//                     if($(this).find(".btnShow a").length==hideBtnNum){//按钮权限
//                         $(this).css("display","none");
//                     }
//                 })
//                 $this.DataTable().on('draw.dt', function () {
//                         $.each($("#"+$this.attr("id")+"_wrapper").find(".dataTable_caoZuo"),function(){
//                             var hideBtnNum=0;
//                             $(this).find(".btnShow a").each(function(index,item){
//                                 var $that=$(item);
//                                 if($that.css("display")=="none"){
//                                     hideBtnNum++;
//                                 }
//                             })
//                             if($(this).find(".btnShow a").length==hideBtnNum){//按钮权限
//                                 $(this).css("display","none");
//                             }
//                         })

//                 } );
//             } );
//             clearInterval(timer);
//         }else if(num==20){
//             clearInterval(timer);
//         }else{
//             num++;
//         }
//     },500)
// }
</script>
</body>
</html>
</c:if>