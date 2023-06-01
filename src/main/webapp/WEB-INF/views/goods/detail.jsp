<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/common.css" rel="stylesheet" type="text/css">
<title>Detail</title>
</head>
<style>
	body, html{
		margin:0;
		position:relative;
	}
	.detailHead{
		width:100%;
		heigth:579px;
		display:flex;
		flex-direction:row;
		margin-top:20px;
	}
	.imageWrap{
		width:361px;
		height:100%;
		margin-left:230px;
		
	}
	.bigImage{
		width:361px;
		height:449px;
		position:relative;
	}
	.bigImage img{
		position:absolute;
		left:0;
		top:0;
		width:100%;
		height:100%;
	}
	.smallImage{
		width:170px;
		height:48px;
		margin-top:10px;
		
	}
	.smallImage ul{
		width:100%;
		display:flex;
		flex-direction:row;
	}
	.smallImage li{
		margin:0;
		cursor:pointer;
	}
	.smallImage li:nth-child(n+2){
		margin-left:10px;
	}
	.smallImage li img{
		width:38px;
		height:48px;
	}
	.detailWrap{
		margin-left:86px;
		width:415px;
		height:100%;
	}
	.title{
		font-size: 16px;
	}
	.box{
		font-size:13px;
		border:1px solid gray;
		color:gray;
	}
	.detail{
		margin:5px 0 0;
		font-size: 12px;
    	line-height: 12px;
    	color: #555;
	}
	.line{
		margin:20px 0;
	}
	.separate{
		text-decoration: line-through;
		text-decoration-color :red;
	}
	.goodsInfo label{
		width: 40px;
		height: 15px;
		display:inline-block;
		font-style: normal;
		font-weight: 400;
		font-size: 12px;
	}
	.goodsInfo span{
		font-style: normal;
		font-weight: 400;
		font-size: 12px;
	}
	.goodsInfo button{
		background:white;
		border:0.1px solid black;
	}
	#mySize{
		width: 100%;
		height: 39px;
		background: #D9D9D9;
		border:0;
		margin:10px 0;
	}
	.buttonBox{
		width:100%;
		display:flex;
		flex-direction:row;
		justify-content:space-between;
		gap:10px;
	}
	.buttonBox button{
		font-style: normal;
		font-weight: 400;
		height: 33px;
		font-size: 12px;
		background: #D9D9D9;
		border:0;
		flex-grow:0.9;
	}
	.invisible{
		visibility:hidden;
	}
	.visible{
		visibility:visible;
	}
	.redBorder{
		border:1px red solid;
	}
	.selectBox{
		width:100%;
	}
	.selectBox input{
		width:50px;
		float:right;
	}
	.deleteGoods{
		width:15px;
		height:15px;
		float:right;
		border:0;
		padding:0;
	}
	.inputGoods{
		padding:10px 0;
	}
	.inputGoods p{
		margin:5px 0;
		font-size:11px;
	}
	#totalTitle{
		width:40px;
		display:inline-block;
	}
	
	.detailTail{
		width:100%;
	}
	.detailTail .tailHead{
		text-align:center;
	}
	.menu{
		position:relative;
		cursor:pointer;
	}
	.menu:nth-child(n+2){
		margin-left:20px;
	}
	.circle{
		display:inline-block;
		width:15px;
		height:15px;
		border-radius:50%;
		position:absolute;
		left:-5px;
		top:-5px;
		background:#ABCA9D;		
		z-index:-1;
	}
	.hidden{
		display:none;
	}

		.detailLine{
		width:80%;
	}
	
	.compo .reviewWrap{
		width:80%;
		margin:0 auto;
		display:flex;
		flex-direction:row;
	}
	.reviewWrap .left{
		padding:42px;
		width:159px;
	}
	.reviewWrap .center{
		padding:42px;
		width:500px;
		text-align:center;
		margin:0 atuo;
	}
