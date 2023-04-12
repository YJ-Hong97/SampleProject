<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	.colorWrap{
		width:100%;
		height:100%;
		position:absolute;
		left:0;
		right:0;
		z-index:7;
		background:#D9D9D9;
		background-color: rgba( 255, 255, 255, 0.5 );
		display:none;
	}
	.alertWrap{
		width:300px;
		height:100px;
		background:white;
		display:flex;
		flex-direction:row;
	}
	.nameWrap{
		width:40%;
		display:flex;
		flex-direction:column;
	}
	.codeWrap{
		width:40%;
		display:flex;
		flex-direction:column;
	}
	.nameWrap label{
		width:100%;
		
	}
	.codeWrap label{
		width:100%;
	}
</style>
<body>
<div class="colorWrap">
	<div class="alertWrap">
		<div class="nameWrap">
			<label>색상이름</label>
			<label class="colorName"></label>
		</div>
		<div class="codeWrap">
			<label>색상코드</label>
			<label><input type="text" class="colorCode"></label>
		</div>
		<div class='submitWrap'>
			<button onclick="fn_colorSubmit()">저장</button>
		</div>
	</div>
</div>
</body>
</html>