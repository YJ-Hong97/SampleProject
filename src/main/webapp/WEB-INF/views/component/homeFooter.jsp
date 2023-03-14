<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	.firstWrap{
		width:100%;
		height:150px;
		background: #D9D9D9;
		padding:32px;
		display:flex;
	}
	.secondWrap{
		width:100%;
		height:30px;
		background: #D9D9D9;
		margin-top:1px;
		padding:32px;
		display:flex;
	}
	.firstWrap div{
		width: 300px;
		height: 216px;
		margin-left:32px;
		display:inline-block;
		
	}
	.firstWrap p{
		margin:10px;
		font-style: normal;
		font-weight: 400;
		font-size: 13px;
		line-height: 13px;
	}
	.firstWrap .title{
		font-style: normal;
		font-weight: 700;
		font-size: 20px;
		line-height: 24px;
	}
	.secondWrap ul{
		margin-left:10px;
	}
	.secondWrap li{
		float:left;
		font-style: normal;
		font-weight: 700;
		font-size: 20px;
		line-height: 20px;
	}
</style>
<body>
<div class="footerWrap">
	<div class="firstWrap">
		<div class="companyWrap">
			<p class="title">Company. (팀)화이팅</p>
			<p>developer. 김혜인</p>
			<p>designer. 문유진</p>
			<p>developer. 홍유진</p>
		</div>
		<div class="connectWrap">
			<p class="title">Connect</p>
			<p>developer. 김혜인</p>
			<p>designer. 문유진</p>
			<p>홍유진. 010-2276-1077</p>
		</div>
		<div class="gitWrap">
			<p class="title">Git</p>
			<p class="title">https://github.com/YJ-Hong97/SampleProject.git</p>
		</div>
	</div>
	<div class="secondWrap">
		<ul>
			<li><a>홈으로</a></li>
			<li><a>이용안내</a></li>
			<li><a>팀소개</a></li>
		</ul>
	</div>
</div>
</body>
</html>