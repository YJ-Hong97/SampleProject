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
.loveListWrap{
width:50%;
	margin:0 auto;
	text-align:left;
	display:none;
}
.loveWrap{
width:100%;
	height:151px;
	display:flex;
	flex-direction:row;
	background:white;
	margin-top:20px;
}
.couponlistWrap{
	width:50%;
	margin:0 auto;
	text-align:left;
	display:none;
}
.couponlistWrap h1{
	font-size:30px;
	margin: 20px 0 20px 0;
}
.couponWrap{
	width:100%-20px;
	height:111px;
	background:white;
	margin-top:20px;
	padding:20px;
}
.couponWrap .title{
	font-style:bold;
	font-size:20px;
}
.couponWrap .condition{
	font-size:15px;
	margin-top:10px;
	color:gray;
}
.loveListWrap img{
	width:97px;
	height:97px;
}
</style>
<body>
<%@ include file="/WEB-INF/views/component/homeHeader.jsp" %>
<div class="mypageWrap" id="wrapper">
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
<div class="orderWrap">
	<h1 class="title">주문 목록</h1>
	<c:forEach items="${orders }" var="order" varStatus="status">
	<c:choose>
		<c:when test="${order.orderState==0||order.orderState==7 }">
		<div class="order shop mypageCompo" >
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
								<a href="/auth/mypage/detail?orderId=${order.orderId }">${goodsList.get(status.index).goodsName }외 ${list.value.size() }건</a>
							</c:if>
							<c:if test="${orderList.size()==1 }">
								<a href="/auth/mypage/detail?orderId=${order.orderId }">${goodsList.get(status.index).goodsName }</a>
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
		</c:when>
		<c:when test="${order.orderState>=1&&order.orderState<=6 }">
		<div class="order cancel mypageCompo">
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
								<a href="/auth/mypage/detail?orderId=${order.orderId }">${goodsList.get(status.index).goodsName }외 ${list.value.size() }건</a>
							</c:if>
							<c:if test="${orderList.size()==1 }">
								<a href="/auth/mypage/detail?orderId=${order.orderId }">${goodsList.get(status.index).goodsName }</a>
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
	</c:when>
	</c:choose>
	</c:forEach>
</div>
	
<%@ include file="/WEB-INF/views/user/mypageCoupone.html" %>
<%@ include file="/WEB-INF/views/user/mypageLove.html" %>
</div>
<%@ include file="/WEB-INF/views/component/homeFooter.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.slim.min.js" integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo=" crossorigin="anonymous"></script>
<script>
		
	function fn_shoppingList(){
		$(".mypageCompo").each(function(i,el){
			$(el).css("display","none");
		});
		$(".orderWrap").css("display","block");
		$(".shop").css("display","flex");
	}
	function fn_cancelList(){
		$(".mypageCompo").each(function(i,el){
			$(el).css("display","none");
		});
		$(".orderWrap").css("display","block");
		$(".cancel").css("display","flex");
	}
	function fn_couponList(){
		$(".mypageCompo").each(function(i,el){
			$(el).css("display","none");
		});
		$(".orderWrap").css("display","none");
		$(".couponlistWrap").css("display","block");
	}
	function fn_loveList(){
		$(".mypageCompo").each(function(i,el){
			$(el).css("display","none");
		});
		$(".orderWrap").css("display","none");
		$(".loveListWrap").css("display","block");
	}
</script>
</body>
</html>