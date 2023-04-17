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
					<div><button>X</button><span>${color }</span></div>
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
	</div>
	<div class="line">
		<button class="submit">다음</button>
	</div>
</div>
</div>
<%@ include file="/WEB-INF/views/component/adminFooter.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script th:inline="javascript">
let goodsBest = [[${goods.goodsBest}]];
let goodsActive=[[${goods.goodsActive}]];
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
		let span = document.createElement("span");
		$(".goodsColorDiv").append(span);
		span.focus();
		$(".colorBar").html("");
		let hidden = document.createElement("input");
		hidden.setAttribute("type","hidden");
		hidden.setAttribute("name","color");
		hidden.setAttribute("value",colorName);
		hidden.setAttribute("class","goodsColor");
		$(".colorLine").append(hidden);
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
		let span = document.createElement("span");
		$(".goodsColorDiv").append(span);
		span.focus();
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
		$(".colorLine").children().each(function(i,el){
			if(el.value==colorName){
				el.remove();
			}
		});
		$(".goodsColorDiv").children().each(function(i,el){
			if(el.tagName=="DIV"){
				if(el.childNodes[1].innerText==colorName){
					el.remove();
				}
			}
			
		})
	}
	function fn_changeSize(event){
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
		let span = document.createElement("span");
		$(".goodsSizeDiv").append(span);
		span.focus();
		$(".sizeBar").html("");
		
	}
	function fn_deleteSize(event){
		let size= event.target.nextSibling.innerText;
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
			
		})
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
		
		fetch('http://localhost:9090/manager/goods/insertGoods', {
		    method: 'POST',
		    cache: 'no-cache',
		   	headers:{},
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
	}
	function fn_enterSize(event){
		if(event.keyCode==13){
			event.preventDefault();
			$(".sizeBar").children().children().eq(1).click();
		}
	}
</script>
</body>
</html>