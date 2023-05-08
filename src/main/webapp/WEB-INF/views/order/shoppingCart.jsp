<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/common.css" rel="stylesheet" type="text/css">
<title>장바구니 페이지</title>
</head>
<style>
	body, html{
		width:100%;
		height:100%;
		margin:0;
		position:relative;
	}
	.main {
    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
    width: 1080px;
    height: 50px;
    display: flex;
    align-items: center; /* 하위 요소들 수직 가운데정렬 */
    position: relative;
    text-align : center;
    justify-content : center;
  }
	.left{
 		width: 600px;
	    text-align: left;
	    font-size: 15px;
	    float:left;
  	}
  	.right{
 		width: 600px;
	    text-align: right;
	    font-size: 15px;
	    float:right;
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
	.goodsName{
		width:262px;
		margin-top:348px;
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
	.wide{
		width:500px;
	}
	hr{
	  width:100%;
	  border : 0px;
	  border-top: 2px solid #DCDCDC;
	}
	
	.height{
		height:200px;
	}
	
	.order{
		width:450px;
		height:80px;
		margin-block: 15px;
	}
	
	.order button{
		width:100%;
		height:100%;
	}
</style>
<body>
    <header><%@ include file="/WEB-INF/views/component/homeHeader.jsp" %></header>
    <main>
    	
    	<div class="main"> 
			<div>CART</div>
		</div>	
		<div class="main"> 
			<div >
				<button class="wide">국내배송상품(1)</button>
				<button class="wide">해외배송상품(0)</button>
			</div>
		</div>	
		<div class="main"> 
			<div class="left"> 
			 일반상품(1)
			</div>
			<div class="right"> 
			 
			</div>
		</div>
		<div class="main"> 
		<hr>
		</div>
		<div class="main"> 
		<label style="width: 100px;"><input type="checkbox" name="color" value="blue"></label>
		<div style="width: 200px;">이미지</div>
		<div style="width: 400px;">상품정보</div>
		<div style="width: 100px;">판매가</div>
		<div style="width: 100px;">수량</div>
		<div style="width: 100px;">적립금</div>
		<div style="width: 100px;">배송구분</div>
		<div style="width: 100px;">배송비</div>
		<div style="width: 100px;">합계</div>
		<div style="width: 100px;">선택</div>
		</div>
		
		<div class="main"> 
		<hr>
		</div>
		
		<div class="main height"> 
			<label style="width: 100px;"><input type="checkbox" name="color" value="blue"></label>
			<a href="detail?goodsId=${list.goodsId}" class="product">
               <img src="https://sampleprojectbucket.s3.ap-northeast-2.amazonaws.com/bottom/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202023-03-20%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%202.16.09.png" style="width:150px; height:200px; margin:10px;" alt="" class="lb-image">
      		<div style="width: 400px;">
      		<a >리코 부클 꽈배기 크롭 가디건 (5 color)</a>
      		<a >리코 부클 꽈배기 크롭 가디건 (5 color)</a>
      		<a >리코 부클 꽈배기 크롭 가디건 (5 color)</a>
      		</div>
      		
      		<div style="width: 100px;">
      		14,400원
      		</div>
      		
      		<div style="width: 100px;">
      		1
      		</div>
      		
      		<div style="width: 100px;">
      		-
      		</div>
      		
      		<div style="width: 100px;">
      		일반배송
      		</div>
      		
      		<div style="width: 100px;">
      		2,500원 조건
      		</div>
      		
      		<div style="width: 100px;">
      		14,400원
      		</div>
      		
      		<div style="width: 100px;">
      			<button class="d">국내배송상품(1)</button>
				<button class="d">해외배송상품(0)</button>
				<button class="d">해외배송상품(0)</button>
      		</div>
		</div>
		
		<div class="main"> 
		<hr>
		</div>
		
		<div class="main"> 
			<div class="left"> 
			 [기본배송]
			</div>
			<div class="right"> 
			 상품구매금액 14,400원 + 배송비 2,500원 = 합계 : 16,900원
			</div>
		</div>
		
		<div class="main"> 
		<hr>
		</div>
		
		<div class="main"> 
			<div class="left"> 
				선택상품을 
				<button class="d">국내배송상품(1)</button>
				<button class="d">해외배송상품(0)</button>
			</div>
			
			<div class="right"> 
				<button class="d">국내배송상품(1)</button>
				<button class="d">해외배송상품(0)</button>
			</div>
		</div>
		
		<div class="main" style="border-right: 1px solid #DCDCDC; border-left: 1px solid #DCDCDC; border-top: 1px solid #DCDCDC;"> 
			<div style="width: 200%;">
      		총 상품금액
      		</div>
      		
      		<div style="width: 200%;">
      		총 배송비
      		</div>
      		
      		<div style="width: 1000%;">
      		결제예정금액
      		</div>
		</div>
		
		<div class="main" style="border: 1px solid #DCDCDC;"> 
			<div class="main" style="border-right: 1px solid #DCDCDC; width: 200%; height:100%;"> 
	      		14,400원
	      	</div>
	      	<div class="main" style="border-right: 1px solid #DCDCDC; width: 200%; height:100%;"> 
	      		2,500원
	      	</div>
	      	<div class="main" style="width: 1000%; height:100%;"> 
	      		= 16,900원
			</div>
		</div>

		<div class="main order"> 
			<button>국내배송상품(1)</button>
			<button>해외배송상품(0)</button>
			<button>해외배송상품(0)</button>
		</div>
		
		<div class="main order"> 
			<button>국내배송상품(1)</button>
			<button>해외배송상품(0)</button>
			<button>해외배송상품(0)</button>
		</div>
		
		<div class="main" style="border-right: 1px solid #DCDCDC; border-left: 1px solid #DCDCDC; border-top: 1px solid #DCDCDC; margin-top: 30px;"> 
			<div class="left"> 
			 이용안내
			</div>
			<div class="right"> 
			 
			</div>
		</div>
		
		<div class="main" style="border: 1px solid #DCDCDC; height: 150px;"> 
			<div class="inner" style="text-align:left;">
                        	<장바구니 이용안내>
                        <ol>
                            <li class="item1">해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
                            <li class="item2">해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
                            <li class="item3">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
                            <li class="item4">[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
                            <li class="item5">장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
                            <li class="item6">파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
                        </ol>
                        </div>
        </div>
        <div class="main" style="border: 1px solid #DCDCDC; height: 150px; margin-bottom: 200px;"> 
                        <div class="inner" style="text-align:left;">
                        	<무이자할부 이용안내>
                        <ol>
                            <li class="item1">상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
                            <li class="item2">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
                            <li class="item3">단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
                            <li class="item4">
                                무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가 표시됩니다.
                                <br/>
                                실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기 바랍니다.
                            </li>
                        </ol>
                    </div>
		</div>
		
	<%@ include file="/WEB-INF/views/component/up_down_support.jsp" %>
	</main>
	<footer><%@ include file="/WEB-INF/views/component/homeFooter.jsp" %></footer>
	
<script src="https://code.jquery.com/jquery-3.6.3.slim.min.js" integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo=" crossorigin="anonymous"></script>
<script th:inline="javascript">
var goodsName = `${goods.goodsName}`;
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
</script>
</body>
</html>