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
      		
      		<div style="width:110px;">
      			<button class="d">주문하기</button>
				<button class="d">관심상품등록</button>
				<button class="d">삭제</button>
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
				<button class="d">삭제</button>
				<button class="d">해외배송상품 장바구니로 이동</button>
			</div>
			
			<div class="right"> 
				<button class="d">장바구니 비우기</button>
				<button class="d">견적서 출력</button>
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
	      	<div class="main" id="finalprice" value="16900" style="width: 1000%; height:100%;"> 
	      		= 16,900원
			</div>
		</div>

		<div class="main order"> 
			<button class="iamportinit" type="button">전체상품주문</button>
			<button class="iamportinit" type="button">선택상품주문</button>
			<button>쇼핑계속하기</button>
		</div>
		
		<div class="main order" style=""> 
			<button id="iamportPayment" type="button"> kakao pay 구매</button>
			<button id="iamportnaver" type="button">naver pay 구매</button>
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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script th:inline="javascript">

var finalprice = document.getElementById('finalprice').value
//문서가 준비되면 제일 먼저 실행
$(document).ready(function(){ 
	$("#iamportPayment").click(function(){ 
    	payment(); //버튼 클릭하면 호출 
    }); 
    $(".iamportinit").click(function(){ 
    	innit(); //버튼 클릭하면 호출 
    }); 
    $("#iamportnaver").click(function(){ 
    	naver(); //버튼 클릭하면 호출 
    }); 
})


//버튼 클릭하면 실행
function payment(data) {
    IMP.init('imp41702258');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
    IMP.request_pay({// param
        pg: "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
        pay_method: "card", //지불 방법
        merchant_uid: "iamport_test_id?<%=System.currentTimeMillis() %>", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name: "도서", //결제창에 노출될 상품명
        amount: $("#finalprice").attr("value"), //금액
        buyer_email : "testiamport@naver.com", 
        buyer_name : "홍길동",
        buyer_tel : "01012341234"
    }, function (rsp) { // callback
        if (rsp.success) {
            alert("완료 -&gt; imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid);
        } else {
            alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
        }
    });
}

function innit(data){
	IMP.init('imp41702258');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
    IMP.request_pay({// param
        pg: "html5_inicis", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
        pay_method: "card", //지불 방법
        merchant_uid: "iamport_test_id?<%=System.currentTimeMillis() %>", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name: "도서", //결제창에 노출될 상품명
        amount: $("#finalprice").attr("value"), //금액
        buyer_email : "testiamport@naver.com", 
        buyer_name : "홍길동",
        buyer_tel : "01012341234"
    }, function (rsp) { // callback
        if (rsp.success) {
            alert("완료 -&gt; imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid);
        } else {
            alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
        }
    });
}

function naver(data){
IMP.init('imp41702258');
IMP.request_pay({
    pg : 'naverpay',
    merchant_uid: "order_no_0001", //상점에서 관리하는 주문 번호
    name : '주문명:결제테스트',
    amount : 14000,
    tax_free : 4000, //면세공급가액(누락되면 0원으로 처리)
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456',
    naverUseCfm : '20201001', //이용완료일자 (네이버페이 계약시 필수 파라미터로 설정된 경우에만 설정합니다.)
    naverPopupMode : true, //팝업모드 활성화
    m_redirect_url : "${pageContext.request.contextPath}/", //예 : http://yourservice.com/payments/complete
    naverPurchaserName: "구매자이름",
    naverPurchaserBirthday: "20151201",
    naverChainId: "sAMplEChAINid",
    naverMerchantUserKey: "가맹점의 사용자 키",
    naverProducts : [{
      "categoryType": "BOOK",
			"categoryId": "GENERAL",
			"uid": "107922211",
			"name": "한국사",
			"payReferrer": "NAVER_BOOK",
			"sellerId": "sellerA",
			"count": 10
		},
		{
			"categoryType": "MUSIC",
			"categoryId": "CD",
			"uid": "299911002",
			"name": "러블리즈",
			"payReferrer": "NAVER_BOOK",
			"sellerId": "sellerB",
			"count": 1
		}]
}, function(rsp) { //팝업 방식으로 진행 또는 결제 프로세스 시작 전 오류가 발생할 경우 호출되는 callback
    if ( rsp.success ) {
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	jQuery.ajax({
    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
    		type: 'POST',
    		dataType: 'json',
    		data: {
	    		imp_uid : rsp.imp_uid
	    		//기타 필요한 데이터가 있으면 추가 전달
    		}
    	}).done(function(data) {
    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    		if ( everythings_fine ) {
    			var msg = '결제가 완료되었습니다.';
    			msg += '\n고유ID : ' + rsp.imp_uid;
    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    			msg += '\n결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;

    			alert(msg);
    		} else {
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    		}
    	});
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;

        alert(msg);
    }
});
}
</script>
<div id="scrollbottom"></div>
</body>
</html>