<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>mypageDetail</title>
</head>
<style>

.mypageWrap{
	margin:0 auto;
	overflow:hidden;
	background:#F5F5F5;
	text-align:center;
}
.order{
	width:50%;
	height:151px;
	display:flex;
	flex-direction:row;
	background:white;
	margin: 20px auto 0 auto;
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
.cancelLine{
	text-decoration:line-through;
	color:red;
}
h1{
	font-size:30px;
	text-align:left;
	margin-top:20px;
	margin-left:25%;
}
</style>
<body>

<%@ include file="/WEB-INF/views/component/homeHeader.jsp" %>
<div class="mypageWrap"id="wrapper">
<h1>주문 상세</h1>
	<c:if test="${order.delivery==0}">
	<c:forEach items="${orderList }" var="ol" varStatus="status">
			<div class="order">
				<div class="left">
					<div>
						<c:if test="${ol.cancel==1 }">
							취소 신청
						</c:if>
							<c:if test="${ol.cancel==1 }">
							취소 완료
						</c:if>
							<c:if test="${ol.cancel==1 }">
							취소 불가
						</c:if>
					</div>
					<div>
						<img src="${goodsIndexList.get(status.index).imageUrls[0] }" class="thumbnail">
					</div>
				</div>
				<div class="center">
					<div>${goodsIndexList.get(status.index).goodsName }</div>
					<div>${goodsList.get(status.index).goodsSize }/${goodsList.get(status.index).goodsColor }</div>
					<div>
						<c:if test="${goodsIndexList.get(status.index).goodsSale>0 }">
							<span class="cancelLine">${goodsIndexList.get(status.index).goodsPrice }</span>${goodsIndexList.get(status.index).goodsPrice -(goodsIndexList.get(status.index).goodsPrice *(goodsIndexList.get(status.index).goodsSale/100)) }원
						</c:if>
						<c:if test="${goodsIndexList.get(status.index).goodsPrice ==0 }">
							${goodsIndexList.get(status.index).goodsPrice  }원
						</c:if>
					</div>
				</div>
				<div class="right">
				<button type="button">배송조회</button>
				<button type="button">주문 환불 조회</button>
				<button type="button">리뷰 작성하기</button>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${order.delivery>0 }">
	<c:forEach items="${orderList }" var="ol" varStatus="status">
			<div class="order">
				<div class="left">
					<div>
					<c:if test="${ol.exchange==1 }">
						<span>교환 신청</span>
					</c:if>
					<c:if test="${ol.exchange==2 }">
						<span>교환 허가</span>
					</c:if>
					<c:if test="${ol.exchange==3 }">
						<span>교환 불가</span>
					</c:if>
					<c:if test="${ol.exchange==4 }">
						<span>교환 완료</span>
					</c:if>
					<c:if test="${ol.refund==1 }">
						<span>환불 신청</span>
					</c:if>
					<c:if test="${ol.refund==2 }">
						<span>환불 허가</span>
					</c:if>
					<c:if test="${ol.refund==3 }">
						<span>환불 불가</span>
					</c:if>
					<c:if test="${ol.refund==4 }">
						<span>환불 완료</span>
					</c:if>
					</div>
					<div>
						<img src="${goodsIndexList.get(status.index).imageUrls[0] }" class="thumbnail">
					</div>
				</div>
				<div class="center">
					<div>${goodsIndexList.get(status.index).goodsName }</div>
					<div>${goodsList.get(status.index).goodsSize }/${goodsList.get(status.index).goodsColor }</div>
					<div>
						<c:if test="${goodsIndexList.get(status.index).goodsSale>0 }">
							<span class="cancelLine">${goodsIndexList.get(status.index).goodsPrice }</span>${goodsIndexList.get(status.index).goodsPrice -(goodsIndexList.get(status.index).goodsPrice *(goodsIndexList.get(status.index).goodsSale/100)) }원
						</c:if>
						<c:if test="${goodsIndexList.get(status.index).goodsPrice ==0 }">
							${goodsIndexList.get(status.index).goodsPrice  }원
						</c:if>
					</div>
				</div>
				<div class="right">
				<button type="button">배송조회</button>
				<button type="button">주문 환불 조회</button>
				<button type="button">리뷰 작성하기</button>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div>
<%@ include file="/WEB-INF/views/component/homeFooter.jsp" %>

</body>
</html>