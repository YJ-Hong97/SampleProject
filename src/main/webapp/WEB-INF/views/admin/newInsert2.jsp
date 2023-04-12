<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>insertGoodsStep2</title>
</head>
<style>
body,html{
	width:100%;
	height:100%;
	margin:0;
	display:flex;
		flex-direction:row;
		flex-wrap:wrap;
		align-items:stretch;
}
.insertWrap{
		flex-grow:1;
		background:#F0F0F0;
	}
	.boxWrap{
		margin:0 auto;
		width:100%;
		height:100%;
	}
	.formWrap{
		width:661px;
		height:637px;
		background:white;
		margin: 20px auto;
		margin-left:auto;
		margin-right:auto;
	}
	.line{
		width:456px;
		height:21px;
		margin:20px auto;
		font-size:15px;
		line-height:21px;
	}
	.title{
		height:49px;
	}
	.title h1{
		width:75%;
		height:100%;
		border:0;
		margin:0;
		padding:0;
		font-style:bold;
		font-size:24px;
		line-height:49px;
	}
	.line label{
		display:inline-block;
		width:173px;
		height:100%;
	}
	
	.line input{
		border:0;
		display:inline-block;
		width:250px;
	}
	.submit{
		float:right;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/component/adminSidebar.jsp" %>
<div class="insertWrap">
<%@ include file="/WEB-INF/views/component/adminHeader.jsp" %>
<div class="boxWrap">
<div class="formWrap">
		<div class="line title">
			<h1>${index.goodsName }</h1>
		</div>
		<div class="stock">
		<c:forEach items="${goodsList }" var="goods" varStatus="status">
			<div class="line">
				<label>${goods.goodsColor }/${goods.goodsSize }</label><input type="number" min="0" placeholder="재고" name="">
			</div>
		</c:forEach>
		</div>
		<div class="line">
			<button type="button" class="submit">저장</button>
		</div>
</div>
</div>
</div>
<%@ include file="/WEB-INF/views/component/adminFooter.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script th:inline="javascript">
	var goodsIndexId = [[${index.goodsIndexId}]];
	var goodsLength =  [[${fn:length(goodsList)}]];
	$(".submit").click(function(){
		let input = "";
		<c:forEach items="${goodsList}" var="goods" varStatus="status">
		if(${status.index}==0){
			input+=`goodsList[0].goodsSize=`+`${goods.goodsSize}`;
			input+=`&goodsList[0].goodsColor=`+`${goods.goodsColor}`;
			input+=`&goodsList[0].goodsIndexId=`+goodsIndexId;
			input+=`&goodsList[0].stock=`+$(".stock").children().eq(${status.index}).children().eq(1).val();
		}else{
			input+=`&goodsList[`+${status.index}+`].goodsSize=`+`${goods.goodsSize}`;
			input+=`&goodsList[`+${status.index}+`].goodsColor=`+`${goods.goodsColor}`;
			input+=`&goodsList[`+${status.index}+`].goodsIndexId=`+goodsIndexId;
			input+=`&goodsList[`+${status.index}+`].stock=`+$(".stock").children().eq(${status.index}).children().eq(1).val();
		}
		</c:forEach>
		location.href = "/manager/goods/saveGoods?"+encodeURI(input);
	});
</script>
</body>
</html>