.starWrap{
	width:115px;
	height:21px;
	position:relative;
	overflow:hidden;
}
.fiveStar{
position:absolute;
	top:5px;
	left:-50px;
	width:115px;
}
.fourStar{
	position:absolute;
	top:-23px;
	left:-13px;
	width:115px;
	
}
.threeStar{
	position:absolute;
	top:-40px;
	width:115px;
}
.twoStar{
	position:absolute;
	top:-60px;
	width:115px;
	
}
.oneStar{
	position:absolute;
	top:-80px;
	width:115px;
	
}
.zeroStar{
	position:absolute;
	top:-100px;
	width:115px;	
}
.big{
	font-size:30px;
}
.gray{
	color:#D9D9D9;
}
.small{
	font-size:15px;
}
.stickWrap{
	width:30px;
	height:100%;
	margin:0 auto;
	text-align:center;
	display:inline-block;
}
.stick{
	width:10px;
	height:55px;
	background:#EAEAEA;
	border-radius:2.5px;
	margin: 0 auto;
	cursor:pointer;
}
.stick svg{
	width:100%;
	height:55px;
	position:relative;
}
.stick svg rect{
	position:absolute;
	z-index:5;
	border-radius:2.5px;
}
.countBox{
	width:23px;
	height:15px;
	border-radius:1px;
	background:red;
	font-size:10px;
	line-height:15px;
	color:white;
}
.right{
	width:100%;
}
.reviewBox{
	width:100%;
	height:34px;
	line-height:34px;
	border-radius:5px;
	border: 3px solid #DEDEDE;
	display:flex;
	flex-direction:row;
}
.reviewBox span{
	width:120px;
}
.reviewBox span:nth-child(1){
	color:#8B8B8B;
	width:50px;
}
.reviewBox span:nth-child(2){
	flex-grow:2;
}
.blueStick{
	width:100%;
	height:10px;
	border-radius:2.5px;
	background:#D9D9D9;
}
.reviewList{
	width:80%;
	margin:0 auto 100px auto;
}
.reviewCount{
	text-align:right;
}
.reviewCount span:nth-child(n+2){
	border-left:1px solid #8B8B8B;
}
.reviewCount span{
	padding: 0 5px 0 5px;
	color:#8B8B8B;
}
.photo{
	width:110px;
	height:110px;
	margin:0 5px 0 5px;
}
.shiftLeft, .shiftRight{
	width:25px;
	height:110px;
}
.photos{
	display:inline-block;
	width:1100px;
	height:110px;
	overflow:hidden;
}
.photos span{
	display:flex;
	flex-direction:row;
	justify-contents:space-around;
}
.photoWrap{
	width:100%;
	display:flex;
	flex-direction:row;
}
.photoList{
	width:100%;
}
.rImage img{
	width:95px;
	height:95px;
}
.reviews{
	display:flex;
	height:113px;
	flex-direction:row;
	justify-content: space-between;
	border-bottom:0.8px solid #D9D9D9; 
	margin-top:20px;
}
.reviews .rLeft{
	width:85%;
	paddin:5px;
}

.rStar img{
	width:14px;
	height:14px;
}
.rStar{
	margin-bottom:11px;
}
.options{
	color:#ACACAC;
	font-size:12px;
}

.photoList p{
	color:#707680;
	text-align:center;
}
.photoList .bold{
	    font-weight: bold;
}
.photoList .writeReview{
	width:224px;
	height:48px;
	color:white;
	background:black;
}
</style>
<body>
<%@ include file="/WEB-INF/views/component/everyHeader.jsp" %>
<div id="wrapper">
<%@ include file="/WEB-INF/views/component/mySize.jsp" %>
<div class="detailHead">
<div class="imageWrap">
	<div class="bigImage">
		<c:forEach items="${goods.dbImages }" var="image" varStatus="status">
			<img src="${fn:replace(fn:replace(image, '[', ''), ']', '')}" class="invisible">
		</c:forEach>
	</div>
	<div class="smallImage">
		<ul>
			<c:forEach items="${goods.dbImages }" var="image" varStatus="status">
				<li><img src="${fn:replace(fn:replace(image, '[', ''), ']', '')}" onclick="fn_changeBigImage(${status.index},event)"></li>
			</c:forEach>
		</ul>
	</div>
