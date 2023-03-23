<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Detail</title>
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
  	.right{
 		width: 600px;
	    text-align: center;
	    font-size: 15px;
	    float:right;
  	}
  	.left{
 		width: 600px;
	    text-align: center;
	    font-size: 15px;
	    float:left;
  	}
	button {
  		outline: none;
	}
	.custom-btn {
	  border: 2px solid #e8e8e8;
	  font-family: 'Lato', sans-serif;
	  font-weight: 500;
	  background: transparent;
	  cursor: pointer;
	  transition: all 0.3s ease;
	  position: relative;
	  display: inline-block;
	}
	
	.btn-1 {
	  transition: all 0.3s ease;
	}
	.btn-1:hover {
	   box-shadow:
	   -7px -7px 20px 0px #fff9,
	   -4px -4px 5px 0px #fff9,
	   7px 7px 20px 0px #0002,
	   4px 4px 5px 0px #0001;
	}
	.goodsWrap{
		display: block;
	    width: 1300px;
	    text-align: center;
	    text-decoration:none;
	    background-color: rgb(242, 236, 222);
	    margin: auto;
	    margin-bottom: 30px;
	}
	 a{
  text-decoration:none; color:inherit; cursor: pointer;
}
 .right_area .icon{
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: calc(100vw * (45 / 1920));
    height: calc(100vw * (45 / 1920));

    border-radius: 50%;
    border: solid 2px #eaeaea;
    background-color: #fff;
    position: absolute;
	transform: translate(650%, 50%);
}

.icon.heart img{
    width: calc(100vw * (24 / 1920));
    height: calc(100vw * (24 / 1920));
}

.icon.heart.fas{
  color:red
}
.heart{
    transform-origin: center;
}


@keyframes animateHeart{
    0%{transform:scale(.2);}
    40%{transform:scale(1.2);}
    100%{transform:scale(1);}
  }
	.product-list{
	    width: 1280px;
	    margin-left: auto;
	    margin-right: auto;
	}
	.products h3{
	    font-size: 24px;
	    color: #545454;
	    margin-top:60px;
	    margin-bottom: 60px;
	    text-align: center;
	}
	
	.product{
	    display: block;
	    width: 300px;
	    text-align: center;
	    text-decoration:none;
	    color: black;
	    float:left;
	    margin-left: 10px;
	    margin-right: 10px;
	    margin-bottom: 30px;
	}
	
	.product-name{
	    margin-top: 20px;
	    margin-bottom: 4px;
	}
	
	.clearfix{
	    clear: both;
	}
