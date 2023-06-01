<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	.bodyWrap{
		position:absolute;
		left:0;
		top:0;
		width:100%;
		height:100%;
		z-index:7;
		background:#D9D9D9;
		background-color: rgba( 255, 255, 255, 0.5 );
		display:none;
	}
	.mySizeWrap{
		width:80%;
		height:1600px;
		background:#fafafa;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
		padding:50px 50px;
		border-radius:10px;
		
	}
	.mySizeInnerWrap{
		
		width:100%;
		height:100%;
		background:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:20px;
		border-radius:10px;
	}
	.closeSize{
		width:40px;
		height:40px;
		border-radius:50%;
		background:#D9D9D9;
		position:absolute;
		left:85%;
		top:60px;
		text-align:center;
		line-height:40px;
	}
	.topWrap{
		width:100%;
		height:61px;
		font-size: 36px;
		line-height:61px;
		font-style:bold;
		text-align:center;
		border-bottom:1px solid black;
	}
	.middleWrap{
		width:100%;
		display:flex;
		flex-direction:row;
	}
	.mySizeTitle{
		font-style: bold;
		font-weight: 1000;		
		font-size: 20px;
	}
	
	.sizeLeftWrap{
		margin-left:50px;
		width:60%;
		border-right:1px solid black;
	}
	.sizeImg{
	 	width:100%;
	}
	.sizeTableWrap{
		display:flex;
		flex-direction:row;
		margin-top:10px;
	}
	.sizeTable{
		width:15%;
		display:flex;
		flex-direction:column;
		
	}
	.sizeTable label{
		width:100%;
		height:30px;
		border:0.1px solid black;
		text-align:center;
		font-size:15px;
		line-height:30px;
		padding:3px 0;
	}
	.sizeTable label:nth-child(1){
		background:#D9D9D9;
	}
	.closeSize{
		cursor:pointer;
	}
	.info{
		font-size:15px;
		color:#999999;
	}
	.tblCheck{
		margin-top:10px;
		width:640px;
		height:306px;
	}
	.tblCheck td{
		border:1px solid #e8e8e8;
		text-align:center;
		line-height:60px;
		width:120px;
	}
	.checkPoint{
		font-style:bold;
		background:#f0f0f0;
	}
	.checkTitle{
		font-style:bold;
		background:#f7f7f7;
	}
	.mySizeWrap div{
		margin-top:25px;
	}
</style>
<body>
<div class="bodyWrap">
<div class="mySizeWrap">
	<div class="closeSize">X</div>
	<div class="mySizeInnerWrap">
		<div class="topWrap">
			<h1>My Fit Size</h1>
		</div>
		<div class="middleWrap">
			<div class="sizeLeftWrap">
				<div>
					<p class="mySizeTitle">Product Info</p>
					<c:choose>
						<c:when test= "${goods.goodsType==0||goods.goodsType==1||goods.goodsType==2||goods.goodsType==3}">
							<img class="sizeImg" src="${sizeImg.top }">
						</c:when>
						<c:when test ="${goods.goodsType==4 }">
							<img class="sizeImg" src="${sizeImg.bottom }">
						</c:when>
						<c:otherwise>
							<img class="sizeImg" src="${sizeImg.skirt }">
						</c:otherwise>
					</c:choose>
				</div>
				<div>
					<p class="mySizeTitle">Size Info</p>
					<c:forEach items="${sizes }" var="size">
					<div class="sizeTableWrap">
							<p>${size.sizeName }</p>
						<c:if test="${size.totalLength!=null }">
							<div class="sizeTable">
								<label>
									총장
								</label>
								<label>
									${size.totalLength }
								</label>
							</div>
						</c:if>
						<c:if test="${size.shoulder!=null }">
							<div class="sizeTable">
								<label>
									어깨단면
								</label>
								<label>
									${size.shoulder }
								</label>
							</div>
						</c:if>
						<c:if test="${size.chest!=null }">
							<div class="sizeTable">
								<label>
									가슴단면
								</label>
								<label>
									${size.chest }
								</label>
							</div>
						</c:if>
						<c:if test="${size.arm!=null}">
							<div class="sizeTable">
								<label>
									팔 길이
								</label>
								<label>
									${size.arm }
								</label>
							</div>
						</c:if>
						<c:if test="${size.armSection!=null }">
							<div class="sizeTable">
								<label>
									팔단면
								</label>
								<label>
									${size.armSection }
								</label>
							</div>
						</c:if>
						<c:if test="${size.armhole!=null }">
							<div class="sizeTable">
								<label>
									암홀
								</label>
								<label>
									${size.armhole }
								</label>
							</div>
						</c:if>
						<c:if test="${size.waist!=null }">
							<div class="sizeTable">
								<label>
									허리
								</label>
								<label>
									${size.waist }
								</label>
							</div>
						</c:if>
						<c:if test="${size.rise!=null }">
							<div class="sizeTable">
								<label>
									밑위
								</label>
								<label>
									${size.rise }
								</label>
							</div>
						</c:if>
						<c:if test="${size.heap!=null }">
							<div class="sizeTable">
								<label>
									힙
								</label>
								<label>
									${size.heap }
								</label>
							</div>
						</c:if>
						<c:if test="${size.thigh!=null }">
							<div class="sizeTable">
								<label>
									허벅지
								</label>
								<label>
									${size.thigh }
								</label>
							</div>
						</c:if>
						<c:if test="${size.hem!=null }">
							<div class="sizeTable">
								<label>
									밑단
								</label>
								<label>
									${size.hem }
								</label>
							</div>
						</c:if>
					</div>
					</c:forEach>
					
					<p class="info">단위: cm</p>
					<div class="info">
						<p>※ 사이즈 재는 법은 위치에 따라 1~3cm 정도의 오차가 있을 수 있습니다.<br>