</div>
<div class="detailWrap">
	<p><span class="title">${goods.goodsName }</span>
		<c:if test="${goods.goodsBest!=0 }">
			<span class="box">BEST</span>
		</c:if>
		<c:if test="${goods.goodsSale!=0 }">
			<span class="box">SALE</span>
		</c:if>
	</p>
	<p class="detail">
		${goods.goodsDetail }
	</p>
	<hr class="line">
	<div class="goodsInfo">
		<p><label>판매가</label><span>
			<c:if test="${goods.goodsSale!=0 }">
				<span class="separate">${goods.goodsPrice }</span><span class="goodsPrice"> ${goods.goodsPrice-((goods.goodsSale/100)*goods.goodsPrice) }</span>
			</c:if>
			<c:if test="${goods.goodsSale==0 }">
				<span class="goodsPrice">${goods.goodsPrice }</span>
			</c:if>원
		</span></p>
		<p><label>적립금</label><span>
			${goods.goodsPrice*0.01}원
		</span></p>
		<p><label>색상</label>
			<c:forEach items="${goods.goodsColor}" var="color">
				<span><button onclick="fn_clickColor(`${color}`,event)">${color }</button></span>
			</c:forEach>
		</p>
		<p>
			<label>사이즈</label>
			<c:forEach items="${goods.goodsSize}" var="size">
				<span><button onclick="fn_clickSize(`${size}`,event)">${size }</button></span>
			</c:forEach>
		</p>
		<c:if test = "${goods.goodsType!=7&&$goods.goodsType!=8 &&$goods.goodsType!=9 }">
		<button id="mySize" onclick="fn_clickMySize(event)">나의 사이즈 보기</button>
		</c:if>
		
		<div class="selectBox">
		
			<p class="totalP"></p>
		</div>
		<hr class="line">
		<div class="buttonBox">
			<button>BUY IT NOW</button>
			<button>장바구니 추가</button>
			<button type="button" onclick="fn_clickWish()">위시리스트 추가</button>
		</div>
	</div>
</div>
</div>
<div class="detailTail">
	<hr class="detailLine">
	<div class="tailHead">
		<span class="menu" onclick="fn_clickCompo(event,0)"><span class="circle"></span>디테일</span><span class="menu" onclick="fn_clickCompo(event,1)"><span class="hidden circle"></span>리뷰</span><span class="menu" onclick="fn_clickCompo(event,2)"><span class="hidden circle"></span>Q&A</span><span class="menu" onclick="fn_clickCompo(event,3)"><span class="hidden circle"></span>가이드</span><span class="menu" onclick="fn_clickCompo(event,4)"><span class="hidden circle"></span>추천상품/관련상품</span>
	</div>
	<div class="tailTail">
		<div class="detailCompo compo">
		</div>
		<div class="reviewCompo compo hidden">
			<%@ include file="/WEB-INF/views/goods/detailReview.html" %>
		</div>
		<div class="qnaCompo comp hidden"></div>
		<div class="guideCompo compo hidden"></div>
		<div class="goodsCompo compo hidden"></div>
	</div>
</div>
</div>
<%@ include file="/WEB-INF/views/component/homeFooter.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/resources/js/StringUtil.js"></script>
<script th:inline="javascript">
var goodsName = `${goods.goodsName}`;
var indexId = `${goods.goodsIndexId}`;
var userId = `${user.userId}`;
var goodsList = [];
var goods = null;
<c:forEach items="${goodsList}" var="goods">
	goods = {
			goodsId:`${goods.goodsId}`,
			goodsColor:`${goods.goodsColor}`,
			goodsSize:`${goods.goodsSize}`,
	}
	goodsList.push(goods)
</c:forEach>
<c:set var="images" value="${fn:split(goods.dbImages, ',')}"/>
var last = [[${fn:length(images)}]]-1;
var index = 0;
var before = last;
bigSlide();
var intervalSlide = setInterval(bigSlide,3000);
function bigSlide(){
	$(".bigImage").children().eq(before).removeClass("visible");
	$(".bigImage").children().eq(index).addClass("visible");
	$(".smallImage").children().children().eq(before).children().removeClass("redBorder");
	$(".smallImage").children().children().eq(index).children().addClass("redBorder");
	before= index;
	index++;
	if(index> last){
		index = 0;
		before = last;
	}
	
}
function fn_changeBigImage(statusIndex,event){
	event.target.parentNode.parentNode.childNodes.forEach(function(el,i){
		if(i%2==1){
			el.childNodes[0].classList.remove("redBorder");
		}
		
	});
	event.target.classList.add("redBorder");
	clearInterval(intervalSlide);
	index = statusIndex;
	bigSlide();
	intervalSlide = setInterval(bigSlide,3000);
}
var colorlength = ${fn:length(colors)};
var sizelength = ${fn:length(sizes)};
var colorAndSize = {};

