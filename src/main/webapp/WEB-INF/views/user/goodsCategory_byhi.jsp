<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <link href="/resources/css/common.css" rel="stylesheet" type="text/css">
 <title>goods</title>
 </head>
 <style>
 	html, body{
 		width:100%;
 		height:100%;
 		display:flex;
 		flex-direction:row;
 		flex-wrap:wrap;
 	}
 	.goodsWrap{
 		flex-grow:1;
 		background:#F0F0F0;
 	}
 	.boxWrap{
 		margin:0 auto;
 		width:100%;
 		height:100%;
 	}
 	.goodsBar{
 		width:815px;
 		height:37px;
 		margin-left:auto;
 		margin-right:auto;
 		margin-top:30px;
 		background:#D9D9D9;
 		line-height:37px;
 		text-align:center;
 	}
 	.goodsBar a:nth-child(n+1){
 		margin-left:30px;
 	}
 	
 	.buttonWrap{
 		width:815px;
 		height:25px;
 		margin-left:auto;
 		margin-right:auto;
 		margin-top:30px;
 	}
 	.searchWrap{
 	display:inline-block;
 		width:241px;
 		height:25px;
 		background:white;
 	}	
 	.searchWrap input{
 		width:211px;
 		height:100%;
 		border:0;
 		padding:0;
 		margin:0;
 		vertical-align:top;
 	}
 	.searchWrap span{
 		display:inline-block;
 		width:30px;
 		height:100%;
 	}
 	.searchIcon{
 		width:100%;
 		height:100%;
 		background:url(/resources/images/search_FILL0_wght400_GRAD0_opsz48.png);
 		background-repeat:no-repeat;
 		background-size:cover;
 		background-position:center;
 		border:0;
 		border-left:1px solid black;
 	}
 	.insertWrap{
 	display:inline-block;
 		display: inline-block;
	    height: 100px;
	    text-align: center;
	    font-size: 15px;
	    float:right;
 	}
 	.insertWrap button{
 		
 		width:100%;
 		height:100%;
 		background:#D9D9D9;
 		border:0;
 		margin:0;
 		padding:0;
 	}
 	.listWrap{
 		width:815px;
 		height:564px;
 		background:#D9D9D9;
 		margin-left:auto;
 		margin-right:auto;
 		margin-top:30px;
 	}
 	.listWrap table{
 		width:100%;
 	}
 	.listWrap tr{
 		height:50px;
 	}
 	.listWrap td{
 		vertical-align:middle;
 		text-align:center;
 		border-bottom:0.1px solid black;
 	}
 	.listWrap td:nth-child(n+2){
 		border-left:0.1px solid black;
 	}
 	.listWrap th{
 		vertical-align:middle;
 		border-bottom:1px solid black;
 	}
 	.nav{
 		width:100%;
 		text-align:center;
 		margin-top:20px;
 	}
 </style>
 <body>
 <%@ include file="/WEB-INF/views/component/mypageSidebar.jsp" %>
 <div class="goodsWrap">
 <%@ include file="/WEB-INF/views/component/header.jsp" %>
 <div class="boxWrap">
 	<div class = Main category>
 				<tr>
 					<c:choose>
 						<c:when test="${mainCategory==0 }"><td>top</td></c:when>
 						<c:when test="${mainCategory==1 }"><td>knit</td></c:when>
 						<c:when test="${mainCategory==2 }"><td>shirts</td></c:when>
 						<c:when test="${mainCategory==3 }"><td>outer</td></c:when>
 						<c:when test="${mainCategory==4 }"><td>bottom</td></c:when>
 						<c:when test="${mainCategory==5 }"><td>skirt</td></c:when>
 						<c:when test="${mainCategory==6 }"><td>shoes</td></c:when>
 						<c:when test="${mainCategory==7 }"><td>bag</td></c:when>
 						<c:when test="${mainCategory==8 }"><td>acc</td></c:when>
 						<c:otherwise><td>미등록 코드</td></c:otherwise>
 					</c:choose>
 					<td ><button type="button">상세보기</button></td>
 				</tr>
 	</div>
 	<div class="goodsBar">
 	<c:forEach items="${option}" var="option">
 				<tr>
 					<button type="button" class="optionButton">${option}</button>
 				</tr>
 			</c:forEach>
 	</div>
 	<div class="buttonWrap">

 		<div>
 		Total : ${count}
 		</div>
 		<div class="insertWrap">
 			<table>
  			<tr>
  				<th><button class="btn"
         type="button" onclick="getGoods_sort('${page.page}','${goods.goodsType}','goods_best')">인기순</button></th>
  				<th><button class="btn"
         type="button" onclick="getGoods_sort('${page.page}','${goods.goodsType}','goods_date')">신상품순</th>
  				<th><button class="btn"
         type="button" onclick="getGoods_sort('${page.page}','${goods.goodsType}','goods_price_down')">낮은가격순</th>
  				<th><button class="btn"
         type="button" onclick="getGoods_sort('${page.page}','${goods.goodsType}','goods_price_up')">높은가격순</th>
  				<th><button class="btn"
         type="button" onclick="getGoods_sort('${page.page}','${goods.goodsType}','goods_icon')">icon</th>
  			</tr>
  		</table>
  		</div>
 	</div>
 	<div class="listWrap">
 		<table>
 			<tr>
 				<th>선택</th>
 				<th>등록 일</th>
 				<th>상품 이름</th>
 				<th>상품 가격</th>
 				<th>상품 유형</th>
 				<th>상세보기</th>
 			</tr>
 			<c:forEach items="${goodsList}" var="goods">
 				<tr>
 					<td><input type="checkbox"></td>
 					<td>${goods.goodsDate }</td>
 					<td>${goods.goodsName }</td>
 					<td>${goods.goodsPrice }</td>
 					<c:choose>
 						<c:when test="${goods.goodsType==0 }"><td>top</td></c:when>
 						<c:when test="${goods.goodsType==1 }"><td>knit</td></c:when>
 						<c:when test="${goods.goodsType==2 }"><td>shirts</td></c:when>
 						<c:when test="${goods.goodsType==3 }"><td>outer</td></c:when>
 						<c:when test="${goods.goodsType==4 }"><td>bottom</td></c:when>
 						<c:when test="${goods.goodsType==5 }"><td>skirt</td></c:when>
 						<c:when test="${goods.goodsType==6 }"><td>shoes</td></c:when>
 						<c:when test="${goods.goodsType==7 }"><td>bag</td></c:when>
 						<c:when test="${goods.goodsType==8 }"><td>acc</td></c:when>
 						<c:otherwise><td>미등록 코드</td></c:otherwise>
 					</c:choose>
 					<td ><button type="button">상세보기</button></td>
 				</tr>
 			</c:forEach>
 		</table>
 	</div>
 	<div class="nav">
 		<a class="prev" onClick="prevPage('${page.page-1}','${goods.goodsType}','${orderBy}')">&#60;</a>
 		<c:forEach items="${page.pageList }" var="page">
 			<a>${page }</a>
 		</c:forEach>
 		<a class="next" onClick="nextPage('${page.page+1}','${count }','${goods.goodsType}','${orderBy}')">&#62;</a>
 	</div>
 </div>
 </div>
 <%@ include file="/WEB-INF/views/component/adminFooter.jsp" %>
 <script src="https://code.jquery.com/jquery-3.6.3.slim.min.js" integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo=" crossorigin="anonymous"></script>
