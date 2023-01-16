<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>mypage</title>
</head>
<style>
.mypageWrap{
	margin:0 auto;
	overflow:hidden;
	background:#F5F5F5;
	text-align:center;
}
.menuWrap{
	width:820px;
	heigth:155px;
	margin:0 auto;
	margin-top:50px;
}
.menuWrap div{
	display:inline-block;
	width:155px;
	height:155px;
	background-color:white;
	text-align:center;
	line-height:250px;
	margin-left:10px;
}
.deliveryImg{
	background:url(/resources/images/local_shipping_FILL0_wght400_GRAD0_opsz48.png);
	background-repeat:no-repeat;
	background-position:center;
}
.reviewImg{
	background:url(/resources/images/rate_review_FILL0_wght400_GRAD0_opsz48.png);
	background-repeat:no-repeat;
	background-position:center;
}
.couponImg{
background:url(/resources/images/confirmation_number_FILL0_wght400_GRAD0_opsz48.png);
	background-repeat:no-repeat;
	background-position:center;
}
.pointImg{
background:url(/resources/images/monetization_on_FILL0_wght400_GRAD0_opsz48.png);
	background-repeat:no-repeat;
	background-position:center;
}
</style>
<body>
<%@ include file="/WEB-INF/views/component/header.jsp" %>
<div class="mypageWrap">
<%@ include file="/WEB-INF/views/component/mypageSidebar.jsp" %>
<div class="menuWrap">
<div class="deliveryImg">
	<a><span>주문 배송</span></a>
</div>
<div class="reviewImg">
<a><span>리뷰</span></a>
</div>
<div class="couponImg">
<a><span>쿠폰</span></a>
</div>
<div class="pointImg">
<a><span>적립금</span></a>
</div>
</div>
</div>
<%@ include file="/WEB-INF/views/component/footer.jsp" %>
</body>
</html>