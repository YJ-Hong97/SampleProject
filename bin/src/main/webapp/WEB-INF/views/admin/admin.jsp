<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>admin</title>
</head>
<style>
	html, body{
		width:100%;
		height:100%;
		display:flex;
		flex-direction:row;
		flex-wrap:wrap;
	}
	.adminWrap{
		flex-grow:1;
		background:#F0F0F0;
	}
	.boxWrap{
		width:100%;
		height:100%;
		display:flex;
		flex-direction:row;
		flex-wrap:wrap;
		justify-content: space-around;
		align-items:center;
	}
	.todayOrder{
		width: 350px;
		height:350px;
		background:white;
	}
	.title{
		width:100%;
		height:20px;
		line-height:20px;
		padding:3px;
		border-bottom:0.1px solid gray;
	}
	.content table{
		width:100%;
		height:100%:
	}
	.content td{
		text-align:center;
		padding:3px;
		border-bottom:0.1px solid gray;
	}
	.tableTitle{
		color:gray;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/component/adminSidebar.jsp" %>
<div class="adminWrap">
<%@ include file="/WEB-INF/views/component/adminHeader.jsp" %>
<div class="boxWrap">
<div class="todayOrder">
	<div class="title">
		오늘의 주문
	</div>
	<div class="content">
		<table>
			<tr class="tableTitle">
				<td>결제 일자</td>
				<td>아이디</td>
				<td>금액</td>
				<td>배송 상태</td>
				<td><button type="button">상세 보기</button></td>
			</tr>
		</table>
	</div>
</div>
</div>
</div>
<%@ include file="/WEB-INF/views/component/adminFooter.jsp" %>
</body>
</html>