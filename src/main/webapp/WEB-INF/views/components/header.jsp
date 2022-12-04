<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
#header {
    min-width: 1200px;
    border-top: 3px solid #ff7c98;
    border-bottom: 1px solid #3f291a;
    background: url(/assets/images/common/bg_header.gif) 50% 0 repeat-x;
}
#header .top_area {
    border-bottom: 1px solid #e2d9d6;
}
#header .top_area .inner {
    position: relative;
    width: 1200px;
    height: 114px;
    padding-top: 21px;
    margin: 0 auto;
}
#header .logo {
    width: 92px;
    height: 92px;
    margin: 0 auto;
}
#header .sns {
    top: 50px;
    left: 0;
}
#header .sns, #header .etc {
    position: absolute;
    top: 50px;
}
#header .etc {
    top: 39px;
    right: 0;
    height: 54px;
    line-height: 54px;
}
nav {
    display: block;
}
.menu_area .inner {
    width: 1200px;
    margin: 0 auto;
}
.member, .member li {
    float: left;
}
nav {
    display: block;
}
#gnb {
    float: right;
}
a {
    color: #483834;
}
.member .login span {
    width: 35px;
    background-position: 0px -1px;
}
.member span {
    display: block;
    height: 46px;
    
}
#gnb {
    float: right;
}
#gnb .gnb_bg {
    overflow: hidden;
    position: absolute;
    top: 185px;
    left: 0;
    height: 0;
    z-index: 999;
    min-width: 100%;
    border-bottom: 1px solid #693337;
    background: #fff;
    -webkit-transition: height .5s ease;
    transition: height .5s ease;
}
#gnb .gnb_bg div {
    width: 1200px;
    height: 204px;
    margin: 0 auto;
}
</style>
<body>
<header id="header">
	<div class="inner_header">
		<div class="top_area">
			<div class="inner">
				<h1 class="logo">logo</h1>
				<nav class="sns">sns</nav>
				<nav class="etc">etc</nav>
			</div>
		</div>
	</div>
	<div class="menu_area">
	<div class="inner">
		<nav class="member">
			<ul>
				<li class="login">
					<a><span>login</span></a>
				</li>
				<li class="join">
					<a href="/myapp/signup"><span>join</span></a>
				</li>
			</ul>
		</nav>
		<nav id="gnb">
			<div class="gnb_wrap">
				<ul></ul>
			</div>
			<div class="gnb_bg">
				<div></div>
			</div>
		</nav>
	</div>
</div>
</header>
</body>
</html>
