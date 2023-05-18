<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/common.css" rel="stylesheet" type="text/css">
<title>Sample Project</title>
</head>
<style>
	body, html{
		width:100%;
		height:100%;
	}
	.imageWrap{
		position:relative;
		width:100%;
		height:520px;
	}
	.imageWrap a img{
		width:100%;
		height:520px;	
	}
	.slideImage{
		display:none;
	}
	.on{
		display:block;
	}
	.imageWrap ul{
		position:absolute;
		width: 100%;
		bottom:20px;
		display:flex;
		align-items:center;
		justify-content: center;
	}
	.imageWrap li{
		margin-left:5px;
	}
	.imageWrap input{
		height:3px;
		border:0;
		background:black;
		cursor:pointer;
	}
	.newWrap{
		width:100%;
		margin:0 auto;
		text-align:center;
	}
	.newWrap .title{
		font-style: normal;
		font-weight: 400;
		font-size: 14px;
		line-height: 14px;
		margin-top:50px;
		margin-bottom:50px;
	}
	.goodsWrap{
		width:100%;
		height:420px;
		display:flex;
		flex-direction:row;
		justify-content:center;
		align-items:center;
	}
	.goodsWrap .goodsItem{
		width:262px;
		height:100%;
		overflow:hidden;
		margin-left:10px;
		position:relative;
		
	}
	.goodsWrap .visible{
		width:262px;
		height:327px;
		position:absolute;
		left:0;
		top:0;
	}
	.goodsImage{
		display:none;
	}
	.visible{
		display:inline-block;
	}
	.heart{
		position:absolute;
		right:10px;
		top:10px;
		border:0;
		width:40px;
		height:40px;
		background:url("/resources/images/—Pngtree—love heart outline_6044200.png");
		background-size:cover;
		background-repeat:no-repeat;
	}
	.redheart{
		position:absolute;
		right:10px;
		top:10px;
		border:0;
		width:40px;
		height:40px;
		background:url("/resources/images/redheart.png");
		background-size:cover;
		background-repeat:no-repeat;
	}
	.goodsColors{
		width:262px;
		margin-top:348px;
		font-size: 15px;
    	color: #787878;
    	text-align:left;
	}
	.goodsColors li{
		display:inline-block;
		width:20px;
		height:10px;
		margin-left:1px;
	}
	.goodsName{
		width:262px;
		font-size: 15px;
    	color: #787878;
    	text-align:left;
	}
	.goodsPrice{
		margin-top:5px;
		width:262px;
		text-align:left;
		font-size: 16px;
    	color: #333333;
    	font-weight: bold;
	}
	.sale{
		font-size: 16px;
    color: #de680d;
	}
	.beforeSale{
		font-size: 16px;
    color: #333333;
    font-weight: bold;
    text-decoration: line-through;
	}
	.special{
		margin-top:5px;
		width:262px;
		text-align:left;
	}
	.best{
		color:gray;
		font-size:16px;
		border:1px solid gray;
	}
</style>
<body>
<header><%@ include file="/WEB-INF/views/component/homeHeader.jsp" %></header>
<div class="slideWrap">
	<div class="imageWrap">
	<c:forEach items="${adsList }" var="ad">
		<a class="slideImage"><img src="${ad.adsCode }"/></a>
	</c:forEach>
	<ul>
	<c:forEach items="${adsList }" varStatus = "status">
		<li><input type="button" value = "${status.index }" onclick="changeSlide(event)"></li>
	</c:forEach>
	</ul>
	</div>
</div>
<div class="newWrap">
	<p class="title">NEW ARRIVALS</p>
	<div class="goodsWrap">
		<c:forEach items="${goodsList }" var="goods" varStatus="status">
			<div class="goodsItem${status.index } goodsItem" >
				<c:forEach items="${goods.imageUrls}" var="image">
					<a href="${pageContext.request.contextPath}/goods/detail?goodsId=${goods.goodsIndexId }"><img src="${image }" class="goodsImage"></a>
				</c:forEach>
				<button value="${goods.goodsIndexId }" class="heart" onclick="clickHeart(event)"></button>

				<ul class="goodsColors">
				<c:forEach items="${goods.goodsColor }" var="color">
					<li style="background-color:${color};"></li>
				</c:forEach>
				</ul>
				<a href="${pageContext.request.contextPath}/goods/detail?goodsId=${goods.goodsIndexId }"><p class="goodsName">${goods.goodsName }</p></a>

				<p class="goodsPrice">
					<c:if test ="${goods.goodsSale!=0 }">
						<span>${goods.goodsPrice-((goods.goodsSale/100)*goods.goodsPrice) }원 </span>
						<span class="sale">${goods.goodsSale }% </span>
						<span class="beforeSale">${goods.goodsPrice }원</span>
					</c:if>
					<c:if test ="${goods.goodsSale==0 }">
						<span>${goods.goodsPrice }원 </span>
						
					</c:if>
				</p>
				<p class="special">
					<c:if test="${goods.goodsBest !=0}">
						<span class="best">BEST</span>
					</c:if>
					
				</p>
			</div>
		</c:forEach>
	</div>
