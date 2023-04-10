<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
    <link href="${path}/css/main.css" rel="stylesheet"/>
<head>
<title>Eclass Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

</head>

<body>
 <div class="header">
<form:form action="${path}/logout" method="post">
 	<security:authentication property = "principal.username" var="username"/>
    <div id="header1">
        <img src="${path}/img/home/logo2.jpg" width="300" height="100%" style="margin-left: 10px;">
        <security:authorize access="isAuthenticated()">
        		<button id="loginBt" class="btn btn-info" >로그아웃</button>
        </security:authorize>        
    </div>
</form:form>

</div>
</body>

</html>
