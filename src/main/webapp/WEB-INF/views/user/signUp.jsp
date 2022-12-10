<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/views/components/body.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
</head>
<style>
	.signup_form{
    padding-bottom: 130px;
   
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
fieldset{
	border:0;
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
.fieldset.row .btn-group {
    margin-top: 50px;
}
.member-content .btn-group {
    width: 400px;
    margin: 60px auto 0;
}
.btn-group.half .btn {
    float: left;
    width: calc(50% - 6px);
}
.btn.normal {
    color: #fff;
    border-color: #888888;
    background-color: #888888;
}
.btn.medium {
    padding: 0 5px;
    height: 48px;
    line-height: 46px;
    font-size: 16px;
    font-weight: 400;
}
.btn, .btn-arrow {
    display: inline-block;
}
.btn {
    position: relative;
    -webkit-transition: 0.3s;
    -o-transition: 0.3s;
    transition: 0.3s;
    display: inline-block;
    border-width: 1px;
    border-style: solid;
    border-color: transparent;
    border-radius: 8px;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    cursor: pointer;
    text-decoration: none;
    -webkit-appearance: none;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    outline: none;
    background-color: transparent;
    -webkit-tap-highlight-color: transparent;
}
.btn-group.half .btn + .btn {
    margin-left: 12px;
}

.btn.accent {
    color: #fff;
    border-color: #FE4F27;
    background-color: #FE4F27;
}
input.btn, button.btn {
    overflow: visible;
}
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}

</style>
<body>

<%@ include file="/WEB-INF/views/components/header.jsp" %>
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
									<input id="userId"type="text" placeholder="영문 소문자, 숫자 조합">
									<button type="button" id="checkId">중복확인</button>
								</div>
							</div>
						</div>
					</div>
					<div class="field">
						<div class="label">
							<label>이름</label>
							<div class="insert">
								<div class="input-cover">
									<input id="userName"type="text" placeholder="이름을 입력하세요." maxlength="4">
								</div>
							</div>
						</div>
					</div>
					<div class="field">
						<div class="label">
							<label>생일</label>
							<div class="insert">
								<div class="input-cover">
									<input id="userBirth" type="text" onKeydown="checkBirth(event)"placeholder="예)1997-10-27">
								</div>
							</div>
						</div>
					</div>
					<div class="field">
						<div class="label">
							<label>비밀번호</label>
							<div class="insert">
								<div class="input-cover">
									<input id="userPw"type="password" onKeyup="checkPw1()"placeholder="영문 대문자, 소문자, 숫자, 특수문자 조합, 8~10자리까지"maxlength="10">
								</div>
							</div>
						</div>
					</div>
					<div class="field">
						<div class="label">
							<label>비밀번호 확인</label>
							<div class="insert">
								<div class="input-cover">
									<input id="confirmPw" onKeyup="confirmPw()"type="password" placeholder="비밀번호 확인" maxlength="10">
								</div>
							</div>
						</div>
					</div>
					<div class="field">
						<div class="label">
							<label>이메일</label>
							<div class="insert">
								<div class="input-cover">
									<input id="userEmail"type="text" onKeyup="checkEmail()"placeholder="예)abc@def.com">
								</div>
							</div>
						</div>
					</div>
					<div class="field">
						<div class="label">
							<label>전화번호</label>
							<div class="insert">
								<div class="input-cover">
									<input id="userPhone"type="text" onKeyup="checkPhone()"placeholder="예)010-1234-5678" maxlength="13">
								</div>
							</div>
						</div>
					</div>
					<div class="btn-group half">
						<a class="btn medium normal" onClick="reset()">초기화</a>
						<button type="button"class="btn medium accent" onClick="submitSignup()">확인</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/components/footer.jsp" %>
<script>
	var checkId = false;
	var boolBirth =false;
	
	var user = {userId:"",userName:"",userBirth:"",userPw:"",userEmail:"",userPhone:""};
	var submitSignup = ()=>{
		user.userId=$("#userId").val();
		user.userName=$("#userName").val();
		user.userBirth=$("#userBirth").val();
		user.userPw=$("#userPw").val();
		user.userEmail=$("#userEmail").val();
		user.userPhone=$("#userPhone").val();
		
		if(checkId&&confirmPw()&&checkEmail()&&boolBirth&&checkPhone()){
		$.ajax({
			url:"/myapp/signup",
			method:"post",
			data:user,
			success:function(response){
				alert("성공");
				console.log(response);
				
			},
			error:function(errorMessage){
				console.log(errorMessage);
			}
		})
	}else if(!checkId){
		$("#userId").focus();
		alert("id Error")
	}else if(!confirmPw()){
		$("#confirmPw").focus();
		alert("pw Error");
	}else if(!boolBirth){
		$("#userBirth").focus();
		alert("birth error");
	}else if(!checkEmail()){
		$("#userEmail").focus();
		alert("email error");
	}else if(!checkPhone()){
		$("#userPhone").focus();
		alert("phone error");
	}};
	var confirmPw = ()=>{
		let pw1 = $("#userPw").val();
		let pw2 = $("#confirmPw").val();
		if(pw1.length==0||pw2.length==0){
			return false;
		}
		if(pw1===pw2){
			$("#confirmPw").css({"color":"blue"});
			return true;
		}else{
			$("#confirmPw").css({"color":"red"});
			return false;
		}
	};
	var checkPw1 = ()=>{
		let pw1 = $("#userPw").val();
		let alpha = /[a-z]/gi;
		let num = /[0-9]/g;
		let tex = /[!@~#$%^&*()_+]/g;
		if(alpha.test(pw1)&&num.test(pw1)&&tex.test(pw1)){
			$("#userPw").css({"color":"blue"});
		}else{
			$("#userPw").css({"color":"red"})
		}
		
	};
	var reset = ()=>{
		user.userId=$("#userId").val("");
		user.userName=$("#userName").val("");
		user.userBirth=$("#userBirth").val("");
		user.userPw=$("#userPw").val("");
		user.userEmail=$("#userEmail").val("");
		user.userPhone=$("#userPhone").val("");
		
	};
	$("#checkId").click(()=>{
		let userId = {userId:$("#userId").val()};
		console.log(user);
		$.ajax({
			url:"/myapp/checkId",
			method:"post",
			data:userId,
			success:function(response){
				console.log("response:"+response);
				if(response==$("#userId").val()){
					alert("fail");
					checkId = false;
				}else{
					alert("success");
					checkId = true;
				}
			}
		});
	});
	var checkBirth = (event)=>{
		console.log("fff")
		let birth = $("#userBirth").val();
		let reg = /[^0-9]/g;
		if(event.keyCode==8){
			boolBirth = false;
		}
		else if(birth.length<5){
			birth = birth.replace(reg,"");
			$("#userBirth").val(birth);
			if(birth.length==4){
				$("#userBirth").val(birth+"-");
			}
			boolBirth= false;
		}else if(birth.length<8){
			let second = birth.slice(5,birth.length);
			let first = birth.slice(0,5);
			second = second.replace(reg,"");
			$("#userBirth").val(first+second);
	
			if(second.length ==2){
				$("#userBirth").val(first+second+"-");
			}
			boolBirth= false;
		}else{
			let last = birth.slice(8,10);
			last = last.replace(reg,"");
			let first = birth.slice(0,8);
			$("#userBirth").val(first+last);
			if(last.length>=2){
				event.preventDefault();
				$("#userBirth").val(first+last);
				boolBirth= true;
			}else{
				boolBirth= false;
			}
		}
	};
	var checkEmail = ()=>{
		let email = $("#userEmail").val();
		let reg = /^[a-zA-Z0-9~!@#$%^&*()_+]+@[a-z]+\.[a-z]+/g;
		if(!reg.test(email)){
			$("#userEmail").css({"color":"red"});
			return false;
		}else{
			$("#userEmail").css({"color":"blue"});
			return true;
		}
	};
	var checkPhone= ()=>{
		let phone = $("#userPhone").val();
		let reg = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}/g;
		if(reg.test(phone)){
			$("#userPhone").css({"color":"blue"});
			return true;
		}else{
			$("#userPhone").css({"color":"red"});
			return false;
		}
	};
</script>
</body>
</html>