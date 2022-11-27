
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/views/components/common.jsp" %>
<%@ include file="/WEB-INF/views/components/header.jsp" %>
<%@ include file="/WEB-INF/views/components/footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
</head>
<style>
#content {
    width: auto;
    min-width: 1200px;
    padding-bottom: 130px;
}
#content {
    width: 1200px;
    margin: 0 auto;
    padding: 0 0 160px;
}
article {
    display: block;
}
.main_banner {
    position: relative;
}
.flavor_month .top a {
    height: 150px;
    margin-bottom: 3px;
    background: #f0dcb6;
}
.flavor_month .top a, .flavor_month .flavor_banner a {
    display: block;
    text-indent: -9999em;
}
.flavor_month .flavor_banner {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 10;
}
.flavor_month .flavor_banner a {
    height: 854px;
    background: #513529;
}

.banner_slide {
    position: relative;
    /* max-width: 1600px; */
    min-width: 1200px;
    margin: 0 auto;
}
.swipe {
    visibility: hidden;
    overflow: hidden;
    position: relative;
}
.swipe_wrap {
    overflow: hidden;
    position: relative;
}
.banner_slide li {
    float: left;
}
.swipe_wrap > div, .swipe_wrap > ul, .swipe_wrap > li {
    float: left;
    position: relative;
}
.banner_slide .dslide {
    margin-top: -40px;
}
.dslide {
    opacity: 1;
    -webkit-transform: translate3d(0,0,0);
    text-align: center;
}
.banner_slide .btns .prev {
    left: 20px;
}
.banner_slide .btns a {
    display: block;
    position: absolute;
    top: 50%;
    margin-top: -54px;
}
img {
    border: 0;
    vertical-align: top;
}
.banner_slide .btns .next {
    right: 20px;
}
.br_event {
    height: 721px;
}
.br_menu .menu_list, .store_delivery, .snsbox, .br_event {
    position: relative;
    width: 1200px;
    margin: 0 auto;
}
section {
    display: block;
}
h3.title {
    text-align: center;
}
img {
    border: 0;
    vertical-align: top;
}
.br_event .title {
    color: #2f231c;
    font-size: 17px;
    line-height: 23px;
}
.br_menu {
    position: relative;
    height: 1157px;
}
.br_menu .title {
    padding-top: 78px;
}
h3.title {
    text-align: center;
}
.br_menu .menu_list {
    height: 1066px;
    margin-top: 50px;
}
.br_menu .menu_list, .store_delivery, .snsbox, .br_event {
    position: relative;
    width: 1200px;
    margin: 0 auto;
}
.store_delivery {
    height: 547px;
    box-sizing: border-box;
}
.store_delivery .store, .store_delivery .order {
    float: left;
    width: 50%;
}
.store_delivery .title {
    padding: 95px 0 50px;
}
.store_delivery:after {
    display: table;
    clear: both;
    content: "";
}
.snsbox .title {
    padding-bottom: 26px;
}
.snsbox .sns {
    width: 400px;
    margin: 0 auto;
    padding-bottom: 35px;
}
</style>
<body>
<article id="content" class="main_wrap">
	<div class="main_banner">
		<div class="flavor_month">
			<div class="top"><a>flavor of the month</a></div>
		</div>
		<div class="flavor_banner">
			<a>flavor banner</a>
		</div>
		<div class="banner_slide">
			<div class="swipe">
				<ul class="swipe_wrap">
					<li>swipe</li>
				</ul>
			</div>
			<div class="dslide"></div>
			<div class="btns">
				<a class="prev"><img>prev</a>
				<a class="next"><img>next</a>
			</div>
		</div>
	</div>
	<section class="br_event">
		<h3 class="title"><img>br event</h3>
		<div class="event_list"></div>
	</section>
	<section class="br_menu">
		<h3 class="title"><img>br_menu</h3>
		<div class="menu_list"></div>
	</section>
	<div class="store_delivery">
		<section class="store">
			<h3 class="title"><img>br store</h3>
			<div class="box"></div>
		</section>
		<section class="order">
			<h3 class="title"><img>br order</h3>
			<div class="box"></div>
		</section>
	</div>
	<section class="snsbox">
		<h3 class="title"><img>snsbox</h3>
		<nav class="sns"></nav>
	</section>
</article>
</body>
</html>
