<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/css/notice.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function submitPost(noticeNumber){
    let fm= document.getElementById("noticeSubmit")
    
    let obj2 = document.createElement('input');
    obj2.setAttribute('type', 'hidden');
    obj2.setAttribute('name', 'noticeNumber');
    obj2.setAttribute('value', noticeNumber);
    
    fm.appendChild(obj2);
   
    fm.submit();
}
	
	
	function press(f){
	    if(f.keyCode == 13){ 
	        formname.submit(); 
	    }
	}	

</script>
</head>
<body>
	<jsp:include page="sidebar.jsp"/>
	<jsp:include page="header.jsp"/>
		<div>
			<div id="mainBody2">
			<div>
				<security:authorize access="hasAnyRole('PROFESSOR','ASSISTANT')">
				<form:form action="${pageContext.request.contextPath}/courses/notice/writeForm/${classNumber}" method="POST">
					<button id="wirteNotice" type="submit" class="btn btn-secondary">글쓰기</button>
				</form:form>
				</security:authorize>	
				 <form:form action="${pageContext.request.contextPath}/courses/notice/unreadNotice/${classNumber}" method="POST"> 
	    			<button id="nonread" type="submit" class="btn btn-secondary">안 읽은 공지만 보기</button>
	   			 </form:form>
				<form:form action="${pageContext.request.contextPath}/courses/notice/search/${classNumber}" method="POST">
				   	<label for="inputTitleName" class="form-label"></label>
				   	<input type="text" name="searchName" class="form-control" list="datalistOptions"
				   	onkeypress="JavaScript:press(this.form)" id="inputTitleName" placeholder="공지사항 검색"/>  			       
			    </form:form>
		    </div>
		    <br>
			<hr>
				<form:form action="${pageContext.request.contextPath}/courses/notice/read/${classNumber}" id="noticeSubmit" method="POST"></form:form>
				<c:forEach var="n" items="${noticeList}">
				<div class="clearfix">
					<div class="ni">
					<img src="${path}/img/icon/user.jpg" width="50" height="50"><br>
					</div>
					<div class="nm">
					<b><span onclick="javascript:submitPost(${n.noticeNumber})">${n.noticeTitle}</span></b>
					<c:set var="nc" value="${n.noticeContent}"/>
						<br>
						<c:choose>
							<c:when test="${nc.length() > 30}">
								<c:out value="${fn:substring(nc, 0, 30)}...">
								</c:out>
							</c:when>
							<c:otherwise>
								${nc}
							</c:otherwise>
						</c:choose>
					</div>
					<div class="ndd">	
							<span class="nd"><b>게시일시</b></span><br>
							<span class="nd">${String.format("%1$tY년 %1$tm월 %1$td일 %1$tH시 %1$tI분", n.noticeDate)}</span><br>
					</div>	
				</div>
				<hr>
				</c:forEach>
				<c:if test="${noticeList.size()==0}"> 등록된 공지사항이 없습니다. </c:if>
			</div>
		</div>
		<form:form action="${pageContext.request.contextPath}/courses/notice/writeForm/${classNumber}" method="POST">
		<button> 글쓰기 </button>
		</form:form>

</body>
</html>