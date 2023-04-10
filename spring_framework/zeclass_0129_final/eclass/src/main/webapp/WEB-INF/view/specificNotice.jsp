<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/css/specificNotice.css" rel="stylesheet"/>
<title>Insert title here</title>
<script>
	function submitModify() { 
		const frm = document.querySelector('#dmForm');
    	frm.action= frm.action.replace('delete','modifyForm');
    	frm.submit(); 
  } 
		
	
</script>




</head>
<body>
	<c:set var="sn" value="${specificNotice}"/>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<jsp:include page="sidebar.jsp" />
	<jsp:include page="header.jsp" />
	<div id="mainBody">
	<div class="card" >
		
	  <div class="card-header">
	  	<h5>${sn.noticeTitle}</h5>
	  </div>
	  <div class="card-body">
	  	<div id="card-sub">${sn.noticeWriter} | 게시일자 : ${sn.noticeDate}</div>
	    <div class="card-text">${sn.noticeContent}</div>
	    <div>  
	    </div>
	  </div>
	  <div class="card-footer text-muted">
			<form:form id="dmForm" action="${path}/courses/notice/delete/${classNumber}" method="POST">
				<input type="hidden" name="noticeNumber" value="${sn.noticeNumber}"/>
				<button class="btn btn-danger" type="submit">삭제하기</button>
				<button id="modifyButton" type="submit" class="btn btn-secondary" onclick="submitModify(this.form);">수정하기</button>
			</form:form>
			<form:form
				action="${path}/courses/notice/${classNumber}"
				method="POST">
				<button type="submit" class="btn btn-secondary">목록</button>
			</form:form>	
	  </div>
	</div>
	</div>
</body>						
</html>