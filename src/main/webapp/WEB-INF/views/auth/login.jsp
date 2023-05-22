<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>로그인</title>
</head>
<style>
body, html{
		width:100%;
		margin:0;
		padding:0;
	}
	.loginWrap{
		width:100%;
	}
	.title{
	    font-size: 24px;
	    margin-top:15px;
	}
	#loginFrm{
		diaplay:inline-block;
		width:100%;
		text-align:center;
	}
	.subTitle{
		font-size: 13px;
	}
	.inputTag{
	background: rgb(255, 255, 255);
    border: 2px solid rgb(232, 233, 235);
    border-radius: 8px;
    height: 48px;
    width:100%;
	}
	.submitTag{
		border-radius: 24px;
		border:0;
    padding: 14px 24px;
    width:100%;
	}
	.box{
		width:50%;
		text-align:left;
		margin:15px auto;
	}
	
</style>
<body>
<header><%@ include file="/WEB-INF/views/component/homeHeader.jsp" %></header>
<div class="loginWrap">
	<form id="loginFrm" action="/auth/login" method="post">
		<p class="title">이메일로 로그인하기</p>
		<div class="box">
		<p class="subTitle">이메일</p>
		<input type="text" placeholder="이메일" class="inputTag" name="userId">
		</div>
		<div class="box">
		<p class="subTitle">비밀번호</p>
		<input type="password" placeholder="비밀번호" class="inputTag" name="userPw">
		</div>
		<div class="box">
		<input type="submit" value="제출" class="submitTag">
		</div>
	</form>
</div>
<footer><%@ include file="/WEB-INF/views/component/homeFooter.jsp" %></footer>

</body>
</html>