var size = false;
var color = false;
var sizeName = "";
var colorName = "";
function fn_clickSize(inputsize,event){
	event.target.parentNode.parentNode.childNodes.forEach((el,i)=>{
		if(el.tagName=="SPAN"){
			el.childNodes[0].style.background = "white";
		}
	});
	event.target.style.background = "#D9D9D9";
	size = true;
	sizeName = inputsize;
	let attrName =colorName+"/"+sizeName;
	let className = colorName.replace(" ","")+sizeName.replace(" ","");
	
	if(size&&color){
		if(colorAndSize[attrName]!=undefined&&colorAndSize[attrName]!=0){
			colorAndSize[attrName]++;
			$("."+className).children().eq(1).children().val(colorAndSize[attrName]);
			fn_totalPrice();
		}else{
			var div = document.createElement("div");
			div.setAttribute("class","inputGoods "+className);
			var input = "<p>"+goodsName+"<button class='deleteGoods' onclick='fn_deleteCart(`"+attrName+"`,event)'>X</button></p>"
			+"<p>"+colorName+"/"+sizeName+"<input type='number' value='1' min='1' onchange='fn_changePrice(`"+attrName+"`,event)'></p>";
			div.innerHTML = input;
			$(".selectBox").prepend(div);
			
			/*위시리스트 추가*/
			let goods = fn_createGoods(colorName,sizeName);
			div.append(goods);
			
			colorAndSize[attrName]=1;
			fn_totalPrice();
		}
		size = false;
		color = false;
	}
}
function fn_clickColor(inputcolor,event){
	event.target.parentNode.parentNode.childNodes.forEach((el,i)=>{
		if(el.tagName=="SPAN"){
			el.childNodes[0].style.background="white";
		}
	});
	event.target.style.background = "#D9D9D9";
	color =true;
	colorName= inputcolor;
	let attrName =colorName+"/"+sizeName;
	let className = colorName.replace(" ","")+sizeName.replace(" ","");
	if(size&&color){
		if(colorAndSize[attrName]!=undefined&&colorAndSize[attrName]!=0){
			colorAndSize[attrName]++;
			$("."+className).children().eq(1).children().val(colorAndSize[attrName]);
			fn_totalPrice();
		}else{
			var div = document.createElement("div");
			div.setAttribute("class","inputGoods "+className);
			var input = "<p>"+goodsName+"<button class='deleteGoods' onclick='fn_deleteCart(`"+attrName+"`,event)'>X</button></p>"
			+"<p>"+colorName+"/"+sizeName+"<input type='number' value='1' min='1' onchange='fn_changePrice(`"+attrName+"`,event)'></p>";
			div.innerHTML = input;
			$(".selectBox").prepend(div);
			colorAndSize[attrName]=1;
			fn_totalPrice();
			/*위시리스트 추가*/
			let goods = fn_createGoods(colorName,sizeName);
			div.append(goods);
		}
		size = false;
		color = false;
	}
}
function fn_totalPrice(){
	var p = document.querySelector(".totalP");
	var total = 0;
	Object.keys(colorAndSize).forEach(function(k){
		
	    total+= colorAndSize[k]*$(".goodsPrice").text();
	});
	var input = "<label id='totalTitle'>TOTAL</label>"
	+total+"원";
	p.innerHTML = input;
}
function fn_deleteCart(attrName){
	let total = 0;
	Object.keys(colorAndSize).forEach(function(k){
		if(k!=attrName){
			total+= colorAndSize[k]*$(".goodsPrice").text();
		}
	    
	});
	let p = document.querySelector(".totalP");
	let input =  "<label id='totalTitle'>TOTAL</label>"
		+total+"원";
	p.innerHTML = input;
	
	
	colorAndSize[attrName] = 0;
	event.target.parentNode.parentNode.remove();
	
	
}
function fn_changePrice(attrName,event){
	let count = event.target.value;
	colorAndSize[attrName] = count;
	
	var p = document.querySelector(".totalP");
	var total = 0;
	Object.keys(colorAndSize).forEach(function(k){
		
	    total+= colorAndSize[k]*$(".goodsPrice").text();
	});
	var input = "<label id='totalTitle'>TOTAL</label>"
	+total+"원";
	p.innerHTML = input;
}
function fn_clickMySize(event){
	
	$(".bodyWrap").css("display","block");
}
$(".closeSize").click(function(){
	
	$(".bodyWrap").css("display","none");
});
function fn_createGoods(colorName,sizeName){
	
	let goods = document.createElement("input");
	goods.setAttribute("type","text");
	goods.setAttribute("name","goods_id");
	goods.classList.add("hidden");
	
	for(let i = 0;i<goodsList.length;i++){
		if(goodsList[i].goodsColor==colorName&&goodsList[i].goodsSize==sizeName){
			goods.setAttribute("value",goodsList[i].goodsId);
		}
	}
	return goods;
}
function fn_clickWish(){
	if(userId==""||userId=="null"){
		alert("로그인해 주세요.");
		return;
	}else{
		$(".inputGoods").each(function(i,el){
			let goodsId = $(el).children().eq(2).val();
			let goodsIndexId = indexId;
			$.ajax({
				url:"/user/love?user_id="+userId+"&goods_id="+goodsId+"&goods_index_id="+goodsIndexId,
				type:"get",
				success:function(){
					alert("찜목록에 추가되었습니다.")
				}
			})
		})
	}
	
}
function fn_clickCompo(event,type){
	$(".tailHead").children().each(function(i,el){
		if(i!=type){
			$(el).children().eq(0).addClass("hidden");
		}else{
			$(el).children().eq(0).removeClass("hidden");
		}
	});
	$(".tailTail").children().each(function(i,el){
		if(i!=type){
			$(el).addClass("hidden");
		}else{
			$(el).removeClass("hidden");
		}
	})
}
if(${starMap.five}==${top}){
	$(".stickWrap").each(function(i,el){
		if(i==0){
			$(el).children().eq(1).children().eq(0).children().eq(0).attr("fill","red");
			$(el).children().eq(0).removeClass("hidden");
		}
	})
}
if(${starMap.four}==${top}){
	$(".stickWrap").each(function(i,el){
		if(i==1){
			$(el).children().eq(1).children().eq(0).children().eq(0).attr("fill","red");
			$(el).children().eq(0).removeClass("hidden");
		}
	})
}
if(${starMap.three}==${top}){
	$(".stickWrap").each(function(i,el){
		if(i==2){
			$(el).children().eq(1).children().eq(0).children().eq(0).attr("fill","red");
			$(el).children().eq(0).removeClass("hidden");
		}
	})
}
if(${starMap.two}==${top}){
	$(".stickWrap").each(function(i,el){
		if(i==3){
			$(el).children().eq(1).children().eq(0).children().eq(0).attr("fill","red");
			$(el).children().eq(0).removeClass("hidden");
		}
	})
}
if(${starMap.one}==${top}){
	$(".stickWrap").each(function(i,el){
		if(i==4){
			$(el).children().eq(1).children().eq(0).children().eq(0).attr("fill","red");
			$(el).children().eq(0).removeClass("hidden");
		}
	})
}
if(${starMap.zero}==${top}){
	$(".stickWrap").each(function(i,el){
		if(i==5){
			$(el).children().eq(1).children().eq(0).children().eq(0).attr("fill","red");
			$(el).children().eq(0).removeClass("hidden");
		}
	})
}
let nick = "";
let starImg = null;
let notStar = null;
<c:forEach items='${reviewList}' var="review" varStatus="status">
	$(".nick").eq(`${status.index}`).text(blindNick(`${review.userId}`));
	<c:if test="${review.star!=null}">
	for(let i= 0;i<${review.star};i++){
		starImg = document.createElement("img");
		starImg.setAttribute("src","/resources/images/KakaoTalk_Photo_2023-05-30-12-51-39.png");
		
		$(".rStar").eq(`${status.index}`).append(starImg);
	}
	for(let i=0;i<${5-review.star};i++){
		notStar = document.createElement("img");
		notStar.setAttribute("src","/resources/images/KakaoTalk_Photo_2023-05-30-12-51-43.png");
		$(".rStar").eq(`${status.index}`).append(notStar);
	}
	</c:if>
