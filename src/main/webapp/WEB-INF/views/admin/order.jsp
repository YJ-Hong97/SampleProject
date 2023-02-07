<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>주문</title>
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
		height:37px;
		background:#D9D9D9;
		line-height:37px;
		margin-top:10px;
		margin-left:auto;
		margin-right:auto;
		font-size:0.5rem;
		text-align:center;
		}
	.topWrap span a{
		display:inline-block;
		width:56px;
		height:100%;
		
	}
	.middleWrap{
		width:90%;
		font-size:0.5rem;
		margin-left:auto;
		margin-right:auto;
		margin-top:10px;
	}
	.datePicker input{
		border:0;
	}
	.searchWrap{
		width:90%;
		margin-left:auto;
		margin-right:auto;
		font-size:0.5rem;
		margin-top:10px;
	}
	.searchBox{
		float:right;
	}
	.searchBox input{
		border:0;
		vertical-align:top;
		height:20px;
		box-sizing:border-box;
	}
	.searchBox .searchIcon{
		display:inline-block;
		width:20px;
		height:20px;
		background:url(/resources/images/search_FILL0_wght400_GRAD0_opsz48.png);
		background-size:cover;
		background-repeat:no-repeat;
		background-color:white;
	}
	.tableWrap{
		width:90%;
		height:564px;
		margin-top:10px;
		margin-left:auto;
		margin-right:auto;
		background:#D9D9D9;
		font-size:0.5rem;
	}
	.tableWrap table{
		width:100%;
		
	}
	.tableWrap tr{
		height:50px;
		line-height:50px;
	}
	.tableWrap td{
		text-align:center;
		border-bottom:0.1px solid black;
	}
	.tableWrap td:nth-child(n+2){
		border-left:0.1px solid black;
	}
	.tableWrap th{
		border-bottom:1px solid black;
	}
	.red{
		color:red;
	}
	.on{
		display:inline-block;
		height:37px;
		background:white;
	}
	.pageNav{
		margin-top:10px;
		margin-left:auto;
		margin-right:auto;
		text-align:center;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/component/adminSidebar.jsp" %>
<div class="goodsWrap">
<%@ include file="/WEB-INF/views/component/adminHeader.jsp" %>
<div class="boxWrap">

	<div class="topWrap">
		<span><a onclick="fn_clickType(event)">전체주문</a></span>
		<span><a onclick="fn_clickType(event)">입금대기</a></span>
		<span><a onclick="fn_clickType(event)">입금확인</a></span>
		<span><a onclick="fn_clickType(event)">배송완료</a></span>
		<span><a onclick="fn_clickType(event)">구매확정</a></span>
		<span><a onclick="fn_clickType(event)">취소요청</a></span>
		<span><a onclick="fn_clickType(event)">교환요청</a></span>
		<span><a onclick="fn_clickType(event)">환불완료</a></span>
		<span><a onclick="fn_clickType(event)">교환완료</a></span>
		<span><a onclick="fn_clickType(event)">단순취소</a></span>
		<span><a onclick="fn_clickType(event)">삭제목록</a></span>
	</div>
	<div class="middleWrap">
		<div class="datePicker">
			<label>시작일</label><input type="date" name="start" id="start" onchange="fn_changeMinDate(event)">
			<label>종료일</label><input type="date" name="end" id="end" >
			<button type="button" onclick="fn_clickDate(event)">기간 적용</button>
			<button type="button" onclick="fn_clickCMonth(event)">당월</button>
			<button type="button" onclick="fn_clickPMonth(event)">전월</button>
			<button type="button" onclick="fn_clickAllMonth(event)">전체</button>
		</div>
	</div>
	<div class="searchWrap">
		<span>주문 총 ${count }건</span><span>(합계 금액 ${total }원)</span>
		<span class="searchBox"><input type="text" class="search"><span class="searchIcon"></span></span>
	</div>
	<div class="tableWrap">
		<table>
			<thead>
				<tr>
					<th>주문번호</th>
					<th>사용자 아이디</th>
					<th>지불상태</th>
					<th>배송상태</th>
					<th>총 가격</th>
					<th>주문일자</th>
					<th>지불일자</th>
					<th>주문관리</th>
				</tr>
			</thead>
			<c:forEach items="${orders }" var="order">
				<tr>
				<td>${order.orderId }</td>
					<td>${order.userId }</td>
					<c:choose>
						<c:when test="${order.payment==0 }">
							<td class="red">입금대기</td>
						</c:when>
						<c:when test="${order.payment==1 }">
							<td>입금확인</td>
						</c:when>
						<c:otherwise>
								<td>미분류코드</td>
							</c:otherwise>
					</c:choose>
						<c:choose>
							<c:when test="${order.delivery==0 }">
								<td>상품준비</td>
							</c:when>
							<c:when test="${order.delivery==1 }">
								<td>발송</td>
							</c:when>
							<c:when test="${order.delivery==2 }">
								<td>배송중</td>
							</c:when>
							<c:when test="${order.delivery==3 }">
								<td>배송완료</td>
							</c:when>
							<c:otherwise>
								<td>미분류코드</td>
							</c:otherwise>
						</c:choose>
					<td>${order.price }</td>
					<td>${order.orderDate }</td>
					<td>${order.payDate }</td>
					<td><button type="button">상세보기</button></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div class="pageNav">
		<a class="prev" onClick="prevPage('${page.page-1}')">&#60;</a>
		<c:forEach items="${page.pageList }" var="page">
			<a onclick = "fn_page(${page-1})" >${page }</a>
		</c:forEach>
		<a class="next" onClick="nextPage('${page.page+1}','${count }')">&#62;</a>
	</div>
</div>
</div>
<%@ include file="/WEB-INF/views/component/adminFooter.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.slim.min.js" integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo=" crossorigin="anonymous"></script>
<script>
let query = window.location.search;
let param = new URLSearchParams(query);
var payment = param.get('payment');
var delivery = param.get('delivery');
var orderState = param.get('orderState');
var start = param.get('start');
var end = param.get('end');
var today = new Date();   

var year = today.getFullYear(); // 년도
var month = today.getMonth() + 1;  // 월
month = month.toString().padStart(2,"0");
var cMonth = null;
var pMonth = null;
if(param.get('month')!=month){
	pMonth = param.get('month');
}else{
	cMonth = param.get('month');
}
window.onload = function(){
	if(payment==0){
		document.querySelector(".topWrap").childNodes[3].classList.add("on");
	}else if(payment==1){
		document.querySelector(".topWrap").childNodes[5].classList.add("on");
	}else if(delivery==3){
		document.querySelector(".topWrap").childNodes[7].classList.add("on");
	}else if(orderState==1){
		document.querySelector(".topWrap").childNodes[11].classList.add("on");
	}else if(orderState==2){
		document.querySelector(".topWrap").childNodes[13].classList.add("on");
	}else if(orderState==4){
		document.querySelector(".topWrap").childNodes[21].classList.add("on");
	}else if(orderState==5){
		document.querySelector(".topWrap").childNodes[17].classList.add("on");
	}else if(orderState==6){
		document.querySelector(".topWrap").childNodes[15].classList.add("on");
	}else if(orderState==7){
		document.querySelector(".topWrap").childNodes[9].classList.add("on");
	}
	$("#start").val(start);
	$("#end").val(end);
};
	function fn_clickType(event){
		event.target.parentNode.parentNode.childNodes.forEach(el=>{
			if(el.classList!=undefined){
				el.classList.remove("on")
			}
		})
		
		let type = event.target.innerText;
		let parent = event.target.parentNode;
		parent.classList.add("on");
		
		if(type=="전체주문"){
			location.href = "/manager/order";
		}else if(type=="입금대기"){
			location.href = "/manager/order?payment=0";
			
		}else if(type=="입금확인"){
			location.href = "/manager/order?payment=1";
			
		}else if(type=="배송완료"){
			location.href = "/manager/order?delivery=3";
			
		}else if(type=="구매확정"){
			location.href = "/manager/order?orderState=7";
			
		}else if(type=="취소요청"){
			location.href = "/manager/order?orderState=1";
			
		}else if(type=="교환요청"){
			location.href = "/manager/order?orderState=2";
			
		}else if(type=="환불완료"){
			location.href = "/manager/order?orderState=6";
			
		}else if(type=="교환완료"){
			location.href = "/manager/order?orderState=5";
			
		}else if(type=="단순취소"){
			location.href = "/manager/order?orderState=4";
			
		}else if(type=="삭제목록"){
			
		}
	}
	
	function fn_clickDate(event){
		start = $("#start").val();
		end = $("#end").val();
		if(start==""||end==""){
			alert("시작일과 종료일을 입력해주세요.");
		}else{
			
			var url="/manager/order?start="+start+"&end="+end;
			if(payment!=null){
				url+="&payment="+payment;
			}
			if(delivery!=null){
				url+="&delivery="+delivery;
			}
			if(orderState!=null){
				url+="&orderState="+orderState;
			}
			location.href = url;
		}
	}
	function fn_changeMinDate(event){
		let min = event.target.value;
		$("#end").attr("min",min);
	}
	function fn_clickCMonth(event){
		cMonth = year+"-"+(month-1).toString().padStart(2,"0");
		var url="/manager/order?month="+cMonth;
		if(payment!=null){
			url+="&payment="+payment;
		}
		if(delivery!=null){
			url+="&delivery="+delivery;
		}
		if(orderState!=null){
			url+="&orderState="+orderState;
		}
		location.href = url;
	}
	function fn_clickPMonth(event){
		pMonth = year+"-"+(month-1);
		var url="/manager/order?month="+pMonth;
		if(payment!=null){
			url+="&payment="+payment;
		}
		if(delivery!=null){
			url+="&delivery="+delivery;
		}
		if(orderState!=null){
			url+="&orderState="+orderState;
		}
		location.href = url;
	}
	function fn_clickAllMonth(event){
		month = "";
		var url="/manager/order?month="+month;
		if(payment!=null){
			url+="&payment="+payment;
		}
		if(delivery!=null){
			url+="&delivery="+delivery;
		}
		if(orderState!=null){
			url+="&orderState="+orderState;
		}
		location.href = url;
	}
	function fn_page(page){
		let url = "/manager/order?";
		if(start!=""&&start!=null&&end!=""&&end!=null){
			url += "&start="+start+"&end="+end;
		}
		if(cMonth!=null){
			url +="&month="+cMonth;
		}
		if(payment!=null){
			url+="&payment="+payment;
		}
		if(delivery!=null){
			url+="&delivery="+delivery;
		}
		if(orderState!=null){
			url+="&orderState="+orderState;
		}
		location.href = url+"&page="+page;
		
	}
	function prevPage(page){
		if(page<0){
			page = 0;
		}
		let url = "/manager/order?";
		if(start!=""&&start!=null&&end!=""&&end!=null){
			url += "&start="+start+"&end="+end;
		}
		if(cMonth!=null){
			url +="&month="+cMonth;
		}
		if(payment!=null){
			url+="&payment="+payment;
		}
		if(delivery!=null){
			url+="&delivery="+delivery;
		}
		if(orderState!=null){
			url+="&orderState="+orderState;
		}
		location.href = url+"&page="+page;
	}
	function nextPage(page){
		let count = [[${count}]];
		if(page>Math.ceil(count/10)-1){
			page = Math.ceil(count/10)-1;
		}
		let url = "/manager/order?";
		if(start!=""&&start!=null&&end!=""&&end!=null){
			url += "&start="+start+"&end="+end;
		}
		if(cMonth!=null){
			url +="&month="+cMonth;
		}
		if(payment!=null){
			url+="&payment="+payment;
		}
		if(delivery!=null){
			url+="&delivery="+delivery;
		}
		if(orderState!=null){
			url+="&orderState="+orderState;
		}
		location.href = url+"&page="+page;
	}
</script>
</body>
</html>