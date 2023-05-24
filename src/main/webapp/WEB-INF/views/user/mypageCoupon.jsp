<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>couponList</title>
<style>
	#wrapper{
	margin:0 auto;
	overflow:hidden;
	background:#F5F5F5;
	text-align:center;
}
.couponlistWrap{
	width:50%;
	margin:0 auto;
	text-align:left;
}
h1{
	font-size:30px;
	margin: 20px 0 20px 0;
}
.couponWrap{
	width:100%;
	height:90px;
	background:white;
	display:flex;
	flex-direction:column;
	padding:25px;
}
.title{
	font-style:bold;
	font-size:20px;
}
.condition{
	font-size:15px;
	margin-top:10px;
	color:gray;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/component/homeHeader.jsp" %>
<div id="wrapper">
	<div class="couponlistWrap">
		<h1>보유 쿠폰 ${couponSize }</h1>
		<c:forEach items="${couponList }" var="coupon">
			<div class="couponWrap">
				<c:if test="${coupon.discountRate!=0 }">
					<div class="title">${coupon.discountRate }%</div>
				</c:if>
				<c:if test="${coupon.discountAmount!=0 }">
					<div class="title">${coupon.discountAmount }원</div>
				</c:if>
				<div class="title">${coupon.couponName }</div>
				<div class="condition">
				<div>${coupon.boundary }원 이상 구매시 사용가능</div>
				<div>${coupon.dday }까지</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
</div>
<%@ include file="/WEB-INF/views/component/homeFooter.jsp" %>
</body>
</html>