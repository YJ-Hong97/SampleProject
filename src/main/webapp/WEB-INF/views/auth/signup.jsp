<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="/resources/css/common.css" rel="stylesheet" type="text/css">
<title>회원가입</title>
</head>
<style>
	html,body{
		width:100%;
		height:100%;
	}
	
	.signupWrap{
		width:100%;
	}
	.box{
		width:50%;
		text-align:left;
		margin:15px auto;
	}
	h1{
		font-size: 24px;
	}
	.signupWrap p{
	font-size: 13px;
	}
	.signupWrap input{
		background: rgb(255, 255, 255);
    border: 2px solid rgb(232, 233, 235);
    border-radius: 8px;
    height: 48px;
    width:100%;
	}
	#submitButton{
	border-radius: 24px;
		border:0;
    padding: 14px 24px;
    width:100%;
    background:#D9D9D9;
	}
	input[type="submit"]{
		display:none;
	}
</style>
<body>
<header><%@ include file="/WEB-INF/views/component/homeHeader.jsp" %></header>
<div class="signupWrap">
	<div class="box">
		<h1>회원가입</h1>
	</div>
	<form id="signupFrm" action="/auth/signup" method="post">
		<div class="box">
			<p>이메일</p>
			<input type="text" placeholder="이메일" name="userEmail"><button type="button" onclick="fn_checkEmail()">중복확인</button>
		</div>
		<div class="box">
			<p>비밀번호</p>
			<input type="password" placeholder="비밀번호" name="userPw">
		</div>
		<div class="box">
			<p>비밀번호 확인</p>
			<input type="password" placeholder="비밀번호 확인" onkeyup="fn_checkPw(event)">
		</div>
		<div class="box">
			<p>이름</p>
			<input type="text" placeholder="이름" name="userName">
		</div>
		<div class="box">
			<p>생일</p>
			<input type="date" name="userBirth">
		</div>
		<div class="box">
			<input type="button" id="submitButton" value="완료">
			<input type="submit">
		</div>
	</form>
</div>
<footer><%@ include file="/WEB-INF/views/component/homeFooter.jsp" %></footer>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	var checkPw = false;
	var chEmail = false;
	function fn_checkEmail(){
		let email  = $("input[name=userEmail]").val();
		$.ajax({
			url:"/auth/checkEmail?userEmail="+email,
			method:"get",
			success:function(response){
				console.log(response)
				if(response=="success"){
					chEmail=true;
					alert("사용가능한 이메일입니다.");
				}else{
					chEmail=false;
					alert("이미 존재하는 이메일입니다.");
				}
			}
			
		})
		
	}
	function fn_checkPw(event){
		let pw2 = event.target.value;
		let pw1 = $("input[name=userPw]").val();
		if(pw2==pw1){
			checkPw=true;
			event.target.style.color="blue";
		}else{
			checkPw=false;
			event.target.style.color="red";
		}
	}
	function fn_valid(){
		
		if($("input[name=userEmail]").val()==""||chEmail==false){
			alert("이메일을 입력해주세요.");
			$("input[name=userEmail]").focus();
			return false;
		}else if($("input[name=userName]").val()==""){
			alert("이름을 입력해주세요.");
			$("input[name=userName]").focus();
			return false;
		}else if($("input[name=userBirth]").val()==""){
			alert("생일을 입력해주세요.");
			$("input[name=userBirth]").focus();
			return false;
		}else{
			return true;
		}
	}
	$("#submitButton").click(function(event){
		
		event.preventDefault();
		if(!checkPw){
			alert("비밀번호가 일치하지 않습니다.")
			return;
		}
		if(!fn_valid()){
			return;
		}
		$("#signupFrm").submit();
	})
</script>
</body>
</html>