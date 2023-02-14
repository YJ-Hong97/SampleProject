<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>방문자</title>
</head>
<style>
html, body{
		width:100%;
		height:100%;
		display:flex;
		flex-direction:row;
		flex-wrap:wrap;
		align-items:stretch;
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
	.topWrap{
		width:90%;
		height:47px;
		background:white;
		margin-top:10px;
		margin-left:auto;
		margin-right:auto;
	}
	.day{
		
		line-height:55px;
	}
	.red{
		color:red;
	}
	.middleWrap{
		width:90%;
		height:277px;
		background:white;
		margin-top:5px;
		margin-left:auto;
		margin-right:auto;
	}
	.dateLine{
		width:100%;
		font-size:0.5rem;
		display:flex;
		flex-direct:row;
		justify-content:space-between;
	}
	.dateLine span{
		cursor:pointer;
	}
	.number{
		width:100%;
		display:flex;
		font-size:0.5rem;
		flex-direct:row;
		justify-content:space-between;
	}
	.number span{
		width:1rem;
		height:1rem;
		visibility:hidden;
		text-align:center;
		line-height:1rem;
		color:white;
		border-radius:50%;
		background:red;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/component/adminSidebar.jsp" %>
<div class="goodsWrap">
<%@ include file="/WEB-INF/views/component/adminHeader.jsp" %>
<div class="boxWrap">
<div class="topWrap">
	<span class="day">오늘 방문수<span class="red">${today.today}</span></span>
	<span class="day">어제 방문수<span class="red">${today.yesterday}</span></span>
	<span class="day">누적 방문수<span class="red">${today.total}</span></span>
</div>
<div class="middleWrap">
	<svg viewBox="0 0 500 100">
      <polyline
        fill="none"
        stroke="red"
        stroke-width="1"
        points="
        <c:forEach items="${total}" var="t" varStatus="status">
        	<c:if test="${t.value==0 }">
        			${status.index*(500/31) },${100-t.value }
        	</c:if>
        	<c:if test="${t.value!=0 }">
        			${status.index*(500/31) },${100-t.value*(100/max) }
        	</c:if>
        </c:forEach>
        "
        
      />
    </svg>
    <div class="dateLine">
    <c:forEach items="${total }" var="t" varStatus="status">
    	<c:if test="${status.last }">
    		<span class="${status.index }" onclick="fn_clickDate(event)" onmouseover="fn_clickDate(event)" onmouseout="fn_outDate(event)">오늘</span>
    	</c:if>
    	<c:if test="${!status.last }">
    		<span class="${status.index }" onclick="fn_clickDate(event)" onmouseover="fn_clickDate(event)" onmouseout="fn_outDate(event)">${t.key.date }</span>
    	</c:if>
    </c:forEach>
    </div>
    <div class="number">
    	<c:forEach items="${total }" var="t" varStatus="status">
    		<span class="${status.index }">${t.value }</span>
    	</c:forEach>
    </div>
</div>
</div>
</div>
<%@ include file="/WEB-INF/views/component/adminFooter.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.slim.min.js" integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo=" crossorigin="anonymous"></script>
<script>
	function fn_clickDate(event){
		let className = event.target.getAttribute("class");
		$(".number ."+className).attr("style","visibility:visible;")
	}
	function fn_outDate(event){
		let className = event.target.getAttribute("class");
		$(".number ."+className).attr("style","visibility:hidden;")
	}
</script>
</body>
</html>