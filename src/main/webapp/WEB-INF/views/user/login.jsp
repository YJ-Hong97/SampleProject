
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link href="${pageContext.request.contextPath}/resources/css/baskinrobbins.css" rel="stylesheet" type="text/css">
</head>
<%@ include file="/WEB-INF/views/components/header.jsp" %>
<div id="content" class="sso_login_wrap">
    <header class="content_header">
        <h3 class="title_main">
            <span>
                <img src="<c:url value="/resources/images/sso/h_login.png"/>" alt="LOGIN">
            </span>
        </h3>
        <p class="welcome">배스킨라빈스 홈페이지에 오신 것을 환영합니다.</p>
    </header>
    <div class="inner_content">
        <div class="login_box">
            <div class="cont_1">
                <section class="form">
                    <h4 class="title">
                        " 배스킨라빈스 로그인 "
                        <span>해피포인트 아이디로 간편하게 로그인 하세요.</span>
                    </h4>
                    <%-- 로그인 form --%>
                    <div class="login_wrap">
                        <form method="post" name="" id="" action="">
                            <fieldset>
                                <legend>로그인 폼</legend>
                                <input type="hidden" name="">
                                <input type="hidden" name="">
                                <input type="text" name="id" id="loginid" placeholder="아이디를 입력하세요" title="아이디 입력">
                                <input type="password" name="pw" id="loginpw" placeholder="비밀번호를 입력하세요" title="비밀번호 입력">
                                <button type="submit">로그인</button>
                            </fieldset>
                        </form>
                        <nav>
                            <ul>
                                <li class="li_1">
                                    <a href="/">아이디 찾기</a>
                                </li>
                                <li class="li_2">
                                    <a href="/">비밀번호 재발급</a>
                                </li>
                                <li class="li_3">
                                    <a href="/">해피포인트가입</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </section>
            </div>
            <div class="cont_2">
                <section class="service">
                    <h3 class="title">SPC 통합회원 서비스</h3>
                    <p class="text">
                        "하나의 ID/PassWord로 SPC가 운영하는 블라블라 사이트, "
                        <br>
                        "아~! 인생... 뭐... 디자인 맡으신 언니가 이 부분을 2주 뒤에 보시겠지요..."
                        <br>
                        "사진만 고치시면 되거등여... 화이링... 미대생 화이링..."
                        <br>
                        "이상... 다시 코딩하러 가보겠읍니다... 읽어주셔서 감쟈합니다...(찡긋)★"
                    </p>
                </section>
                <section class="center">
                    <h3 class="title">고객센터</h3>
                    <dl>
                        <dt>운영시간</dt>
                        <dd>월~금 09~17:30 토/일 잠수...</dd>
                        <dt>Tel.</dt>
                        <dd> 010-1234-5678(수신자부담)</dd>
                    </dl>
                </section>
            </div>
        </div>
        <section class="benefit">
            <h3 class="title">
                해피포인트 회원이 아니시라면 지금 해피포인트에 가입하시고
                <br>
                저는 못받았지만, 다양한 혜택을 경험하세요.
            </h3>
            <ul>
                <li class="li_1">
                    <dl>혜택 하나</dl>
                    <dd>
                        "배스킨라빈스 온라인 이벤트"
                        <br>
                        "행사에 참여할 수 있습니다."
                    </dd>
                </li>
                <li class="li_2">
                    <dl>혜택 둘</dl>
                    <dd>
                        "월별 신제품을 보다"
                        <br>
                        "먼저 만날 수 있습니다."
                    </dd>
                </li>
                <li class="li_3">
                    <dl>혜택 셋</dl>
                    <dd>
                        "배스킨라빈스 이벤트 정보"
                        <br>
                        "메일링을 받아 볼 수 있습니다."
                    </dd>
                </li>
            </ul>
        </section>
    </div>
</div>
<%@ include file="/WEB-INF/views/components/footer.jsp" %>
</html>
