<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/resources/css/baskinrobbins.css" rel="stylesheet" type="text/css">
</head>
<body>
<header id="header">
	<div class="inner_header">
		<div class="top_area">
			<div class="inner">
				<h1 class="logo">
					<a href="/">baskin robbins</a>
				</h1>
				<nav class="sns">
					<ul>
						<li>
							<a href="/">
								<img src="<c:url value="/resources/images/common/icon_facebook.png"/>" alt="FACEBOOK">
							</a>
						</li>
						<li>
							<a href="/">
								<img src="<c:url value="/resources/images/common/icon_twitter.png"/>" alt="TWITTER">
							</a>
						</li>
						<li>
							<a href="/">
								<img src="<c:url value="/resources/images/common/icon_blog.png"/>" alt="BLOG">
							</a>
						</li>
						<li>
							<a href="/">
								<img src="<c:url value="/resources/images/common/icon_instgram.png"/>" alt="INSTAGRAM">
							</a>
						</li>
						<li>
							<a href="/">
								<img src="<c:url value="/resources/images/common/icon_youtube.png"/>" alt="YOUTUBE">
							</a>
						</li>
					</ul>
				</nav>
				<nav class="etc">
					<ul>
						<li class="customer">
							<a href="/">고객센터</a>
						</li>
						<li>
							<a href="/">CONTACT US</a>
						</li>
						<li class="search">
							<a href="/">search</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	<div class="menu_area">

	<div class="inner">
		<nav class="member">
			<ul>
				<li class="login">
					<a href="/myapp/login"><span>login</span></a>
				</li>
				<li class="join">
					<a href="/myapp/signup"><span>join</span></a>
				</li>
			</ul>
		</nav>
		<nav id="gnb">
			<div class="gnb_wrap">
				<ul></ul>
			</div>
			<div class="gnb_bg">
				<div></div>
			</div>
		</nav>

		<div class="inner">
			<nav class="member">
				<ul>
					<li class="login">
						<a href="/user/login">
							<span>LOGIN</span>
						</a>
					</li>
					<li class="join">
						<a href="/user/signup">
							<span>join</span>
						</a>
					</li>
				</ul>
			</nav>
			<nav id="gnb">
				<div class="gnb_wrap">
					<ul>
						<li class="gnb_depth1" style="display: none">
							<div id="bts" style="display: block; width: 160px; float: left; padding: 0 40px; line-height: 46px;">
								<img src="" style="width: 100%; vertical-align: middle;">
							</div>
						</li>
						<li class="gnb_depth1 gnb_flavor">
							<div class="gnb_main">
								<a href="/">
									<span>FLAVOR OF THE MONTH</span>
								</a>
							</div>
							<div class="gnb_sub">
								<a href="/">
									<img src="" alt="" style="margin-left: 28px;">
								</a>
							</div>
						</li>
						<li class="gnb_depth1 gnb_menu">
							<div class="gnb_main">
								<a href="/">
									<span>MENU</span>
								</a>
							</div>
							<ul class="gnb_sub">
								<li class="gnb_depth2">
									<a href="/">
										<span>아이스크림</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>아이스크림케이크</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>음료</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>커피</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>디저트</span>
									</a>
								</li>
							</ul>
						</li>
						<li class="gnb_depth1 gnb_nutrition">
							<div class="gnb_main">
								<a href="/">
									<span>영양성분 및 알레르기</span>
								</a>
							</div>
							<ul class="gnb_sub">
								<li class="gnb_depth2">
									<a href="/">
										<span>아이스크림</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>음료</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>커피</span>
									</a>
								</li>
							</ul>
						</li>
						<li class="gnb_depth1 gnb_event">
							<div class="gnb_main">
								<a href="/">
									<span>EVENT</span>
								</a>
							</div>
							<ul class="gnb_sub">
								<li class="gnb_depth2">
									<a href="/">
										<span>진행중인이벤트</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>당첨자발표</span>
									</a>
								</li>
							</ul>
						</li>
						<li class="gnb_depth1 gnb_store">
							<div class="gnb_main">
								<a href="/">
									<span>STORE</span>
								</a>
							</div>
							<ul class="gnb_sub">
								<li class="gnb_depth2">
									<a href="/">
										<span>매장찾기</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>고객센터</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>단체주문</span>
									</a>
								</li>
							</ul>
						</li>
						<li class="gnb_depth1 gnb_about">
							<div class="gnb_main">
								<a href="/">
									<span>ABOUT</span>
								</a>
							</div>
							<ul class="gnb_sub">
								<li class="gnb_depth2">
									<a href="/">
										<span>공지사항</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>보도자료</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>채용자료</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>점포개설문의</span>
									</a>
								</li>
								<li class="gnb_depth2">
									<a href="/">
										<span>Contact Us</span>
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="gnb_bg">
					<div></div>
				</div>
			</nav>
		</div>

	</div>
	</div>
	<div id="modal_search" class="modal">
		<div class="modal_bg"></div>
		<div class="modal_container">
			<div class="modal_content">
				<div class="modal_header sr_only">
					<h2 class="title">제품 검색</h2>
				</div>
				<div class="modal_body">
					<div class="search_product">
						<form name="searchform" method="get" action="">
							<fieldset>
								<legend>제품 검색 폼</legend>
								<table class="table">
									<caption>제품 검색 폼</caption>
									<colgroup>
										<col width="90">
										<col width="486">
										<col width="90">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th>제품명</th>
											<td>
												<select name="ScTop" class="search_category_1 inline">
													<option value>전체</option>
													<option value="A">아이스크림</option>
													<option value="B">아이스크림케이크</option>
													<option value="C">음료</option>
													<option value="D">커피</option>
													<option value="E">디저트</option>
													<option value="F">block pack</option>
													<option value="G">ready pack</option>
												</select>
												<label class="sr_only" for="S-Title">제품명 입력</label>
												<input type="text" id="S-Title" name="STitle" value="" title="제품명 입력" class="inline">
											</td>
											<th>해시태그</th>
											<td>
												<div>
													<label class="sr_only" for="S-Hashtag">검색</label>
													<input type="text" id="S-Hashtag" name="ScHashtag" value="" class="my-placeholder inline" placeholder="">
												</div>
												<div class="hashtag">
													<dl>
														<dt>자주 찾는 해시태그</dt>
														<dd>
															<a href="/">#핑크스푼비긴즈</a>
															<a href="/">#딸기치즈케이크블라스트</a>
															<a href="/">#스트로베리치즈아이스롤케이크</a>
														</dd>
													</dl>
												</div>
											</td>
										</tr>
									<tr></tr>
									<tr>
										<th>알레르기 성분</th>
										<td colspan="3">
											<div class="allergie">
												<label>
													<input class="sr_only" type="checkbox" name="Allergy[]" value="계란">
													<span>계란</span>
												</label>
												<label>
													<input class="sr_only" type="checkbox" name="Allergy[]" value="대두">
													<span>대두</span>
												</label>
												<label>
													<input class="sr_only" type="checkbox" name="Allergy[]" value="돼지고기">
													<span>돼지고기</span>
												</label>
												<label>
													<input class="sr_only" type="checkbox" name="Allergy[]" value="땅콩">
													<span>땅콩</span>
												</label>
												<label>
													<input class="sr_only" type="checkbox" name="Allergy[]" value="밀">
													<span>밀</span>
												</label>
												<label>
													<input class="sr_only" type="checkbox" name="Allergy[]" value="복숭아">
													<span>복숭아</span>
												</label>
												<label>
													<input class="sr_only" type="checkbox" name="Allergy[]" value="우유">
													<span>우유</span>
												</label>
												<label>
													<input class="sr_only" type="checkbox" name="Allergy[]" value="없음">
													<span>없음</span>
												</label>
											</div>
										</td>
									</tr>
									</tbody>
								</table>
								<div class="submit">
									<button type="submit">검색</button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal_close">
			<a href="/">
				<img src="" alt="">
			</a>
		</div>
	</div>
</header>
</body>
</html>