<script>
 let query = window.location.search;
let param = new URLSearchParams(query);
var goodsType = param.get('goodsType');
if(goodsType==null){
	goodsType = -1;
}
	


	function fn_changeType(type){
		goodsType = type;
		location.href=`<%request.getContextPath();%>?page=0&goodsType=`+goodsType;
	}
	function prevPage(page,goodsType,orderBy){
		if(page==-1){
			location.href=`<%request.getContextPath();%>?page=0&goodsType=`+goodsType+"&orderBy="+orderBy;
		}else{
			location.href=`<%request.getContextPath();%>?page=`+page+"&goodsType="+goodsType+"&orderBy="+orderBy;
		}
	}
	function nextPage(page,count,goodsType,orderBy){
		if(Math.floor(count/10)<page){
			location.href=`<%request.getContextPath();%>?page=`+Math.floor(count/10)+"&goodsType="+goodsType+"&orderBy="+orderBy;
		}else{
			location.href=`<%request.getContextPath();%>?page=`+page+"&goodsType="+goodsType+"&orderBy="+orderBy;
		}
	}
  	
  	function getGoods_sort(page,goodsType,orderBy) {
  		location.href="http://localhost:8080/myapp/user/goodsList_byhi?page="+page+"&goodsType="+goodsType+"&orderBy="+orderBy;
  		}
 </script>
 </body>
 </html>