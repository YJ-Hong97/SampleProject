<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	.sideWrap{
		display:inline-block;
		float:left;
		width:251px;
		background:#D9D9D9;
	}
	.logoWrap{
		width:251px;
		height:60px;
		border-bottom:1px solid black;
	}
	.menuWrap{
		margin:0 auto;
		margin-top:40px;
		width: 199px;
		height:507px;
		background:#C7C3C3;
		overflow:hidden;
	}
	.menu{
		margin:0 auto;
		margin-top:30px;
		width:155px;
		height:30px;
		line-height:30px;
		border-bottom:0.1px solid gray;
	}
</style>
<body>
<div class="sideWrap">
	<div class="logoWrap">
		<span><a>logo</a></span>
	</div>
	<div class="menuWrap">
		<div class="menu">
			<a><span>관리자</span></a>
		</div>
		<div class="menu">
			<a href="/manager/order"><span>주문</span></a>
		</div>
		<div class="menu">
			<a href="/manager/goods"><span>상품</span></a>
		</div>
		<div class="menu">
			<a><span>회원</span></a>
		</div>
		<div class="menu">
			<a><span>공지사항</span></a>
		</div>
		<div class="menu">
			<a><span>문의</span></a>
		</div>
		<div class="menu">
			<a href="/manager/visit"><span>방문자</span></a>
		</div>
		<div class="menu">
			<a><span>홈페이지</span></a>
		</div>
	</div>
</div>
</body>
</html>