니트 소재 특성상 총장의 길이가 2-5cm 정도의 오차가 생길수 있습니다.<br>
단추가 있는 상품의 경우 초크 자국이 있을 수 있으며 , 세탁시 사라지는 부분이라 불량이 아닌점 참고 부탁드립니다.<br>
모델컷은 촬영 장소에 따라 디테일컷과 색상 차이가 날수 있으니 참고 부탁드립니다.</p>
					</div>
					<div>
					<p class="mySizeTitle">Check Point</p>
						<table>
						<tbody class="tblCheck">
							<tr>
								<td class="checkTitle">세탁방법</td>
								<td>드라이클리닝</td>
								<td>단독세탁</td>
								<td>일반세탁</td>
								<td>손세탁</td>
							</tr>
							<tr>
								<td class="checkTitle">안감</td>
								<td>있음</td>
								<td>없음</td>
								<td>기모</td>
								<td>양털</td>
							</tr>
							<tr>
								<td class="checkTitle">두께</td>
								<td>도톰함</td>
								<td>보통</td>
								<td>얇음</td>
								<td>-</td>
							</tr>
							<tr>
								<td class="checkTitle">비침</td>
								<td>비침</td>
								<td>약간</td>
								<td>없음</td>
								<td>밝은 색만 비침</td>
							</tr>
							<tr>
								<td class="checkTitle">신축성</td>
								<td>좋음</td>
								<td>약간</td>
								<td>없음</td>
								<td>허리밴딩</td>
							</tr>
							<tr>
								<td class="checkTitle">핏</td>
								<td>크게 나왔어요</td>
								<td>정사이즈</td>
								<td>작게 나왔어요</td>
								<td>-</td>
							</tr>
							</tbody>
						</table>
						<div>
							<p>
								첫 세탁시에는 드라이크리닝을 권장하며,
이후 세탁은 중성세제를 이용해 손 세탁을 권장합니다.<br>
데님 제품 및 컬러 원단 제품등은 세탁시 또는 밝은 컬러의 상품과 같이 코디하실 경우 물빠짐 현상이 일어날수 있으니 유의하시길 부탁드립니다.<br>
상품설명의 경우 주관적인 의견으로 반품 사유가 될 수 없으니 참고해주세요.<br>
							</p>
							<br>
							<br>
							<p>
							제조사 : (팀)화이팅<br>
제조국 : KOREA<br>
제조일자 : 2023.02~<br>
품질 보증기간 : 전자상거래 소비자 보호법에 규정되어 있는소비자 청약철회 가능범위를 준수합니다.<br>
AS책임자 : 홍유진(010-2276-1077)
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="rightWrap">
			
			</div>
		</div>
	</div>

</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.3.slim.min.js" integrity="sha256-ZwqZIVdD3iXNyGHbSYdsmWP//UBokj2FHAxKuSBKDSo=" crossorigin="anonymous"></script>
<script th:inline="javascript">
	var cleaning = ${check.cleaning};
	var lining = ${check.lining};
	var thickness =${check.thickness};
	var through = ${check.through};
	var flexibility = ${check.flexibility};
	var fit = ${check.fit};
	
	function readyCheck(){
		console.log(cleaning)
		$(".tblCheck").children().eq(0).children().eq(cleaning+1).addClass("checkPoint");
		$(".tblCheck").children().eq(1).children().eq(lining+1).addClass("checkPoint");
		$(".tblCheck").children().eq(2).children().eq(thickness+1).addClass("checkPoint");
		$(".tblCheck").children().eq(3).children().eq(through+1).addClass("checkPoint");
		$(".tblCheck").children().eq(4).children().eq(flexibility+1).addClass("checkPoint");
		$(".tblCheck").children().eq(5).children().eq(fit+1).addClass("checkPoint");
	}
	readyCheck();
</script>
</body>
</html>