</div>
<%@ include file="/WEB-INF/views/component/homeFooter.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.slim.min.js" integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo=" crossorigin="anonymous"></script>
<script th:inline="javascript">
	var last = [[${adsList.size()}]]-1;
	var index = 1;
	var before = last;
	intervalSlide();
	var intervalId = setInterval(intervalSlide,5000);
	imageSlide(0);
	imageSlide(1);
	imageSlide(2);
	imageSlide(3);
	var Interval0 = setInterval(imageSlide,3000,0);
	var Interval1 = setInterval(imageSlide,3000,1);
	var Interval2 = setInterval(imageSlide,3000,2);
	var Interval3 = setInterval(imageSlide,3000,3);
	function intervalSlide(){
		
		$(".imageWrap ul").children().each(function(){
			$(this).children().css("background","black");
		});
		$(".imageWrap").children().eq(before).removeClass("on");
		$(".imageWrap").children().eq(index).addClass("on");
		$(".imageWrap ul").children().eq(index).children().css("background","#D9D9D9");
		before  = index;
		index++;
		if(index>last){
			index = 0;
			before = last;
		}
	}
	function changeSlide(){
		clearInterval(intervalId);
		$(".imageWrap ul").children().each(function(){
			$(this).children().css("background","black");
		})
		event.target.style.background="#D9D9D9";
		let i = event.target.value;
		index = i;
		intervalSlide();
		intervalId = setInterval(intervalSlide,5000);
	}
	var goods0Last = 0;
	var goods1Last = 0;
	var goods2Last = 0;
	var goods3Last = 0;
	<c:forEach items="${goodsList}" var="goods" varStatus="status">
		goods${status.index}Last = 0;
			<c:forEach items = "${goods.imageUrls}" var = "image">
				goods${status.index}Last++;
			</c:forEach>
	</c:forEach>
	
	
	var goods0Index = 0;
	var goods1Index = 0;
	var goods2Index = 0;
	var goods3Index = 0;
	
	var goods0Before = goods0Last;
	var goods1Before = goods1Last;
	var goods2Before = goods2Last;
	var goods3Before = goods3Last;
	
	function imageSlide(status){
		if(status==0){
			$(".goodsItem0").children().eq(goods0Before).children().removeClass("visible");
			$(".goodsItem0").children().eq(goods0Index).children().addClass("visible");
			
			goods0Before = goods0Index;
			goods0Index++;
			if(goods0Index>=goods0Last){
				goods0Index = 0;
				goods0Before = goods0Last-1;
			}
		}else if(status==1){
			$(".goodsItem1").children().eq(goods1Before).children().removeClass("visible");
			$(".goodsItem1").children().eq(goods1Index).children().addClass("visible");
			
			goods1Before = goods1Index;
			goods1Index++;
			if(goods1Index>=goods1Last){
				goods1Index = 0;
				goods1Before = goods1Last-1;
			}
		}else if(status==2){
			$(".goodsItem2").children().eq(goods2Before).children().removeClass("visible");
			$(".goodsItem2").children().eq(goods2Index).children().addClass("visible");
			
			goods2Before = goods2Index;
			goods2Index++;
			if(goods2Index>=goods2Last){
				goods2Index = 0;
				goods2Before = goods2Last-1;
			}
		}else if(status==3){
			$(".goodsItem3").children().eq(goods3Before).children().removeClass("visible");
			$(".goodsItem3").children().eq(goods3Index).children().addClass("visible");
			
			goods3Before = goods3Index;
			goods3Index++;
			if(goods3Index>=goods3Last){
				goods3Index = 0;
				goods3Before = goods3Last-1;
			}
		}
		
	}
	function clickHeart(event){
		if(event.target.className == "heart"){
			event.target.classList.remove("heart");
			event.target.classList.add("redheart");
		}else{
			event.target.classList.remove("redheart");
			event.target.classList.add("heart");
			
		}
	}
</script>
</body>
</html>