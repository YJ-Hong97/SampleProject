<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/resources/css/baskinrobbins.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/js/baskinrobbins.js" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/js/swipe.js" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
    <article id="content" class="main_wrap">
        <div class="main_banner">
            <div class="flavor_month">
                <div class="top">
                    <a href="#" style="background:#eb849f url(/resources/images/main/1720602996.jpg) 50% 0 no-repeat;">flavor of the month</a>
                </div>
                <p></p>
                <div class="flavor_banner">
                    <a href="#" style="background:#f09eb4 url(/resources/images/main/1720602959.jpg) 50% 0 no-repeat;" class="on">flavor of the month banner</a>
                </div>
            </div>
            <div class="banner_slide" data-api="slide">
                <div class="swipe" style="visibility: visible;">
                    <ul class="swipe_wrap" style="width: 7200px;">
                        <li class="banner_1" data-end="2022-12-01" data-index="0" style="width: 1519.2px; left: 0px; transition-duration: 0ms; transform: translate(-1519.2px, 0px) translateZ(0px);">
                            <a href="#" style="background-color: #f09eb4; background-image: url(/resources/images/main/1720605882.jpg);"></a>
                        </li>
                        <li class="banner_2" data-end="2022-12-01" data-index="1" style="width: 1519.2px; left: -1519.2px; transition-duration: 0ms; transform: translate(-1519.2px, 0px) translateZ(0px);">
                            <a href="#" style="background-color:#74392b; background-image:url(/resources/images/main/1720605882.jpg);"></a>
                        </li>
                        <li class="banner_3" data-end="2022-12-01" data-index="2" style="width: 1519.2px; left: -3038.4px; transition-duration: 0ms; transform: translate(-1519.2px, 0px) translateZ(0px);">
                            <a href="#" style="background-color:#5d9eda; background-image:url(/resources/images/main/1720605882.jpg);"></a>
                        </li>
                        <li class="banner_4" data-end="2022-12-01" data-index="3" style="width: 1519.2px; left: -4557.6px; transition-duration: 400ms; transform: translate(-1519.2px, 0px) translateZ(0px);">
                            <a href="#" style="background-color:#613AAF; background-image:url(/resources/images/main/1676003546.jpg);"></a>
                        </li>
                        <li class="banner_5" data-end="2022-12-01" data-index="4" style="width: 1519.2px; left: -6076.8px; transition-duration: 400ms; transform: translate(-1519.2px, 0px) translateZ(0px);">
                            <a href="#" style="background-color:#E5E5E5; background-image:url(/resources/images/main/1670146295.png);"></a>
                        </li>
                        <li class="banner_6" data-end="2022-12-01" data-index="5" style="width: 1519.2px; left: -7596px; transition-duration: 400ms; transform: translate(0px, 0px) translateZ(0px);">
                            <a href="#" style="background-color: #f09eb4; background-image: url(/resources/images/main/1720605882.jpg);"></a>
                        </li>
                        <li class="banner_7" data-end="2022-12-01" data-index="6" style="width: 1519.2px; left: -9115.2px; transition-duration: 0ms; transform: translate(1519.2px, 0px) translateZ(0px);">
                            <a href="#" style="background-color:#F6F8F8; background-image:url(/resources/images/main/1667440402.png);"></a>
                        </li>
                        <li class="banner_8" data-end="2022-12-01" data-index="7" style="width: 1519.2px; left: -10634.4px; transition-duration: 0ms; transform: translate(1519.2px, 0px) translateZ(0px);">
                            <a href="#" style="background-color:#ffe103; background-image:url(/resources/images/main/1667383155.png);"></a>
                        </li>
                        <li class="banner_9" data-end="2022-12-01" data-index="8" style="width: 1519.2px; left: -12153.6px; transition-duration: 0ms; transform: translate(1519.2px, 0px) translateZ(0px);">
                            <a href="#" style="background-color:#fb637e; background-image:url(/resources/images/main/1643869369.png);"></a>
                        </li>
                    </ul>
                </div>
                <div class="dslide">
                    <a href="#" >
                        "1"
                        <span></span>
                    </a>
                    <a href="#" >
                        "2"
                        <span></span>
                    </a>
                    <a href="#" >
                        "3"
                        <span></span>
                    </a>
                    <a href="#" >
                        "4"
                        <span></span>
                    </a>
                    <a href="#" >
                        "5"
                        <span></span>
                    </a>
                    <a href="#" >
                        "6"
                        <span></span>
                    </a>
                    <a href="#" >
                        "7"
                        <span></span>
                    </a>
                    <a href="#" >
                        "8"
                        <span></span>
                    </a>
                    <a href="#" >
                        "9"
                        <span></span>
                    </a>
                </div>
                <div class="btns">
                    <a href="#" class="prev">
                        <img src="<c:url value="/resources/images/main/btn_banner_prev.png"/>" alt="prev">
                    </a>
                    <a href="#" class="next">
                        <img src="<c:url value="/resources/images/main/btn_banner_next.png"/>" alt="next">
                    </a>
                </div>
            </div>
        </div>
        <section class="br_event">
            <h3 class="title">
                <img src="<c:url value="/resources/images/main/h_event.png"/>" alt="BR EVENT">
            </h3>
            <div class="event_list" data-api="slide">
                <div class="swipe" style="visibility: visible;">
                    <div class="list_product" data-index="0" style="width: 1200px; left: 0px; transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
                        <ul>
                            <li>
                                <a href="#">
                                    <figure>
                                        <img src="<c:url value="/resources/images/event/image/banner_delivery.png"/>" alt="???????????? ????????????">
                                    </figure>
                                    <span class="type">
                                        <img src="<c:url value="/resources/images/event/stit_store.gif"/>" alt="STORE EVENT">
                                    </span>
                                    <span class="title">???????????? ??????????????? ???????????? ???????????????!</span>
                                    <span class="period">????????????</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <figure>
                                        <img src="<c:url value="/resources/images/event/image/banner_delivery_bm.png"/>" alt="????????? ???????????? ????????? ????????????">
                                    </figure>
                                    <span class="type">
                                        <img src="<c:url value="/resources/images/event/stit_store.gif"/>" alt="STORE EVENT">
                                    </span>
                                    <span class="title">????????? ???????????? ????????? ???????????????!</span>
                                    <span class="period">????????????</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <figure>
                                        <img src="<c:url value="/resources/images/event/image/banner_delivery_ygy.png"/>" alt="??????????????? ????????? ????????????">
                                    </figure>
                                    <span class="type">
                                        <img src="<c:url value="/resources/images/event/stit_store.gif"/>" alt="STORE EVENT">
                                    </span>
                                    <span class="title">??????????????? ????????? ???????????????!</span>
                                    <span class="period">????????????</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <figure>
                                        <img src="<c:url value="/resources/images/event/image/banner_delivery_kakao.png"/>" alt="???????????? ????????????">
                                    </figure>
                                    <span class="type">
                                        <img src="<c:url value="/resources/images/event/stit_store.gif"/>" alt="STORE EVENT">
                                    </span>
                                    <span class="title">???????????? ?????????????????? ???????????? ???????????????!</span>
                                    <span class="period">????????????</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="list_product" data-index="1" style="width: 1200px; left: -1200px; transition-duration: 0ms; transform: translate(1200px, 0px) translateZ(0px);">
                        <ul>
                            <li>
                                <a href="#">
                                    <figure>
                                        <img src="<c:url value="/resources/images/event/image/1670146074.png"/>">
                                    </figure>
                                    <span class="type">
                                        <img src="<c:url value="/resources/images/event/stit_online.gif"/>" alt="ONLINE EVENT" >
                                    </span>
                                    <span class="title">?????? ????????? ?????? 50% ?????? ??????</span>
                                    <span class="period">????????????</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <figure>
                                        <img src="<c:url value="/resources/images/event/image/1667538956.png"/>">
                                    </figure>
                                    <span class="type">
                                        <img src="<c:url value="/resources/images/event/stit_online.gif"/>" alt="ONLINE EVENT">
                                    </span>
                                    <span class="title">2022 ?????????????????? ????????? ????????????</span>
                                    <span class="period">????????????</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <figure>
                                        <img src="<c:url value="/resources/images/event/image/1659436130.png"/>">
                                    </figure>
                                    <span class="type">
                                        <img src="<c:url value="/resources/images/event/stit_online.gif"/>" alt="ONLINE EVENT">
                                    </span>
                                    <span class="title">????????? ??????????????? ????????? ??????????????? ??????, ???????????? ???????????? ??????!</span>
                                    <span class="period">????????????</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <figure>
                                        <img src="<c:url value="/resources/images/event/image/1643869329.png"/>">
                                    </figure>
                                    <span class="type">
                                        <img src="<c:url value="/resources/images/event/stit_online.gif"/>" alt="ONLINE EVENT">
                                    </span>
                                    <span class="title">KT ????????? ??????????????? ????????? ????????? 30% ??????!</span>
                                    <span class="period">????????????</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="list_product" data-index="2" style="width: 1200px; left: -2400px; transition-duration: 0ms; transform: translate(1200px, 0px) translateZ(0px);">
                        <ul>
                            <li>
                                <a href="#">
                                    <figure>
                                        <img src="<c:url value="/resources/images/event/image/1667382917.png"/>">
                                    </figure>
                                    <span class="type">
                                        <img src="<c:url value="/resources/images/event/stit_store.gif"/>" alt="STORE EVENT" >
                                    </span>
                                    <span class="title">???????????? M????????? 50% ??????</span>
                                    <span class="period">????????????</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <figure>
                                        <img src="<c:url value="/resources/images/event/image/1570702843.png"/>">
                                    </figure>
                                    <span class="type">
                                        <img src="<c:url value="/resources/images/event/stit_online.gif"/>" alt="ONLINE EVENT">
                                    </span>
                                    <span class="title">2018 ????????? ?????? ?????? ?????? ??????! ?????????????????????</span>
                                    <span class="period">????????????</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <figure>
                                        <img src="<c:url value="/resources/images/event/image/1578277305.png"/>">
                                    </figure>
                                    <span class="type">
                                        <img src="<c:url value="/resources/images/event/stit_store.gif"/>" alt="STORE EVENT">
                                    </span>
                                    <span class="title">1?????? ??? ?????? ????????? ??????</span>
                                    <span class="period">????????????</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <figure>
                                        <img src="<c:url value="/resources/images/event/images/banner_praise_2022-3.jpg"/>" alt="????????????">
                                    </figure>
                                    <span class="type">
                                        <img src="<c:url value="/resources/images/event/stit_store.gif"/>" alt="STORE EVENT">
                                    </span>
                                    <span class="title">2022 3?????? ?????? BEST ???????????? ??????</span>
                                    <span class="period"></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="dslide">
                <a href="#" class="active">
                    "1"
                    <span></span>
                </a>
                <a href="#" class="active">
                    "2"
                    <span></span>
                </a>
                <a href="#" class="active">
                    "3"
                    <span></span>
                </a>
            </div>
        </section>
        <section class="br_menu">
            <h3 class="title">
                <img src="<c:url value="/resources/images/main/h_menu.png"/>" alt="BR MENU">
            </h3>
            <div class="menu_list">
                <div class="icecream">
                    <a href="#">
                        <div class="sr_only">
                            <h4>ICECREAM</h4>
                            <p>???????????? ?????????????????? ??????, ??????????????????</p>
                        </div>
                    </a>
                </div>
                <div class="icecreamcake">
                    <a href="#">
                        <div class="sr_only">
                            <h4>ICECREAM CAKE</h4>
                            <p>????????? ????????? ???????????? ?????????????????? ????????? ??????????????? ?????? ????????????!</p>
                        </div>
                    </a>
                </div>
                <div class="baverage">
                    <a href="#">
                        <div class="sr_only">
                            <h4>BAVERAGE</h4>
                            <p>????????????????????? ????????? ???????????????????????? ??????!</p>
                        </div>
                    </a>
                </div>
                <div class="coffee">
                    <a href="#">
                        <div class="sr_only">
                            <h4>COFFEE</h4>
                            <p>???????????????????????? ???????????? ????????? ????????? ??????</p>
                        </div>
                    </a>
                </div>
                <div class="dessert">
                    <a href="#">
                        <div class="sr_only">
                            <h4>DESSERT</h4>
                            <p>?????????????????? ?????? ????????????! ???????????? ????????? ??????!</p>
                        </div>
                    </a>
                </div>
                <div class="gift">
                    <a href="#">
                        <div class="sr_only">
                            <h4>GIFT</h4>
                        </div>
                    </a>
                </div>
            </div>
        </section>
        <div class="store_delivery">
            <section class="store">
                <h3 class="title">
                    <img src="<c:url value="/resources/images/main/h_store.png"/>" alt="BR STORE">
                </h3>
                <div class="box">
                    <a href="#">
                        <img src="<c:url value="/resources/images/main/img_store.jpg"/>" alt="??? ?????? ?????? ????????? ?????????????????? ????????? ???????????????! ????????? ???????????? ?????????! ???????????? ??????????????????! ????????????">
                    </a>
                </div>
            </section>
            <section class="order">
                <h3 class="title">
                    <img src="<c:url value="/resources/images/main/h_happyorder_delivery.png"/>" alt="HAPPY ORDER & DELIVERY">
                </h3>
                <div class="box">
                    <a href="#">
                        <img src="<c:url value="/resources/images/main/img_happyorder_delivery.png"/>" alt="?????????????????? ????????? ???????????? & ??????????????? - ???????????? ?????? ????????? 1234-5678 ???????????? ?????? & ???????????? ????????????!">
                    </a>
                </div>
            </section>
        </div>
        <section class="snsbox">
            <h3 class="title">
                <img src="<c:url value="/resources/images/main/h_sns.png"/>" alt="SNS">
            </h3>
            <nav class="sns">
                <ul>
                    <li>
                        <a href="#">
                            <img src="<c:url value="/resources/images/main/sns_facebook.png"/>" alt="FACEBOOK">
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="<c:url value="/resources/images/main/sns_twitter.png"/>" alt="TWITTER">
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="<c:url value="/resources/images/main/sns_blog.png"/>" alt="BLOG">
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="<c:url value="/resources/images/main/sns_instagram.png"/>" alt="INSTAGRAM">
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="<c:url value="/resources/images/main/sns_youtube.png"/>" alt="YOUTUBE">
                        </a>
                    </li>
                </ul>
            </nav>
            <div class="insta_default"></div>
        </section>
    </article>
</html>