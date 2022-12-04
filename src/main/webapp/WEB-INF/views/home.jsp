
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
	<link href="${pageContext.request.contextPath}/resources/css/baskinrobbins.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/js/baskinrobbins.js" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/js/swipe.js" rel="stylesheet">
</head>
<body id="br_main">
<%@ include file="/WEB-INF/views/components/header.jsp" %>
<%@ include file="/WEB-INF/views/components/common.jsp" %>
<%@ include file="/WEB-INF/views/components/footer.jsp" %>
</body>
</html>
