<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	
	.headerWrap{
		position:relative;
		left:0;
		top:0;
		z-index:6;
		background:white;
		width: 100%;
		height: 55px;
		line-height:55px;
		margin-bottom:1px;
	}
	.logo{
		/* LOGO */
		margin-left:21px;
		width: 64px;
		height: 28px;

		font-style: normal;
		font-weight: 400;
		font-size: 24px;

	}
	ul{
		display:inline-block;
	}
	li{
		float:left;
		margin-left:30px;
	}
	.leftWrap{
		width:750px;
	}
	.rightWrap{
		margin-left:360px;
	}
	.cart{
		display:inline-block;
		background:url(resources/images/shopping_cart_FILL0_wght400_GRAD0_opsz48.png);
		width:20px;
		height:20px;
		line-height:55px;
		background-size:cover;
		background-repeat:no-repeat;
		background-position:center;
	}
	.searchIcon{
		display:inline-block;
		background:url(resources/images/search_FILL0_wght400_GRAD0_opsz48.png);
		width:20px;
		height:20px;
		line-height:55px;
		background-size:cover;
		background-repeat:no-repeat;
		background-position:center;
	}
</style>
<body>
<div class="headerWrap">
	<ul class="leftWrap">
		<li class="logo"><a href="${pageContext.request.contextPath}/">LOGO</a></li>
		<li><a href="${pageContext.request.contextPath}/user/goodsList?goodsType=0">Top</a></li>
		<li><a href="${pageContext.request.contextPath}/user/goodsList?goodsType=1">Knit</a></li>
		<li><a href="${pageContext.request.contextPath}/user/goodsList?goodsType=2">Shirts</a></li>
		<li><a href="${pageContext.request.contextPath}/user/goodsList?goodsType=3">Outer</a></li>
		<li><a href="${pageContext.request.contextPath}/user/goodsList?goodsType=4">Bottom</a></li>
		<li><a href="${pageContext.request.contextPath}/user/goodsList?goodsType=5">Skirt</a></li>
		<li><a href="${pageContext.request.contextPath}/user/goodsList?goodsType=6">Dress</a></li>
		<li><a href="${pageContext.request.contextPath}/user/goodsList?goodsType=8">Bag</a></li>
		<li><a href="${pageContext.request.contextPath}/user/goodsList?goodsType=7">Shoes</a></li>
		<li><a href="${pageContext.request.contextPath}/user/goodsList?goodsType=9">Acc</a></li>
	</ul>
	<ul class="rightWrap">
		<c:if test="${user==null }">
			<li><a href="/auth/login">login</a></li>
		</c:if>
		<c:if test="${user!=null }">
			<li><a href="/auth/mypage">mypage</a></li>
		</c:if>
		<li>event</li>
		<li><a class="cart" href="${pageContext.request.contextPath}/order/shoppingcart?userId=${userId}"></a></li>
		<li><a class="searchIcon"></a></li>
	</ul>
</div>
</body>
</html>