<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/views/components/common.jsp" %>
<%@ include file="/WEB-INF/views/components/header.jsp" %>
<%@ include file="/WEB-INF/views/components/footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
</head>
<style>
	.signup_form{
    padding-bottom: 130px
	}
	.page-navigation {
    min-width: 1020px;
    margin-bottom: 25px;
    padding: 15px 0;
}
.page-navigation .inner {
    width: 1020px;
    margin: 0 auto;
}
.page-navigation .path {
    display: block;
    float: left;
    position: relative;
}
.page-navigation .path a {
    display: block;
    font-size: 12px;
    color: #666;
}
.page-navigation .inner:before, .page-navigation .inner:after {
    content: "";
    display: table;
}
.page-navigation .path + .path:before {
    display: block;
    content: "";
    width: 12px;
    height: 12px;
    position: absolute;
    top: 50%;
    left: -15px;
    margin-top: -6px;
    background: url(https://front.happypointcard.com/upfiles/appMain/resources/ha-web/images/pc/common/arrow/icon-arrow-12x12-gy.png) no-repeat 0 0;
}
.section-inner {
    width: 1020px;
    margin: 0 auto;
}
.subpage-title-area {
    text-align: center;
}
.small-layout-inner {
    width: 400px;
    margin: 0 auto;
}
.subpage-title-area .title {
    display: block;
    line-height: 46px;
    font-weight: 500;
    font-size: 36px;
    letter-spacing: -1.44px;
}
form {
    margin: 0;
    padding: 0;
    
}
.fieldset .field:before, .fieldset .field:after {
    content: "";
    display: table;
}
.fieldset .field:after {
    clear: both;
}
.fieldset .field:before, .fieldset .field:after {
    content: "";
    display: table;
}
.fieldset.row .field > .label {
    margin-bottom: 6px;

}
.fieldset .field > .label {
    font-weight: 600;
    font-size: 16px;
}
.fieldset .field > .insert {
    position: relative;
}
.input-cover {
    position: relative;
}
.input-cover input {
    padding-right: 30px;
}
input{
    display: block;
    width: 100%;
    -webkit-appearance: none;
    padding: 0;
    height: 44px;
    font-size: 16px;
    border: 0;
    border-bottom: 1px solid #888888;
    background-color: #fff;
    -webkit-transition: 0.4s border;
    -o-transition: 0.4s border;
    transition: 0.4s border;
    color: #222222;
    border-radius: 0;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
</style>
<body>
<div class="signup_form">
	<div class="page-navigation">
		<div class="inner">
			<span class="path"><a href="/">Home</a></span>
			<sapn class="path"><a>회원가입</a></sapn>
		</div>
	</div>
	<div class="section-inner">
		<div class="subpage-title-area">
			<h2 class="title">회원가입</h2>
		</div>
		<div class="small-layout-inner">
			<form id="signUpFrm" method="post" action="/myapp/signup">
				<fieldset class="fieldset row">
					<div class="field">
						<div class="label">
							<label>아이디</label>
							<div class="insert">
								<div class="input-cover">
									<input type="text" placeholder="아이디">
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
</body>
</html>