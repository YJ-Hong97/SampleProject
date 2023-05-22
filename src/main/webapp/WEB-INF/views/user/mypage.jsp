<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>mypage</title>
</head>
<style>
html,body{
	width:100%;
	height:100%;
}
.mypageWrap{
	margin:0 auto;
	overflow:hidden;
	background:#F5F5F5;
	text-align:center;
}
.menuWrap{
	width:50%;
	heigth:155px;
	margin:0 auto;
	margin-top:50px;
	display:flex;
	flex-direction:row;
	justify-content:space-between;
}
.menuWrap div{
	display:inline-block;
	width:155px;
	height:155px;
	background-color:white;
	text-align:center;
	line-height:250px;
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
.orderWrap{
	width:50%;
	margin:0 auto;
}
h1{
	font-size:30px;
	text-align:left;
	margin-left:25%;
	margin-top:20px;
}
.order{
	width:100%;
	height:151px;
	display:flex;
	flex-direction:row;
	background:white;
	margin-top:20px;
}
.right{
	width:203px;
	border-left:1px solid black;
	display:flex;
	flex-direction:column;
	justify-content:space-around;
}
.left{
	width:150px;
	padding:17px;
	text-align:left;
	
}
.center{
	width:447px;
	padding:17px;
	text-align:left;
	display:flex;
	flex-direction:column;
	justify-content:space-around;
}
.right button{
	width:151px;
	height:29px;
	border:0;
	margin:0 auto;
}
.thumbnail{
	width:96px;
	height:96px;
}

</style>
<body>
<%@ include file="/WEB-INF/views/component/homeHeader.jsp" %>
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
<h1>주문 목록</h1>
<div class="orderWrap">
	<c:forEach items="${orders }" var="order" varStatus="status">
		<div class="order">
			<div class="left">
				<span>
				<c:choose>
					<c:when test="${order.orderState==0 }">주문</c:when>
					<c:when test="${order.orderState==1 }">취소 요청</c:when>
					<c:when test="${order.orderState==2 }">교환 요청</c:when>
					<c:when test="${order.orderState==3 }">환불 요청</c:when>
					<c:when test="${order.orderState==4 }">취소 완료</c:when>
					<c:when test="${order.orderState==5 }">교환 완료</c:when>
					<c:when test="${order.orderState==6 }">환불 완료</c:when>
					<c:when test="${order.orderState==7 }">구매 확정</c:when>
				</c:choose>
				<div>
					<img src="${goodsList.get(status.index).imageUrls[0] }" class="thumbnail">
				</div>
				
				</span>
			</div>
			<div class="center">
				<c:forEach items="${orderList }" var="list">
					<c:if test="${list.key.equals(order.orderId) }">
						<div>
							<c:if test="${orderList.size()>1 }">
								${goodsList.get(status.index).goodsName }외 ${list.value.size() }건
							</c:if>
							<c:if test="${orderList.size()==1 }">
								${goodsList.get(status.index).goodsName }
							</c:if>
						</div>
						<div>
							${order.price }원
						</div>
					</c:if>
				</c:forEach>
			
			</div>
			<div class="right">
				<button type="button">배송조회</button>
				<button type="button">주문 환불 조회</button>
				<button type="button">리뷰 작성하기</button>
			</div>
		</div>
	</c:forEach>
</div>
</div>
<%@ include file="/WEB-INF/views/component/homeFooter.jsp" %>
</body>
</html>