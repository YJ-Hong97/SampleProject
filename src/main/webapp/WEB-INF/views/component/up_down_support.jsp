<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
 	.top{
	 	display: inline-flex;
	    align-items: center;
	    justify-content: center;
 		border-radius:50%;
 		border:solid 2px #eaeaea;
 		width:calc(100vw * (40 / 1920));
 		height: calc(100vw * (40 / 1920));
 	}
 	.bottom{
	 	display: inline-flex;
	    align-items: center;
	    justify-content: center;
 		border-radius:50%;
 		border:solid 2px #eaeaea;
 		width:calc(100vw * (40 / 1920));
 		height: calc(100vw * (40 / 1920));
 	}
 	.icon.ic img{
    width: calc(100vw * (24 / 1920));
    height: calc(100vw * (24 / 1920));
	}
	.ic{
	    transform-origin: center;
	}
</style>
<body>
<a class = "top icon ic" style="display:scroll;position:fixed;bottom:130px;right:20px;" rel="nofollow"
href="#" title="Back to Top" style="font-size:2.0em">
<img src="../resources/images/upload.png">
</a>
<a class = "bottom icon ic" style="display:scroll;position:fixed;bottom:80px;right:20px;" rel="nofollow"
href="#scrollbottom" title="Go to Bottom" style="font-size:2.0em">
<img src="../resources/images/down.png">
</a>
<a class = "bottom icon ic" style="display:scroll;position:fixed;bottom:30px;right:20px;" rel="nofollow"
href="#" title="Go to support" style="font-size:2.0em">
<img src="../resources/images/support.png">
</a>
</body>
</html>