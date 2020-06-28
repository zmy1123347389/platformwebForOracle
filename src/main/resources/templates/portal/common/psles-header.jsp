<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/META-INF/tags/aifunc.prop.tld" prefix="aifunc" %>
<c:if test="${PSLES_IS_AJAX==false}">
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${aifunc:prop("psles.project.name.cn")}</title>
	<meta HTTP-EQUIV="pragma" CONTENT="no-cache"> 
	<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
	<meta HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="<%=request.getContextPath()%>/plugin/jquery-2.1.3.min.js"></script>
	<script type="text/javascript">
		var requestPslesBasePath = "${PSLES_CONTEXT_PATH}" + "/";
	</script>
</head>
<body>
</c:if>