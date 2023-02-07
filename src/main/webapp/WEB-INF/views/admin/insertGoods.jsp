<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>Insert Goods</title>
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
	.formWrap{
		width:687px;
		margin-left:auto;
		margin-right:auto;
		margin-top:30px;
		box-sizing:border-box;
	}
	.formWrap label{
		display:inline-block;
		width:100px;
		height:25px;
		line-height:25px;
		background:#D9D9D9;
	}
	.frmGoods input{
		display:inline-block;
		flex-grow:1;
		height:25px;
		line-height:25px;
		border:0;
	}
	.formWrap select{
		height:25px;
		border:0;
	}
	.required{
		color:red;
	}
	.line{
		width:100%;
		display:flex;
		flex-direction:row;
		align-items: center;
		margin:5px;
	}
	.checkName{
		width:80px;
		height:25px;
	
	}
	.half{
		width:50%;
	}
	.title{
		width:687px;
		margin-left:auto;
		margin-right:auto;
		margin-top:30px;
		border-bottom:1px solid black;
	}
	.smallTitle{
		width:100%;
		height:25px;
		background:#D9D9D9;
		display:flex;
		flex-direction:row;
		align-items:center;
	}
	.smallTitle span{
		height:100%;
		vertical-align:middle;
		line-height:25px;
		margin:1px;
	}
	.smallTitle span:after{
		content:"";
		margin-left:3px;
		border-left:0.1px solid gray;
	}
	.smallTitle button{
		vertical-align:middle;
		border:0;
		background:inherit;
	}
	.smallTitle select{
		vertical-align:middle;
		border:0;
		background:inherit;
		display:inline-block;
	}
	#insertImage{
		height:100%;
		width:25px;
		border:0;
		background:url(/resources/images/image_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.whiteSpace{
		width:100%;
		height:1000px;
		border:0;
		padding:0;
		outline:none;
		background:white;
	}
	.whiteSpace{
		width:100%;
		height:1000px;
		border:0;
		margin-bottom:30px;
	}
	.imageBox .input{
		display:none;
	}
	.whiteSpace h1{
  display: inline-block;
  font-size: 2em;
  margin-left: auto;
  margin-right: auto;
  font-weight: bold;

	}
	.whiteSpace h2{
	  display: inline-block;
  font-size: 1.5em;
  margin-left: auto;
  margin-right: auto;
  font-weight: bold;
	}
	.whiteSpace h3{
		display: inline-block;
  font-size: 1.17em;
  margin-left: 0;
  margin-right: 0;
  font-weight: bold;
	}
	.smallTitle button{
		height:90%;
		width:25px;
		border:1px solid black;
		border-radius:10%;
	}
	.smallTitle .bold{
		background: url(/resources/images/text_format/format_bold_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.smallTitle .italic{
		background: url(/resources/images/text_format/format_italic_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.smallTitle .underline{
		background: url(/resources/images/text_format/format_underlined_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.smallTitle .cancel{
		background: url(/resources/images/text_format/horizontal_rule_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.smallTitle .color{
		background: url(/resources/images/text_format/format_color_text_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.smallTitle .background{
		background: url(/resources/images/text_format/format_color_fill_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.smallTitle .notBold{
		display:none;
	}
	.smallTitle .notItalic{
		display:none;
	}
	.smallTitle .notUnderline{
		display:none;
	}
	.smallTitle .notCancel{
		display:none;
	}
	#textColorView{
		visibility:hidden;
		position:absolute;
		left:40%;
		width:140px;
		height:150px;
		border:0.1px solid gray;
		display:flex;
		flex-direction:row;
		flex-wrap:wrap;
		gap:0 2%;
		background:white;
		box-shadow:5px;
	}
	#textColorView .colorCircle,#backgroundColorView .colorCircle{
		flex:1;
		border-radius:50%;
		border:0.1px solid gray;
		cursor:pointer;
	}
	#textColorView .colorText,#backgroundColorView .colorText{
		border-top:0.1px solid gray;
		flex-basis:100%;
		width:140px;
		padding:0;
	}
	#backgroundColorView{
	visibility:hidden;
		position:absolute;
		left:50%;
		width:140px;
		height:150px;
		border:0.1px solid gray;
		display:flex;
		flex-direction:row;
		flex-wrap:wrap;
		gap:0 2%;
		background:white;
		box-shadow:5px;
	}
	.smallTitle .align_normal{
		background:url(/resources/images/format_align/reorder_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.smallTitle .align_left{
		background:url(/resources/images/format_align/format_align_left_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.smallTitle .align_center{
		background:url(/resources/images/format_align/format_align_center_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.smallTitle .align_right{
		background:url(/resources/images/format_align/format_align_right_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.smallTitle .quote{
		background:url(/resources/images/text_etc/format_quote_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
		border:0;
	}
	.smallTitle .emotion{
		background:url(/resources/images/text_etc/sentiment_satisfied_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
		border:0;
	}
	.smallTitle .table{
		background:url(/resources/images/text_etc/table_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
		border:0;
	}
	.smallTitle .link{
		background:url(/resources/images/text_etc/link_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
		border:0;
	}
	.smallTitle .list{
		background:url(/resources/images/text_etc/list_FILL0_wght400_GRAD0_opsz48.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
		border:0;
	}
	.smallTitle .hr{
		background:url('/resources/images/text_etc/horizontal_rule_FILL0_wght400_GRAD0_opsz48 (1).png');
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
		border:0;
	}
	.boxQuote{
		width:100%;
		text-align:center;
	}
	.quoteImage{
		margin-left:auto;
		margin-right:auto;
		width:30px;
		height:30px;
		background:url(/resources/images/text_etc/quote.png);
		background-align:center;
		background-size:cover;
		background-repeat:no-repeat;
	}
	.emojis{
		display:none;
		width:155px;
		height:150px;
		flex-direction:row;
		flex-wrap:wrap;
		justify-content: space-around;
	}
	.emojis span{
		display:inline-block;
		width:20px;
		cursor:pointer;
	}
	.emojis .emojisPage{
		flex:1;
		flex-basis:100%;
		height:20px;
		text-align:center;
	}
	.emojisPage button{
		width:10px;
		height:15px;
		border-radius:50%;
	}
	.whiteSpace li{
		display:list-item;
		list-style-type: disc;
		margin-left:5%;
	}
	.whiteSpace hr{
		width:80%;
		margin:0 auto;
		
	}
	.formWrap input[type=submit]{
		border:1px solid black;
		float:right;
		width:50px;
		margin-bottom:11px;
	}
	.thumbnail{
		width:697px;
		height:200px;
	}
	.thumbnail button{
		width:20px;
		height:20px;
		vertical-align:top;
		border:0;
		background:transparent;		
	}
	#readMe{
		display:block;
		width:100%;
		height:10px;
		line-height:10px;
		font-size:0.5rem;
		color:red;
		background:transparent;
		
	}
	#radioLabel{
		background:transparent;
	}
	#hiddenImage{
		display:none;
	}
	#imageThumbnail{
		width:100px;
		height:200px;
	}
	.thumbnailBox{
		display:inline-block;
	}
	
</style>
<body>
<%@ include file="/WEB-INF/views/component/adminSidebar.jsp" %>
<div class="goodsWrap">
<%@ include file="/WEB-INF/views/component/adminHeader.jsp" %>
<div class="boxWrap">
	<div class="title"><h1>상품 등록</h1></div>
	<div class="formWrap">
		<form class="frmGoods" method="post" action="/manager/goods/insert" enctype="multipart/form-data">
			<div class="half">
			<input type="hidden" name="goodsId" value="${goods.goodsId }">
			<div class="line"><label><span class="required">&#42;</span>상품 이름</label><input type="text" name="goodsName" class="input" value="${goods.goodsName }"><span><button type="button" class="checkName">중복확인</button></span></div>
			<div class="line"><label><span class="required">&#42;</span>상품 종류</label><select name="goodsType" class="input" onchange = "fn_changeType(event)">
				<c:forEach items="${typeList }" var="type">
					<c:if test="${goods.goodsType== type.goodsCode}">
						<option value="${type.goodsCode }" selected>${type.typeName}</option>
					</c:if>
					<c:if test="${goods.goodsType!=type.goodsCode }">
						<option value="${type.goodsCode }">${type.typeName}</option>
					</c:if>
				</c:forEach>
			</select></div>
			<div id ="smallType">
			<div class="line"><label><span class="required">&#42;</span>상품 소분류</label><select name="goodsSmallType" class="input">
				<c:forEach items="${smallTypes }" var="stype">
					<c:if test="${stype.goodsCode==goods.goodsType }">
						<option value ="${stype.goodsSmallCode }">${stype.typeName }</option>
					</c:if>
				</c:forEach>
			</select></div>
			</div>
			<div class="line"><label><span class="required">&#42;</span>상품 가격</label><input type="text" name="goodsPrice" class="input" value="${goods.goodsPrice }"></div>
			<div class="line"><label><span class="required">&#42;</span>상품 색상</label><input type="text" name="goodsColor" class="input" value="${goods.goodsColor }"></div>
			<div class="line"><label><span class="required">&#42;</span>상품 사이즈</label><input type="text" name="goodsSize" class="input" value="${goods.goodsSize }"></div>
			<div class="line"><label><span class="required">&#42;</span>상품 할인 여부</label><input type="number" name="goodsSale" class="input" min="0" max="100" value="${goods.goodsSale }"></div>
			<label id="readMe">할인 없을 시 0 또는 비워둠, 할인율에서 '%'를 제외하고 기입</label>
			<div class="line"><label><span class="required">&#42;</span>인기 상품 여부</label><input type="radio" name="goodsBest" value="0" class="input" id="best0"><label id="radioLabel">인기상품</label><input type="radio" name="goodsBest" value="1" class="input" id="best1"><label id="radioLabel">일반상품</label></div>
			<div class="line"><label>옵션_1</label><input type="text" class="input" value="${goods.goodsOption1 }"></div>
			<div class="line"><label>옵션_2</label><input type="text" class="input" value="${goods.goodsOption2 }"></div>
			<div class="line"><label>옵션_3</label><input type="text"class="input" value="${goods.goodsOption3 }"></div>
			<div class="line"><label><span class="required">&#42;</span>활성화 여부</label><input type="radio" name="goodsActive" value="0" class="input" id="active0"><label id="radioLabel">비활성화</label><input type="radio" name="goodsActive" value="1" class="input" id="active1"><label id="radioLabel">활성화</label></div>
			<div id="divImages" class="line">
				<label>사진 첨부</label><input type="file" accept="image/*"	onchange="fn_changeImages(event)" class="input">
			</div>
			<div class="thumbnail">
				<c:forEach items="${dbGoodsImages }" var="image">
					<div class="thumbnailBox">
					<button type="button" onclick="fn_deleteImage(event)">X</button>
					<input type="hidden" name="arrayImage" value="${image }">
					<img src=${image } id="imageThumbnail">
					</div>
				</c:forEach>
			</div>
			</div>
			<div class="smallTitle">
				<span>상품상세 내용 입력</span>
				<span>
					<button type="button" id="insertImage"class="insertImage" onclick="fn_insertImage(event)"></button>
					<select class="textTitle" onchange="fn_insertTitle()">
						<option value="span">본문</option>
						<option value="h1">제목1</option>
						<option value="h2">제목2</option>
						<option value="h3">제목3</option>
					</select>
					<select class="font" onchange="fn_insertFonts()">
						<c:forEach items="${fonts }" var="font" >
							<option>${font.fontName }</option>
						</c:forEach>
					</select>
				</span>
		
				<span>
					<button type="button" class="bold" onclick="fn_changeWeight(event)"></button>
					<button type="button" class="notBold" onclick="fn_changeWeight(event)">B</button>
					<button type="button" class="italic" onclick="fn_changeItalic(event)"></button>
					<button type="button" class="notItalic" onclick="fn_changeItalic(event)">i</button>
					<button type="button" class="underline" onclick="fn_changeUnderline(event)"></button>
					<button type="button" class="notUnderline" onclick="fn_changeUnderline(event)">A</button>
					<button type="button" class="cancel" onclick="fn_changeCancel(event)"></button>
					<button type="button" class="notCancel" onclick="fn_changeCancel(event)">C</button>
					<button type="button" class="color" onclick="fn_changeTextColor(event)"></button>
					<span id="textColorView" class="textColorView">
					<input type="button" class="colorCircle" onclick="fn_changeColor(event)" style="background:transparent;">
						<input type="button" class="colorCircle" onclick="fn_changeColor(event)" style="background:black;">
						<input type="button" class="colorCircle" onclick="fn_changeColor(event)" style="background:#333333;">
						<input type="button" class="colorCircle" onclick="fn_changeColor(event)" style="background:#666666;">
						<input type="button" class="colorCircle" onclick="fn_changeColor(event)" style="background:#9D9D9D;">
						<input type="button" class="colorCircle" onclick="fn_changeColor(event)" style="background:#DDDDDD;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:white;">
						
						<input type="button" class="colorCircle" onclick="fn_changeColor(event)" style="background:#EE2323;">
						<input type="button" class="colorCircle" onclick="fn_changeColor(event)" style="background:#F89009;">
						<input type="button" class="colorCircle" onclick="fn_changeColor(event)" style="background:#F3C009;">
						<input type="button" class="colorCircle" onclick="fn_changeColor(event)" style="background:#009A87;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#006DD7;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#8A3DB6;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#7E98B1;">
						
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#FFC1C8;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#FFC9AF;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#F6E199;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#9FEEC3;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#99CEFA;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#C1BEF9;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#C0D1E7;">
						
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#EF5369;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#EF6F53;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#A6BC00;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#409D00;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#0593D3;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#6164C6;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#8CB3BE;">
						
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#781B33;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#953B34;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#5F6D2B;">
						<input type="button" class="colorCircle" onclick="fn_changeColor(event)" style="background:#1B711D;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#1A5490;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#5733B1;">
						<input type="button" class="colorCircle"  onclick="fn_changeColor(event)"style="background:#456771;">
						
						<input type="text" class="colorText" placeholder="직접입력">
					</span>
					<button type="button" class="background" onclick="fn_changeBackground(event)"></button>
					<span id="backgroundColorView" class="backgroundColorView">
					<input type="button" class="colorCircle" onclick="fn_changeBack(event)" style="background:transparent;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)" style="background:black;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)" style="background:#333333;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)" style="background:#666666;">
						<input type="button" class="colorCircle" onclick="fn_changeColor(event)" style="background:#9D9D9D;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)" style="background:#DDDDDD;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)"style="background:white;">
						
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)" style="background:#EE2323;">
						<input type="button" class="colorCircle"onclick="fn_changeBack(event)" style="background:#F89009;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)" style="background:#F3C009;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)" style="background:#009A87;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)"style="background:#006DD7;">
						<input type="button" class="colorCircle"  onclick="fn_changeBack(event)"style="background:#8A3DB6;">
						<input type="button" class="colorCircle"  onclick="fn_changeBack(event)"style="background:#7E98B1;">
						
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)"style="background:#FFC1C8;">
						<input type="button" class="colorCircle"  onclick="fn_changeBack(event)"style="background:#FFC9AF;">
						<input type="button" class="colorCircle"  onclick="fn_changeBack(event)"style="background:#F6E199;">
						<input type="button" class="colorCircle"  onclick="fn_changeBack(event)"style="background:#9FEEC3;">
						<input type="button" class="colorCircle"  onclick="fn_changeBack(event)"style="background:#99CEFA;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)"style="background:#C1BEF9;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)"style="background:#C0D1E7;">
						
						<input type="button" class="colorCircle"  onclick="fn_changeBack(event)"style="background:#EF5369;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)"style="background:#EF6F53;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)"style="background:#A6BC00;">
						<input type="button" class="colorCircle"  onclick="fn_changeBack(event)"style="background:#409D00;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)"style="background:#0593D3;">
						<input type="button" class="colorCircle"  onclick="fn_changeBack(event)"style="background:#6164C6;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)"style="background:#8CB3BE;">
						
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)"style="background:#781B33;">
						<input type="button" class="colorCircle"  onclick="fn_changeBack(event)"style="background:#953B34;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)"style="background:#5F6D2B;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)" style="background:#1B711D;">
						<input type="button" class="colorCircle"  onclick="fn_changeBack(event)"style="background:#1A5490;">
						<input type="button" class="colorCircle"  onclick="fn_changeBack(event)"style="background:#5733B1;">
						<input type="button" class="colorCircle" onclick="fn_changeBack(event)"style="background:#456771;">
						
						<input type="text" class="colorText" placeholder="직접입력">
					</span>
				</span>
			</div>
			<div class="smallTitle">
				<span>
					<button type="button" class="align_normal" value="" onclick="fn_changeAlign(event)"></button>
					<button type="button" class="align_left" value="start"onclick="fn_changeAlign(event)"></button>
					<button type="button" class="align_center" value="center"onclick="fn_changeAlign(event)"></button>
					<button type="button" class="align_right" value="end"onclick="fn_changeAlign(event)"></button>
				</span>
				<span>
					<button type="button" class="quote" value="quote" onclick="fn_insertQuote(event)"></button>
					<button type="button" class="emotion" value="emotion" onclick="fn_clickEmojis(event)"></button>
					<button type="button" class="list" value="list" onclick="fn_clickLink(event)"></button>
					<button type="button" class="hr" value="hr" onclick="fn_clickHr(event)"></button>
				</span>
			</div>
			<div class="emojis">
				<div class="emojisButton">
				<c:forEach items="${emojis}" var="emoji">
					<span onclick="fn_insertEmojis(event)">&#${emoji.emojis_code };</span>
				</c:forEach>
				</div>
				<div class="emojisPage">
					<c:forEach items="${page.pageList }" var="p">
						<span><button type="button" value="${p }" onclick="fn_changePage(event)"></button></span>
					</c:forEach>
				</div>
			</div>
			<div class="whiteSpace" contenteditable="true">${goods.goodsHTML }</div>
			<input type="hidden" name="goodsHTML" id="goodsHTML">
			<input type="submit" value="저장" onclick="fn_gosubmit(event)">
		</form>	
	</div>
</div>
</div>
<%@ include file="/WEB-INF/views/component/adminFooter.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/resources/js/insertGoods.js"></script>
<script th:inline="javascript">
	window.onload= function(){
		let best = [[${goods.goodsBest}]];
		let active = [[${goods.goodsActive}]];
		if(best[0]==0){
			$("#best0").attr("checked","true");
			
		}else{
			$("#best1").attr("checked","true");
		}
		if(active[0]==0){
			$("#active0").attr("checked","true");
		}else{
			$("#active1").attr("checked","true");
		}
	}
	
	function fn_insertImage(event){
		let inputTag = document.createElement("input");
		inputTag.setAttribute("type","file");
		inputTag.setAttribute("accept","image/*");
		inputTag.setAttribute("onchange","fn_addThumbnail(event)");
		inputTag.click();
		
		
	}
	function fn_addThumbnail(event){
		let reader = new FileReader();
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src",event.target.result);
			$(".whiteSpace").append(img);
		};
		reader.readAsDataURL(event.target.files[0]);
		
	}
	function fn_insertTitle(){
		var tagName = $(".textTitle").val();
		var tag = document.createElement(tagName);
		var inputText = "";
		$(".whiteSpace").append(tag);
		documentKeypress(tag);
		
	}
	function fn_insertFonts(){
		var font = $(".font").val();
		var tag = document.createElement("span");
		if($(".whiteSpace").children()>0){
			$(".whiteSpace").children().last().append(tag);
		}else{
			$(".whiteSpace").append(tag);
		}
		currentStyle["fontFamily"]=font;
		documentKeypress(tag);

	}
	function fn_changeWeight(event){
		var span = document.createElement("span");
		if($(".whiteSpace").children()>0){
			$(".whiteSpace").children().last().append(span);
		}else{
			$(".whiteSpace").append(span);
		}
		
		let className = event.target.getAttribute("class");
		if(className=="bold"){
			$(".notBold").css({"display":"inline-block"});
			$(".bold").css({"display":"none"});
			
			currentStyle["fontWeight"] = "bold";
			fn_styleChange(span);
			
			documentKeypress(span);
		}else{
			$(".notBold").css({"display":"none"});
			$(".bold").css({"display":"inline-block"});
			
			currentStyle["fontWeight"] = "normal";
			fn_styleChange(span);
			
			documentKeypress(span);
		}
		
	}
	
	function fn_changeItalic(event){
		var span = document.createElement("span");
		if($(".whiteSpace").children()>0){
			$(".whiteSpace").children().last().append(span);
		}else{
			$(".whiteSpace").append(span);
		}
		
		let className = event.target.getAttribute("class");
		if(className=="italic"){
			$(".notItalic").css({"display":"inline-block"});
			$(".italic").css({"display":"none"});
			
			currentStyle["fontStyle"] = "italic";
			fn_styleChange(span);
			
			documentKeypress(span);
		}else{
			$(".notItalic").css({"display":"none"});
			$(".italic").css({"display":"inline-block"});
			
			currentStyle["fontStyle"] = "normal";
			fn_styleChange(span);
			
			documentKeypress(span);
		}
	}
	function fn_changeUnderline(event){
		var span = document.createElement("span");
		if($(".whiteSpace").children()>0){
			$(".whiteSpace").children().last().append(span);
		}else{
			$(".whiteSpace").append(span);
		}
		
		let className = event.target.getAttribute("class");
		if(className=="underline"){
			$(".notUnderline").css({"display":"inline-block"});
			$(".underline").css({"display":"none"});
			
			currentStyle["textDecoration"] = "underline";
			fn_styleChange(span);
			
			documentKeypress(span);
			
		}else{
			$(".notUnderline").css({"display":"none"});
			$(".underline").css({"display":"inline-block"});
			
			currentStyle["textDecoration"] = "none";
			fn_styleChange(span);
			
			documentKeypress(span);
		}
	}
	function fn_changeCancel(event){
		var span = document.createElement("span");
		if($(".whiteSpace").children().length>0){
			$(".whiteSpace").children().last().append(span);
		}else{
			$(".whiteSpace").append(span);
		}
		
		let className = event.target.getAttribute("class");
		if(className=="cancel"){
			$(".notCancel").css({"display":"inline-block"});
			$(".cancel").css({"display":"none"});
			
			currentStyle["textDecoration"] = "line-through";
			fn_styleChange(span);
			
			documentKeypress(span);
		}else{
			$(".notCancel").css({"display":"none"});
			$(".cancel").css({"display":"inline-block"});
			
			currentStyle["textDecoration"] = "none";
			fn_styleChange(span);
			
			documentKeypress(span);
		}
	}
	var color = null;
	function fn_changeColor(event){
		color = event.target.style.background;
		
		var span = document.createElement("span");
		if($(".whiteSpace").children().length>0){
			$(".whiteSpace").children().last().append(span);
		}else{
			$(".whiteSpace").append(span);
		}
		
		currentStyle["color"] = color;
		fn_styleChange(span);
		
		documentKeypress(span);
		
	}
	var back = null;
	function fn_changeBack(event){
		back = event.target.style.background;
		
		var span = document.createElement("span");
		if($(".whiteSpace").children().length>0){
			$(".whiteSpace").children().last().append(span);
		}else{
			$(".whiteSpace").append(span);
		}
		
		currentStyle["background"] = back;
		fn_styleChange(span);
		
		documentKeypress(span);
		
	}
	function fn_changeTextColor(event){
		if($(".textColorView").css("visibility")=="hidden"){
			$(".textColorView").css("visibility","visible");
			
		}else{
			$(".textColorView").css("visibility","hidden")
		}
		
	}
	function fn_changeBackground(event){
		if($(".backgroundColorView").css("visibility")=="hidden"){
			$(".backgroundColorView").css("visibility","visible");
		}else{
			$(".backgroundColorView").css("visibility","hidden");
		}
	}
	
	function fn_changeAlign(event){
		event.target.style.background="gray";
		
		var span = document.createElement("span");
		if($(".whiteSpace").children().length>0){
			$(".whiteSpace").children().last().append(span);
		}else{
			$(".whiteSpace").append(span);
		}
		span.style.display="block";
		span.setAttribute("width","100%");
		
		currentStyle["textAlign"] = event.target.value;
		fn_styleChange(span);
		
		documentKeypress(span);
	}
	function fn_insertQuote(event){
		
		var quote = document.createElement("span")
		quote.setAttribute("class","boxQuote");
		var quoteImage = document.createElement("div");
		quoteImage.setAttribute("class","quoteImage");
		var quoteText = document.createElement("div");
		quoteText.setAttribute("class","quoteText");
		
		$(".whiteSpace").append(quote);
		quote.append(quoteImage);
		quote.append(quoteText);
		
		documentKeypress(quoteText);
	}
	function fn_changePage(event){
		var page= event.target.value-1;
		$.ajax({
			url:"/manager/goods/emojiPage?page="+page,
			type:"get",
			dataType:"JSON",
			contentType: "application/json",
			success:function(response){
				var inputData = "";
				response.forEach(el=>{
					inputData+="<span onclick='fn_insertEmojis(event)'>&#"+el.emojis_code+"</span>";
				});
				$(".emojisButton").html(inputData);
			}
		});	
	}
	function fn_clickEmojis(event){
		if($(".emojis").css("display")=="none"){
			$(".emojis").css("display","flex");
		}else{
			$(".emojis").css("display","none");
		}
		
	}
	function fn_insertEmojis(event){
		var emoji = event.target.innerText;
		if($(".whiteSpace").children().length>0){
			$(".whiteSpace").chilren().last().append(emoji);
		}else{
			$(".whiteSpace").append(emoji);
		}
	}
	function fn_clickLink(event){
		var span = document.createElement("span");
		var ul = document.createElement("ul");
		var firstLi = document.createElement("li");
		ul.append(firstLi);
		span.append(ul);
		
		if($(".whiteSpace").children().length>0){
			$(".whiteSpace").children().last().append(span);
		}else{
			$(".whiteSpace").append(span);
		}
		
	}
	function fn_clickHr(event){
		var hr = document.createElement("hr");
		if($(".whiteSpace").children().length>0){
			$(".whiteSpace").children().last().append(hr);
		}else{
			$(".whiteSpace").append(hr);
		}
		document.onkeypress=function(event){
			setCursor(hr);
			getCursor(hr);
		}
	}
	function fn_gosubmit(event){
		
		event.preventDefault();
		var goodshtml = $(".whiteSpace").html();
		$("#goodsHTML").val(String(goodshtml));
		$(".frmGoods").submit();
	}
	function fn_changeImages(event){
		let imageCount = 0;
		document.querySelector(".thumbnail").childNodes.forEach(el=>{
			if(el.childNodes.length>0){
				imageCount++;
				
			}
		});
		if(imageCount>=5){
			alert("최대 5개의 이미지를 등록할 수 있습니다.")
		}else{
			var inputImage = document.createElement("input");
			inputImage.setAttribute("type","file");
			inputImage.setAttribute("accepts","image/*");
			inputImage.setAttribute("name","image");
			inputImage.setAttribute("id","hiddenImage");
			inputImage.files=event.target.files;
			
			
			var div = document.createElement("div");
			div.setAttribute("style","display:inline-block;");
			$(".thumbnail").append(div);
			div.append(inputImage);
			
			var reader = new FileReader();
			
			reader.onload = function(event){
				
				
				var button = document.createElement("button");
				button.setAttribute("class","imageButton");
				button.setAttribute("onClick","fn_deleteImage(event)");
				button.innerText = "X";
				div.append(button);
				
				var img = document.createElement("img");
				img.setAttribute("src",event.target.result);
				img.setAttribute("id","imageThumbnail");
				img.setAttribute("width","100px");
				img.setAttribute("height","200px");
				div.append(img);
				
				
			}
			reader.readAsDataURL(event.target.files[0]);
		}
		
	}
	function fn_deleteImage(event){
		var parent = event.target.parentNode;
		while(parent.firstChild)  {
		    parent.removeChild(parent.firstChild);
		  }
	}
	function fn_changeType(event){
		let type = event.target.value;
		$.ajax({
			url:"/manager/goods/goodsSmallType?goodsType="+type,
			type:"get",
			success:function(response){
				let smallTypes = response;
				let input = `<div class="line"><label><span class="required">&#42;</span>상품 소분류</label><select name="goodsSmallType" class="input">`;
				let smallType = [[${goods.goodsSmallType}]];
				
				for(let i = 0;i<response.length; i++){
					if(response[i].goodsSmallType==smallType[0]){
						input += `<option value=`+response[i].goodsSmallCode+` selected>`+response[i].typeName+`</option>`;
					}else{
						input += `<option value=`+response[i].goodsSmallCode+`>`+response[i].typeName+`</option>`;
					}
					
				}
				input+=`</select></div>`;
			$("#smallType").html(input);
			}
		});
	}
</script>
</body>
</html>