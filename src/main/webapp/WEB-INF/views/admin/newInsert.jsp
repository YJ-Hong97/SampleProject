<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>insertGoods</title>
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
	.title input{
		width:75%;
		height:100%;
		border:0;
		margin:0;
		padding:0;
		font-style:bold;
		font-size:24px;
		line-height:49px;
	}
	.title button{
		width:82px;
		height:35px;
		border:0;
		background:#868686;
		color:white;
		font-style:bold;
		font-size:16px;
		line-height:16px;
	}
	.line label{
		display:inline-block;
		width:173px;
		height:100%;
		vertical-align:medium;
	}
	.line select{
		border:0;
	}
	.line input{
		border:0;
		display:inline-block;
		width:250px;
	}
	.line textarea{
		border:0;
		display:inline-block;
		width:250px;
	}
	.goodsColorDiv{
		display:inline-block;
		width:200px;
	}
	.colorBar{
		width:200px;
		margin-left:176px;
		display:none;
	}
	.colorBar span{
		cursor:pointer;
	}
	.goodsColorDiv div{
		display:inline-block;
		border-radius:3px;
	}
	.goodsColorDiv div button{
		background:inherit;
		border:0;
		vertical-align:medium;
	}
	.goodsColorDiv div span{
		background:inherit;
		border:0;
		vertical-align:medium;
		margin-right:2px;
	}
	.colorCode{
		width:70px;
	}
	.goodsSizeDiv{
		display:inline-block;
		width:200px;
	}
	.sizeBar{
		width:200px;
		margin-left:176px;
		display:none;
	}
	.sizeBar span{
		cursor:pointer;
	}
	.sizeBar button{
		float:right;
	}
	.goodsSizeDiv div{
		display:inline-block;
		border-radius:3px;
	}
	.goodsSizeDiv div button{
		background:inherit;
		border:0;
		vertical-align:medium;
	}
	.goodsSizeDiv div span{
		background:inherit;
		border:0;
		vertical-align:medium;
		margin-right:2px;
	}
	.line input[type="radio"]{
		width:50px;
	}
	.thumbnail{
		width:697px;
		height:200px;
		    margin: 20px auto;
	}
	.thumbnail button{
		width:20px;
		height:20px;
		vertical-align:top;
		border:0;
		background:transparent;		
	}
	.thumbnailBox{
		display:inline-block;
	}
	#hiddenImage{
		display:none;
	}
	#imageThumbnail{
		width:100px;
		height:200px;
	}
	.submit{
		float:right;
	}
	.table{
		width:456px;
		margin:20px auto;
		font-size:15px;
		line-height:21px;
	}
	.table td{
		width:100px;
		height:30px;
		text-align:center;
		position:relative;
		border:1px solid black;
	}
	.table th{
	width:100px;
		height:30px;
		text-align:center;
		position:relative;
		border:1px solid black;
		background:#DDDD;
	}
	.radioHidden{
		position:absolute;
		left:0;
		top:0;
		width:100%;
		height:100%;
		visibility:hidden;	 	
		vertical-align:middle;
		
	}
	.radioHidden+span{
		display:inline-block;
		width:100%;
		height:100%;
		cursor:pointer;
		
	}
	.radioHidden:checked+span{
		 background-color: #113a6b;
        color: #ffffff;
	}
	.tblSize{
		margin-left:auto;
		margin-right:auto;
	}
	.tblSize td{
		width:50px;
		border:0.1px solid black;
	}
	.tblSize th{
	width:50px;
		border:0.1px solid black;
	}
	.tblSize input{
	width:50px;
		padding:0;
		margin:0;
		border:0;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/component/adminSidebar.jsp" %>
<div class="insertWrap">
<%@ include file="/WEB-INF/views/component/adminHeader.jsp" %>
<div class="boxWrap">
	<div class="formWrap">
		<input type="hidden" name="goodsIndexId" value="${goods.goodsIndexId }">
		<div class="line title">
			<input type="text" placeholder="상품이름" class="goodsName" value="${goods.goodsName }"><button class="checkName">중복확인</button>
		</div>
		<div class="line">
			<label>상품종류</label>
			<select onchange="fn_changeSmall(event)" class="type goodsType">
				<c:forEach items="${typeList }" var="type">
					<c:if test="${goods.goodsType== type.goodsCode}">
						<option value="${type.goodsCode }" selected>${type.typeName}</option>
					</c:if>
					<c:if test="${goods.goodsType!=type.goodsCode }">
						<option value="${type.goodsCode }">${type.typeName}</option>
					</c:if>
				</c:forEach>
			</select>
		</div>
		<div class="line">
			<label>상품 소분류</label>
			<select class="smallType goodsSmallType"></select>	
		</div>
		<div class="line">
			<label>상품 가격</label>
			<input type="text" placeholder="입력" class="goodsPrice" value="${goods.goodsPrice }">
		</div>
		<div class="line colorLine">
			<c:forEach items="${goods.goodsColor }" var="color">
					<input type="hidden" name="goodsColor" value="${color}">
				</c:forEach>
			<label>상품 색상</label>
			<div contenteditable="true" class="goodsColorDiv" onkeyup="fn_changeColor(event)" onkeydown="fn_enterColor(event)">
				<c:forEach items="${goods.goodsColor }" var="color">
					<div><button onclick="fn_deleteColor(event)">X</button><span>${color }</span></div>
				</c:forEach>
			</div>
			<div class="colorBar">
			</div>
		</div>
		<div class="line sizeLine">
						<c:forEach items="${goods.goodsSize }" var="size">
					<input type="hidden" name="goodsSize" value="${size }">
				</c:forEach>
		
			<label>상품 사이즈</label>
			<div contenteditable="true" class="goodsSizeDiv" onkeyup="fn_changeSize(event)" onkeydown="fn_enterSize(event)">
			<c:forEach items="${goods.goodsSize }" var="size">
					<div><button>X</button><span>${size }</span></div>
				</c:forEach>
			</div>
			<div class="sizeBar">
			</div>
		</div>
		<div class="line">
			<label>상품 할인</label>
			<input type="number" min="0" placeholder="퍼센트 단위, 할인 없을 경우 0" class="goodsSale" value="${goods.goodsSale }">
		</div>
		<div class="line">
			<label>인기 상품</label>
			비인기 상품<input type="radio" value="0" name="best" class="goodsBest notBest">인기상품<input type="radio" value="1" name="best" class="goodsBest best">
		</div>
		<div class="line">
			<label>활성화 여부</label>
			활성화<input type="radio" value="0" name="active" class="goodsActive active">비활성화<input type="radio" value="1" name="active" class="goodsActive notActive">
		</div>
		<div class="line">
			<label>상품 설명</label>
			<textarea name="goodsDetail" class="goodsDetail"></textarea>
		</div>
		<div class="line">
			<label>사진 첨부</label>
			<input type="file" accept="image/*" onchange="fn_changeImages(event)">
		</div>
		<div class="thumbnail">
				<c:forEach items="${goods.imageUrls }" var="image">
					<div class="thumbnailBox imageUrls">
					<button type="button" onclick="fn_deleteImage(event)">X</button>
					<input type="hidden" name="imageUrls" value="${image }" class="goodsImage">
					<img src=${image } id="imageThumbnail">
					</div>
				</c:forEach>
			</div>
		<div class="table">
			<p>체크포인트</p>
			<table class="check">
				<tr>
					<th>세탁방법</th>
					<td><input type="radio" name="cleaning" value="0" class="radioHidden"><span class="buttonSpan">드라이클리닝</span></td>
					<td><input type="radio" name="cleaning" value="1" class="radioHidden"><span class="buttonSpan">단독세탁</span></td>
					<td><input type="radio" name="cleaning" value="2" class="radioHidden"><span class="buttonSpan">일반세탁</span></td>
					<td><input type="radio" name="cleaning" value="3" class="radioHidden"><span class="buttonSpan">손세탁</span></td>
				</tr>
				<tr>
					<th>안감</th>
					<td><input type="radio" name="lining" value="0" class="radioHidden"><span class="buttonSpan">있음</span></td>
					<td><input type="radio" name="lining" value="1" class="radioHidden"><span class="buttonSpan">없음</span></td>
					<td><input type="radio" name="lining" value="2" class="radioHidden"><span class="buttonSpan">기모</span></td>
					<td><input type="radio" name="lining" value="3" class="radioHidden"><span class="buttonSpan">양털</span></td>
				</tr>
				<tr>
					<th>두께</th>
					<td><input type="radio" name="thickness" value="0" class="radioHidden"><span class="buttonSpan">도톰함</span></td>
					<td><input type="radio" name="thickness" value="1" class="radioHidden"><span class="buttonSpan">보통</span></td>
					<td><input type="radio" name="thickness" value="2" class="radioHidden"><span class="buttonSpan">없음</span></td>
					<td>-</td>
				</tr>
				<tr>
					<th>비침</th>
					<td><input type="radio" name="through" value="0" class="radioHidden"><span class="buttonSpan">비침</span></td>
					<td><input type="radio" name="through" value="1" class="radioHidden"><span class="buttonSpan">약간</span></td>
					<td><input type="radio" name="through" value="2" class="radioHidden"><span class="buttonSpan">없음</span></td>
					<td><input type="radio" name="through" value="3" class="radioHidden"><span class="buttonSpan">밝은색만</span></td>
				</tr>
				<tr>
					<th>신축성</th>
					<td><input type="radio" name="flexibility" value="0" class="radioHidden"><span class="buttonSpan">좋음</span></td>
					<td><input type="radio" name="flexibility" value="1" class="radioHidden"><span class="buttonSpan">약간</span></td>
					<td><input type="radio" name="flexibility" value="2" class="radioHidden"><span class="buttonSpan">없음</span></td>
					<td><input type="radio" name="flexibility" value="3" class="radioHidden"><span class="buttonSpan">허리밴딩</span></td>
				</tr>
				<tr>
					<th>핏</th>
					<td><input type="radio" name="fit" value="0" class="radioHidden"><span class="buttonSpan">크게 나왔어요</span></td>
					<td><input type="radio" name="fit" value="1" class="radioHidden"><span class="buttonSpan">정사이즈</span></td>
					<td><input type="radio" name="fit" value="2" class="radioHidden"><span class="buttonSpan">작게 나왔어요</span></td>
					<td>-</td>
				</tr>
			</table>
	</div>
	<form id="detailSize">
	<div class="table detailSize">
		<p>사이즈</p>
		<c:forEach items="${sizes }" var="size">
			<table class="tblSize">
			<thead>
				<tr>
					<th class="sizeTitle">${size.sizeName }</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th>총장</th>
					<th>어깨단면</th>
					<th>가슴단면</th>
					<th>팔길이</th>
					<th>팔단면</th>
					<th>암홀</th>
					<th>허리</th>
					<th>밑위</th>
					<th>힙</th>
					<th>허벅지</th>
					<th>밑단</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="totalLength" value="${size.totalLength }"></td>
					<td><input type="text" class="shoulder" value="${size.shoulder }"></td>
					<td><input type="text" class="chest" value="${size.chest }"></td>
					<td><input type="text" class="arm" value="${size.arm }"></td>
					<td><input type="text" class="armSection" value="${size.armSection }"></td>
					<td><input type="text" class="armhole" value="${size.armhole }"></td>
					<td><input type="text" class="waist" value="${size.waist }"></td>
					<td><input type="text" class="rise" value="${size.rise}"></td>
					<td><input type="text" class="heap" value="${size.heap }"></td>
					<td><input type="text" class="thigh" value="${size.thigh }"></td>
					<td><input type="text" class="hem" value="${size.hem }"></td>
				</tr>
			</tbody>
		</table>
		</c:forEach>
		<table class="tblSize">
			<thead>
				<tr>
					<th class="sizeTitle">${size.sizeName }</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th>총장</th>
					<th>어깨단면</th>
					<th>가슴단면</th>
					<th>팔길이</th>
					<th>팔단면</th>
					<th>암홀</th>
					<th>허리</th>
					<th>밑위</th>
					<th>힙</th>
					<th>허벅지</th>
					<th>밑단</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="totalLength" value="${size.totalLength }"></td>
					<td><input type="text" class="shoulder" value="${size.shoulder }"></td>
					<td><input type="text" class="chest" value="${size.chest }"></td>
					<td><input type="text" class="arm" value="${size.arm }"></td>
					<td><input type="text" class="armSection" value="${size.armSection }"></td>
					<td><input type="text" class="armhole" value="${size.armhole }"></td>
					<td><input type="text" class="waist" value="${size.waist }"></td>
					<td><input type="text" class="rise" value="${size.rise}"></td>
					<td><input type="text" class="heap" value="${size.heap }"></td>
					<td><input type="text" class="thigh" value="${size.thigh }"></td>
					<td><input type="text" class="hem" value="${size.hem }"></td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
	<div class="line">
		<button class="submit">다음</button>
	</div>
</div>
</div>
<%@ include file="/WEB-INF/views/component/adminFooter.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script th:inline="javascript">
var colors = [];
<c:forEach items="${goods.goodsColor}" var="color">
	colors.push("${color}".trim())
</c:forEach>
var sizes = [];
<c:forEach items="${goods.goodsSize}" var="size">
	sizes.push("${size}".trim());
</c:forEach>
let goodsBest = [[${goods.goodsBest}]];
let goodsActive=[[${goods.goodsActive}]];
var cleaning  = [[${check.cleaning}]];
var lining = [[${check.lining}]];
var thickness = [[${check.thickness}]];
var through = [[${check.through}]];
var flexibility=[[${check.flexibility}]];
var fit = [[${check.fit}]];

if(cleaning!="null"){
	$(".check").children(0).children().eq(0).each(function(i,e){
		$(e).children().eq(cleaning+1).children(0).attr("checked","checked");
	})
	$(".check").children(0).children().eq(1).each(function(i,e){
		$(e).children().eq(lining+1).children(0).attr("checked","checked");
	})
	$(".check").children(0).children().eq(2).each(function(i,e){
		$(e).children().eq(thickness+1).children(0).attr("checked","checked");
	})
	$(".check").children(0).children().eq(3).each(function(i,e){
		$(e).children().eq(through+1).children(0).attr("checked","checked");
	})
	$(".check").children(0).children().eq(4).each(function(i,e){
		$(e).children().eq(flexibility+1).children(0).attr("checked","checked");
	})
	$(".check").children(0).children().eq(5).each(function(i,e){
		$(e).children().eq(fit+1).children(0).attr("checked","checked");
	})
}
if(goodsBest!="null"){
	if(goodsBest==0){
		$(".notBest").attr("checked","true");
	}else{
		$(".best").attr("checked","false");
	}
}
if(goodsActive!="null"){
	if(goodsActive==0){
		$(".active").attr("checked","true");
	}else{
		$(".notActive").attr("checked","false");
	}
}
let goodsCode = $(".type").val();
var backgroundColor = ["#ffffdf","#f8ffdf","#efefe8","#efdfdf","#d8cfdf","#cfcfff"];
var backIndex = 0;
$(".goodsColorDiv").children().each(function(i,el){
	el.setAttribute("contenteditable","false");
	el.style.backgroundColor = backgroundColor[backIndex];
	backIndex++;
	if(backIndex>backgroundColor.length){
		backIndex = 0;
	}
});
$(".goodsSizeDiv").children().each(function(i,el){
	el.setAttribute("contenteditable","false");
	el.style.backgroundColor = backgroundColor[backIndex];
	backIndex++;
	if(backIndex>backgroundColor.length){
		backIndex = 0;
	}
});
$.ajax({
	url:"/manager/smallType?goodsCode="+goodsCode,
	method:"get",
	success:function(response){
		let input = "";
		response.forEach(function(el,i){
			input+=`<option value="`+el.goodsSmallCode+`">`+el.typeName+`</option>`
		});
		$(".smallType").html(input);
	}
});	
	function fn_changeSmall(event){
		
		let goodsCode = event.target.value;
		$.ajax({
			url:"/manager/smallType?goodsCode="+goodsCode,
			method:"get",
			success:function(response){
				let input = "";
				response.forEach(function(el,i){
					input+=`<option value="`+el.goodsSmallCode+`">`+el.typeName+`</option>`
				});
				$(".smallType").html(input);
			}
		});	
			
	};
	function fn_changeColor(event){
		if(event.keyCode==8){
			fn_keyPress(event);
		}
		if(event.keyCode==13){
			return;	
		}
		let keyword = "";
		event.target.childNodes.forEach(function(el,i){
			if(el.data!=undefined){
				keyword= el.data;
			}else if(el.innerText!=""){
				keyword = el.innerText;
			}
		})
		$.ajax({
			url:"/manager/goods/searchColor?keyword="+keyword,
			method:"get",
			success:function(response){
				let input = "";
					if(response.length==0){
						input +=`<p><span style="background:`+backgroundColor[backIndex]+`;" onclick="fn_insertColor(event)">`+keyword+`</span></p>`;
						backIndex++;
						if(backIndex>backgroundColor.length){
							backIndex = 0;
						}
					}else{
						response.forEach(function(el,i){
							input += `<p><span style="background:`+backgroundColor[backIndex]+`;" onclick="fn_clickResultColor(event,`+`${el.colorCode}`+`)">`+el.colorName+`</span></p>`;
							backIndex++;
							if(backIndex>backgroundColor.length){
								backIndex = 0;
							}
						});
					}
					
				$(".colorBar").css("display","block");
				$(".colorBar").html(input);
				
			}
			
		});
	}
	function fn_clickResultColor(event,colorCode){
		
		let colorName = event.target.innerText;
		let bool = colors.includes(colorName);
		if(!bool){
			colors.push(colorName);
			backIndex -=1;
			if(backIndex<0){
				backIndex = 0;
			}
			let input = `<div style="background:`+backgroundColor[backIndex]+`" contenteditable="false"><button onclick="fn_deleteColor(event)">X</button><span>`+colorName+`</span></div>`
			let div = document.createElement("div");
			$(".goodsColorDiv").children().each(function(i,el){
				if(el.tagName=="DIV"){
					div.append(el);
				}
			});
			$(".goodsColorDiv").text("");
			$(".goodsColorDiv").html(div.innerHTML);
			$(".goodsColorDiv").append(input);
			$(".goodsColorDiv").children().eq(-1);
			caretAtLast(document.querySelector(".goodsColorDiv"))
			$(".colorBar").html("");
			let hidden = document.createElement("input");
			hidden.setAttribute("type","hidden");
			hidden.setAttribute("name","color");
			hidden.setAttribute("value",colorName);
			hidden.setAttribute("class","goodsColor");
			$(".colorLine").append(hidden);
		}
		
	}
	function fn_insertColor(event){
		let colorName = event.target.innerText;
		let input = document.createElement("input");
		input.setAttribute("type","text");
		input.setAttribute("class","colorCode");
		input.setAttribute("placeholder","색상코드입력")
		let button = document.createElement("button");
		button.setAttribute("onclick","fn_saveColor(event)");
		button.innerText = "생성";
		event.target.parentNode.append(input);
		event.target.parentNode.append(button);
	}
	function fn_saveColor(event){
		
		let colorCode = event.target.previousSibling.value;
		let colorName= event.target.previousSibling.previousSibling.innerText;
		colors.push(colorName);
		$.ajax({
			
			url:"/manager/goods/insertColor?colorName="+colorName+"&colorCode="+colorCode,
			method:"get",
			success:function(){
				$(".colorWrap").css("display","none");
			}
		});
		backIndex -=1;
		if(backIndex<0){
			backIndex = 0;
		}
		let input = `<div style="background:`+backgroundColor[backIndex]+`" contenteditable="false"><button onclick="fn_deleteColor(event)">X</button><button>`+colorName+`</button></div>`
		let div = document.createElement("div");
		$(".goodsColorDiv").children().each(function(i,el){
			if(el.tagName=="DIV"){
				div.append(el);
			}
		});
		$(".goodsColorDiv").text("");
		$(".goodsColorDiv").html(div.innerHTML);
		$(".goodsColorDiv").append(input);
		$(".goodsColorDiv").children().eq(-1);
		caretAtLast(document.querySelector(".goodsColorDiv"));
		$(".colorBar").html("");
		let hidden = document.createElement("input");
		hidden.setAttribute("type","hidden");
		hidden.setAttribute("name","color");
		hidden.setAttribute("value",colorName);
		hidden.setAttribute("class","goodsColor");
		$(".colorLine").append(hidden);
	}
	function fn_deleteColor(event){
		
		let colorName = event.target.nextSibling.innerText;
		colors = colors.filter(function(data){
			if(data==colorName){
				
			}else{
				return data;
			}
		})
		fn_popHidden(colorName,"color");
		$(".goodsColorDiv").children().each(function(i,el){
			if(el.tagName=="DIV"){
				if(el.childNodes[1].innerText==colorName){
					el.remove();
				}
			}
			
		})
	}
	function fn_changeSize(event){
		if(event.keyCode==8){
			fn_keyPress(event)
		}
		if(event.keyCode==13){
			return;	
		}
		let keyword = "";
		event.target.childNodes.forEach(function(el,i){
			if(el.data!=undefined){
				keyword= el.data;
			}else if(el.innerText!=""){
				keyword = el.innerText;
			}
		})
		let input = `<p><span style="background:`+backgroundColor[backIndex]+`;" contenteditable="false">`+keyword+`</span><button onclick="fn_saveSize(event)">저장</button></p>`;
		backIndex++;
		if(backIndex>backgroundColor.length){
			backIndex = 0;
		}
		$(".sizeBar").html(input);
		$(".sizeBar").css("display","block")
	}
	function fn_saveSize(event){
		
		let size = event.target.previousSibling.innerText;
		sizes.push(size);
		let input = document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("value",size);
		input.setAttribute("class","goodsSize");
		$(".sizeLine").append(input);
		let sizeTag = `<div style="background:`+backgroundColor[backIndex]+`" contenteditable="false"><button onclick="fn_deleteSize(event)">X</button><button>`+size+`</button></div>`
		let div = document.createElement("div");
		$(".goodsSizeDiv").children().each(function(i,el){
			if(el.tagName=="DIV"){
				div.append(el);
			}
		});
		$(".goodsSizeDiv").text("");
		$(".goodsSizeDiv").html(div.innerHTML);
		$(".goodsSizeDiv").append(sizeTag);
		caretAtLast(document.querySelector(".goodsSizeDiv"));
		$(".sizeBar").html("");
		if(sizes.length==1){
			$(".sizeTitle").text(size);
		}else{
			fn_addSize(size);
		}
		
	}
	function fn_deleteSize(event){
		let size= event.target.nextSibling.innerText;
		sizes = sizes.filter(function(data){
			if(data==size){
				
			}else{
				return data;
			}
		})
		$(".sizeLine").children().each(function(i,el){
			if(el.value==size){
				el.remove();
			}
		});
		$(".goodsSizeDiv").children().each(function(i,el){
			if(el.tagName=="DIV"){
				if(el.childNodes[1].innerText==size){
					el.remove();
				}
			}
			
		});
		fn_popHidden(size,"size");
		if(sizes.length==1){
			$("sizeTitle").text("");
		}else{
			fn_popSize(size);
		}
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
			inputImage.setAttribute("class","goodsImage");
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
	function fn_addThumbnail(event){
		let reader = new FileReader();
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src",event.target.result);
			$(".whiteSpace").append(img);
		};
		reader.readAsDataURL(event.target.files[0]);
		
	}
	function fn_deleteImage(event){
		var parent = event.target.parentNode;
		while(parent.firstChild)  {
		    parent.removeChild(parent.firstChild);
		  }
	}
	$(".submit").click(function(){
		let goodsName = $(".goodsName").val();
		let goodsType = $(".goodsType").val();
		let goodsSmallType = $(".goodsSmallType").val();
		let goodsPrice = $(".goodsPrice").val();
		let goodsColor = [];
		$(".colorLine").children().each(function(i,el){
			if(el.tagName=="INPUT"){
				goodsColor.push(el.value);
			}
		});
		let goodsSize = [];
		$(".sizeLine").children().each(function(i,el){
			if(el.tagName=="INPUT"){
				goodsSize.push(el.value);
			}
		});
		let goodsSale = $(".goodsSale").val();
		let goodsBest = 0;
		if($(".goodsBest").attr("checked")=="checked"){
			goodsBest =1;
		}
		let goodsActive =1;
		if($(".goodsActive").attr("checked")=="checked"){
			goodsActive = 0;
		}
		let goodsIndexId = $("input[name=goodsIndexId]").val();
		let goodsDetail = $(".goodsDetail").val();
		
		let cleaning = $("input[name=cleaning][checked=checked]").val();
		let lining = $("input[name=lining][checked=checked]").val();
		let thickness = $("input[name=thickness][checked=checked]").val();
		let through = $("input[name=through][checked=checked]").val();
		let flexibility = $("input[name=flexibility][checked=checked]").val();
		let fit = $("input[name=fit][checked=checked]").val();
		var form = new FormData();
		form.append("goodsName",goodsName);
		form.append("goodsType",goodsType);
		form.append("goodsSmallType",goodsSmallType);
		form.append("goodsPrice",goodsPrice);
		form.append("goodsColor",goodsColor);
		form.append("goodsSize",goodsSize);
		form.append("goodsSale",goodsSale);
		form.append("goodsBest",goodsBest);
		form.append("goodsActive",goodsActive);
		form.append("cleanging",cleaning);
		form.append("lining",lining);
		form.append("thickness",thickness);
		form.append("through",through);
		form.append("flexibility",flexibility);
		form.append("fit",fit);
		$(".thumbnail input").each(function(i,el){
			if(el.getAttribute("type")=="hidden"){
				let imageUrls = el.value;
				form.append("imageUrls",imageUrls);
			}else{
				form.append("goodsImage",el.files[0]);
			}
			
		});
		form.append("goodsIndexId",goodsIndexId);
		form.append("goodsDetail",goodsDetail);
		$(".sizeTitle").each(function(i,el){
			form.append("sizeVos["+i+"].sizeName",el.innerText);
		})
		$(".totalLength").each(function(i,el){
			form.append("sizeVos["+i+"].totalLength",el.value);
		})
			$(".shoulder").each(function(i,el){
			form.append("sizeVos["+i+"].shoulder",el.value);
		})
			$(".chest").each(function(i,el){
			form.append("sizeVos["+i+"].chest",el.value);
		})
	$(".arm").each(function(i,el){
			form.append("sizeVos["+i+"].arm",el.value);
		})
			$(".armSection").each(function(i,el){
			form.append("sizeVos["+i+"].armSection",el.value);
		})
			$(".armhole").each(function(i,el){
			form.append("sizeVos["+i+"].armhole",el.value);
		})
			$(".waist").each(function(i,el){
			form.append("sizeVos["+i+"].waist",el.value);
		})
			$(".rise").each(function(i,el){
			form.append("sizeVos["+i+"].rise",el.value);
		})
			$(".thigh").each(function(i,el){
			form.append("sizeVos["+i+"].thigh",el.value);
		})
			$(".heap").each(function(i,el){
			form.append("sizeVos["+i+"].heap",el.value);
		})
			$(".hem").each(function(i,el){
			form.append("sizeVos["+i+"].hem",el.value);
		})


		fetch('http://localhost:9090/manager/goods/insertGoods', {
		    method: 'POST',
		    cache: 'no-cache',
		    headers: {},
		    body:form // body 부분에 폼데이터 변수를 할당
		})
		.then((response) => 
			response.json()
		)
		.then((data)=>{
			let input = ""
			let max = data.length;
			for(let i = 0;i<max;i++){
				let goodsSize = data[i].goodsSize;
				let goodsColor = data[i].goodsColor;
				let goodsIndexId = data[i].goodsIndexId;
				if(i==0){
					input+=`goodsList[0].goodsSize=`+goodsSize;
					input+=`&goodsList[0].goodsColor=`+goodsColor;
					input+=`&goodsList[0].goodsIndexId=`+goodsIndexId;
				}else{
					input+=`&goodsList[`+i+`].goodsSize=`+goodsSize;
					input+=`&goodsList[`+i+`].goodsColor=`+goodsColor;
					input+=`&goodsList[`+i+`].goodsIndexId=`+goodsIndexId;
				}
			}
			alert(input);
			location.href = "/manager/goods/insertGoodsStep2?"+encodeURI(input);
		})
		
	});
	function fn_enterColor(event){
		if(event.keyCode==13){
			event.preventDefault();
			$(".colorBar").children().children().eq(0).click();
		
		}
		if(event.keyCode==8){
			fn_keyPress(event);
		}
	}
	function fn_enterSize(event){
		if(event.keyCode==13){
			event.preventDefault();
			$(".sizeBar").children().children().eq(1).click();
		}
		if(event.keyCode==8){
			fn_keyPress(event);
		}
	}
	$(".buttonSpan").click(function(){
		$(this).parent().parent().children().each(function(i,el){
			if($(el).children().eq(0).attr("checked")=="checked"){
				$(el).children().eq(0).removeAttr("checked");
			}
		})
		$(this).prev().attr("checked","checked");
		
	});
	/*커서 마지막 위치로*/
	function caretAtLast(el){
		let sel = window.getSelection();
		sel.setPosition(el,el.childNodes.length);
	}
	/*백스페이스로 블록 지울때 배열에서 삭제하기*/
	function fn_keyPress(event){
		if(event.keyCode==8){
			if(event.target.className=="goodsColorDiv"){
				let temp = [];
				event.target.childNodes.forEach(function(el,i){
					if(el.tagName=="DIV"){
						let colorName = el.childNodes[1].innerText.trim();
						let bool = colors.includes(colorName);
						if(bool){
							temp.push(colorName);
						}
					}
				});
				for(let i = 0;i<colors.length;i++){
					let bool = temp.includes(colors[i]);
					if(!bool){
						console.log(colors[i])
						fn_popHidden(colors[i],"color");
					}
				}
				colors = temp;
				
			}else if(event.target.className="goodsSizeDiv"){
				let temp = [];
				event.target.childNodes.forEach(function(el,i){
					if(el.tagName=="DIV"){
						let sizeName=el.childNodes[1].innerText.trim();
						let bool = sizes.includes(sizeName);
						if(bool){
							temp.push(sizeName);
						}
					}
				});
				for(let i = 0;i<sizes.length;i++){
					let bool = temp.includes(sizes[i]);
					if(!bool){
						if(temp.length==0){
							$(".sizeTitle").text("");
						}else{
							fn_popSize(sizes[i]);
						}
						fn_popHidden(sizes[i],"size");
					}
				}
				sizes= temp;
			}
		}
	}
	
	function fn_addSize(size){
		let table = document.querySelector(".tblSize").cloneNode(true);
		$(table).children().eq(0).children().eq(0).children().eq(0).text(size);
		$(".detailSize").append(table);
		
	}
	function fn_popSize(size){
		$(".tblSize").each(function(i,el){
			if($(el).children().eq(0).children().eq(0).children().eq(0).text()==size){
				el.remove();
			}
		})
	}
	function fn_popHidden(name,type){
		if(type=="size"){
			$(".sizeLine").children().each(function(i,el){
				if(el.tagName=="INPUT"){
				if(el.value.trim()==name){
					el.remove();
					return;
				};
				}
			})
		}else{
			$(".colorLine").children().each(function(i,el){
				if(el.tagName=="INPUT"){
				if(el.value.trim()==name){
					el.remove();
					return;
				}
				}
			})
		}
	}
</script>
</body>
</html>