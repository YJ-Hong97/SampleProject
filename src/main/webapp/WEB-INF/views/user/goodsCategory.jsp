<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/common.css" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>카테고리별 상품 페이지 </title>
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
	    width: 1300px;
	    margin-left: auto;
	    margin-right: auto;
	}
	.products{
	    display: inline-flex;
	    width: 320px;
	    height: 510px;
	}
	
	.product{
	    display: block;
	    width: 300px;
	    text-align: left;
	    text-decoration:none;
	    color: black;
	    float:left;
	    margin-left: 10px;
	    margin-right: 10px;
	    margin-bottom: 30px;
	}
	
	
	.clearfix{
	    clear: both;
	}
	.nav{
 		width:100%;
 		text-align:center;
 		margin-top:20px;
 	}
 	
 	.top{
	 	display: inline-flex;
	    align-items: center;
	    justify-content: center;
 		border-radius:50%;
 		border:solid 2px #eaeaea;
 		width:calc(100vw * (45 / 1920));
 		height: calc(100vw * (45 / 1920));
 	}
 	.bottom{
	 	display: inline-flex;
	    align-items: center;
	    justify-content: center;
 		border-radius:50%;
 		border:solid 2px #eaeaea;
 		width:calc(100vw * (45 / 1920));
 		height: calc(100vw * (45 / 1920));
 	}
 	.goodsColors{
		width:262px;
		font-size: 15px;
    	color: #787878;
    	text-align:left;
	}
	.goodsColors li{
		display:inline-block;
		width:20px;
		height:10px;
		margin-left:1px;
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
</style>
<body>
    <header><%@ include file="/WEB-INF/views/component/everyHeader.jsp" %></header>
    <main>
    	
    	<div class="main">  
    	
    		<c:forEach items="${goodsSmallType }" var="type" varStatus="i">
						${type.typeName }<c:if test="${i.last eq false}"> | </c:if>
				</c:forEach>
    	</div>
    	<div class="main">
    	<div class="left main">
 		Total : ${count}
 		</div>
 			<div class="right main">
		 			<table>
		  			<tr>
		  				<th><button class="custom-btn btn-1"
		         type="button" onclick="getGoods_sort('${page.page}','${goodsType}','goods_best')">인기순</button></th>
		  				<th><button class="custom-btn btn-1"
		         type="button" onclick="getGoods_sort('${page.page}','${goodsType}','goods_date')">신상품순</button></th>
		  				<th><button class="custom-btn btn-1"
		         type="button" onclick="getGoods_sort('${page.page}','${goodsType}','goods_price_down')">낮은가격순</button></th>
		  				<th><button class="custom-btn btn-1"
		         type="button" onclick="getGoods_sort('${page.page}','${goodsType}','goods_price_up')">높은가격순</button></th>
		  				<th><button class="custom-btn btn-1"
		         type="button" onclick="getGoods_sort('${page.page}','${goodsType}','goods_icon')">icon</button></th>
		  			</tr>
		  		</table>
  			</div>
  		</div>
  		<div class="product-list">
   		<c:forEach items="${mainImage}" var="list" varStatus="i">
   			<div>


   			 <div class="right_area">
 				  <a href="javascript:;" class="icon heart">
 				     <img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기" value="${goods.goodsId }">
 				  </a>
 			</div>
   			   <a href="detail?goodsId=${list.goodsId}" class="product">
               <img src=${fn:replace(fn:replace(list.ImageList[0], '[', ''), ']', '')}  style="width:300px; height:400px;" alt="" class="lb-image">
      			<ul class="goodsColors">
				<c:forEach items="${list.colors }" var="color">
					<li style="background-color:${color};"></li>
				</c:forEach>
				</ul>		
				<div class="product-name">
         	           ${list.goodsName}
                </div>
                <div class="product-price">
                    ${list.goodsPrice}원
                </div>
                
                <p class="special">
					<c:if test="${list.goodsBest !=0}">
						<span class="best">BEST</span>
					</c:if>
					
				</p>
                 </a>
            </div>
			
            </c:forEach> 
             <div class="clearfix"></div>

         </div>
        <div class="nav">
 		<a class="prev" onClick="prevPage('${page.page-1}','${goodsType}','${orderBy}')">&#60;</a>
 		<c:forEach items="${page.pageList }" var="page">
 			<button onclick="getGoods_sort('${page-1}','${goodsType}','${orderBy}')">${page }</button>
 		</c:forEach>
 		<a class="next" onClick="nextPage('${page.page+1}','${count }','${goodsType}','${orderBy}')">&#62;</a>
 	</div>
 	
<%@ include file="/WEB-INF/views/component/up_down_support.jsp" %>

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

	function getGoods_sort(pageNum,goodsType,orderBy) {
  		location.href=`<%request.getContextPath();%>?pageNum=`+pageNum+`&goodsType=`+goodsType+`&orderBy=`+orderBy;
  		}
  		
	function prevPage(pageNum,goodsType,orderBy){
		if(pageNum==-1){
			location.href=`<%request.getContextPath();%>?pageNum=`+0+"&goodsType="+goodsType+"&orderBy="+orderBy;
		}else{
			location.href=`<%request.getContextPath();%>?pageNum=`+pageNum+"&goodsType="+goodsType+"&orderBy="+orderBy;
		}
	}
	function nextPage(pageNum,count,goodsType,orderBy){
		if(Math.floor(count/10)<pageNum){
			location.href=`<%request.getContextPath();%>?pageNum=`+Math.floor(count/10)+"&goodsType="+goodsType+"&orderBy="+orderBy;
		}else{
			location.href=`<%request.getContextPath();%>?pageNum=`+pageNum+"&goodsType="+goodsType+"&orderBy="+orderBy;
		}
	}
  		
</script>
<div id="scrollbottom"></div> 
</body>
</html>