</style>
<body>
    <header><%@ include file="/WEB-INF/views/component/homeHeader.jsp" %></header>
    <main>
    	<div class="main">
    		top
    	</div>
    	<div class="main">
    		반팔 | 긴팔 | 맨투맨/후드 | 가디건
    	</div>
    	<div class="main">
    	<div class="left main">
 		Total : ${count}
 		</div>
 			<div class="right main">
		 			<table>
		  			<tr>
		  				<th><button class="custom-btn btn-1"
		         type="button" onclick="getGoods_sort('${page.page}','${goods.goodsType}','goods_best')">인기순</button></th>
		  				<th><button class="custom-btn btn-1"
		         type="button" onclick="getGoods_sort('${page.page}','${goods.goodsType}','goods_date')">신상품순</th>
		  				<th><button class="custom-btn btn-1"
		         type="button" onclick="getGoods_sort('${page.page}','${goods.goodsType}','goods_price_down')">낮은가격순</th>
		  				<th><button class="custom-btn btn-1"
		         type="button" onclick="getGoods_sort('${page.page}','${goods.goodsType}','goods_price_up')">높은가격순</th>
		  				<th><button class="custom-btn btn-1"
		         type="button" onclick="getGoods_sort('${page.page}','${goods.goodsType}','goods_icon')">icon</th>
		  			</tr>
		  		</table>
  			</div>
  		</div>
  		<div class="product-list">
  			<div>
  			 <div class="right_area">
				  <a href="javascript:;" class="icon heart">
				     <img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기" value="${goods.goodsId }">
				  </a>
			</div>
  			   <a href="#" class="product">
               <img src="#" width="300" height="400px" >
				<div class="product-name">
         	           Sunglasses
                </div>
                <div class="product-price">
                    49,000
                </div>
                 </a>
            </div>
			
            <div class="right_area">
				  <a href="javascript:;" class="icon heart">
				     <img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
				  </a>
			</div>
            <a href="#" class="product">
                <img src="https://bakey-api.codeit.kr/files/629/images/sunglasses.jpg" width="300" height="400px">
                <div class="product-name">
                    Sunglasses
                </div>
                <div class="product-price">
                    49,000
                </div>
            </a>

            <div class="right_area">
				  <a href="javascript:;" class="icon heart">
				     <img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
				  </a>
			</div>
            <a href="#" class="product">
                <img src="https://bakey-api.codeit.kr/files/629/images/sunglasses.jpg" width="300" height="400px">
                <div class="product-name">
                    Sunglasses
                </div>
                <div class="product-price">
                    49,000
                </div>
            </a>

            
            <a href="#" class="product">
                <img src="https://bakey-api.codeit.kr/files/629/images/sunglasses.jpg" width="300" height="400px">
                <div class="product-name">
                    Sunglasses
                </div>
                <div class="product-price">
                    49,000
                </div>
            </a>

            
            <a href="#" class="product">
                <img src="https://bakey-api.codeit.kr/files/629/images/sunglasses.jpg" width="300" height="400px">
                <div class="product-name">
                    Sunglasses
                </div>
                <div class="product-price">
                    49,000
                </div>
            </a>

            <a href="#" class="product">
                <img src="https://bakey-api.codeit.kr/files/629/images/sunglasses.jpg" width="300" height="400px">
                <div class="product-name">
                    Sunglasses
                </div>
                <div class="product-price">
                    49,000
                </div>
            </a>
            
            <a href="#" class="product">
                <img src="https://bakey-api.codeit.kr/files/629/images/sunglasses.jpg" width="300" height="400px">
                <div class="product-name">
                    Sunglasses
                </div>
                <div class="product-price">
                    49,000
                </div>
            </a>
            
            <a href="#" class="product">
                <img src="https://bakey-api.codeit.kr/files/629/images/sunglasses.jpg" width="300" height="400px">
                <div class="product-name">
                    Sunglasses
                </div>
                <div class="product-price">
                    49,000
                </div>          
            </a>
            <div class="clearfix"></div>
        </div>
<a class = "top" style="display:scroll;position:fixed;bottom:30px;right:3px;" rel="nofollow"
href="#" title="Back to Top" style="font-size:2.0em">위로↑</a>
<br />
<a style="display:scroll;position:fixed;bottom:10px;right:3px;" rel="nofollow"
href="#scrollbottom" title="Go to Bottom" style="font-size:2.0em">아래↓</a>

    </main>
    <footer><%@ include file="/WEB-INF/views/component/homeFooter.jsp" %></footer>
<script src="https://code.jquery.com/jquery-3.6.3.slim.min.js" integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo=" crossorigin="anonymous"></script>
<script th:inline="javascript">
$(function(){
    var $likeBtn =$('.icon.heart');

        $likeBtn.click(function(){
        $likeBtn.toggleClass('active');

        if($likeBtn.hasClass('active')){          
           $(this).find('img').attr({
              'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
               alt:'찜하기 완료'
                });
          
          
         }else{
            $(this).find('i').removeClass('fas').addClass('far')
           $(this).find('img').attr({
              'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
              alt:"찜하기"
           })
         }
     })
})
$( document ).ready( function() {
        $( window ).scroll( function() {
          if ( $( this ).scrollTop() > 200 ) {
            $( '.top' ).fadeIn();
          } else {
            $( '.top' ).fadeOut();
          }
        } );
        $( '.top' ).click( function() {
          $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
          return false;
        } );
      } );

</script>
<div id="scrollbottom"></div> 
</body>
</html>