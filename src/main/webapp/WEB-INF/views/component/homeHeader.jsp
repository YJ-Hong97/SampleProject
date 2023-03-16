<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	
	.headerWrap{
		position:fixed;
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
		width:633px;
	}
	.rightWrap{
		margin-left:417px;
	}
	.cart{
		display:inline-block;
		background:url(/resources/images/shopping_cart_FILL0_wght400_GRAD0_opsz48.png);
		width:20px;
		height:20px;
		line-height:55px;
		background-size:cover;
		background-repeat:no-repeat;
		background-position:center;
	}
	.searchIcon{
		display:inline-block;
		background:url(/resources/images/search_FILL0_wght400_GRAD0_opsz48.png);
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
		<li class="logo"><a href="/">LOGO</a></li>
		<li>Top</li>
		<li>Knit</li>
		<li>Shirts</li>
		<li>Bottom</li>
		<li>Skirt</li>
		<li>Bag</li>
		<li>Shoes</li>
		<li>Acc</li>
	</ul>
	<ul class="rightWrap">
		<li>mypage</li>
		<li>event</li>
		<li><a class="cart"></a></li>
		<li><a class="searchIcon"></a></li>
	</ul>
</div>
</body>
</html>