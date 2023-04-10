<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		text-align: center;
	}
	img{
	
		width:600px;
		margin-top: 25px;
	}
</style>
</head>
<body>
<img src="${pageContext.request.contextPath}/img/error.png"/>
	<div>
	<h1>${message}</h1>
	<a href="${pageContext.request.contextPath}/">첫화면으로 돌아가기</a>
	</div>
</body>
</html>