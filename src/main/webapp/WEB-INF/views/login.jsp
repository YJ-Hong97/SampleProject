<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/views/components/common.jsp" %>
<%@ include file="/WEB-INF/views/components/header.jsp" %>
<%@ include file="/WEB-INF/views/components/footer.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<form>
	<label>id</label><input type="text" placeholder="id" id="userId">
	<label>password</label><input type="password" placeholder="password" id="userPw">
	<button type="button"id="btnSubmit">submit</button>
</form>
<script>
	var user = {userId:"",userPw:"",userName:"",userBirth:"",userEmail:"",userPhone:""};
	$("#btnSubmit").click(()=>{
		user.userId = $("#userId").val();
		user.userPw = $("#userPw").val();
		$.ajax({
			url:"/myapp/login",
			method:"post",
			data:user,
			success:function(response){
				console.log(response);
			}
		});
	});
</script>
</body>
</html>