</c:forEach>
var width = 0;
<c:forEach items="${reviewList}" var="review">
	<c:forEach items="${review.imageUrls}" var="img">
		width +=120;
	</c:forEach>
</c:forEach>

$(".shiftRight").click(function(event){
	let boxWidth =document.querySelector(".photos").clientWidth+""
	let amount = Math.floor(boxWidth/120);
	let marginLeft = amount*120;
	let old = $(".photos span").css("marginLeft");
	let left = 0;
	if(old=="0px"){
		left = -marginLeft
	}else{
		left = old.replaceAll(/[a-z|\%]/g,"")-marginLeft
	}
	if(left<-width){
		left = 0;
	}
	$(".photos span").css({"margin-left":left+"px","transition":"all ease 2s 0s"})
	
	
});
$(".shiftLeft").click(function(event){
	let boxWidth =document.querySelector(".photos").clientWidth+""
	let amount = Math.floor(boxWidth/120);
	let marginLeft = amount*120;
	let old = $(".photos span").css("marginLeft");
	let left = 0;
	if(old=="0px"){
		left = 0;
	}else{
		left = Number(old.replaceAll(/[a-z|\%]/g,""))+marginLeft
	}
	
	$(".photos span").css({"margin-left":left+"px","transition":"all ease 2s 0s"})
	
})
</script>
</body>
</html>