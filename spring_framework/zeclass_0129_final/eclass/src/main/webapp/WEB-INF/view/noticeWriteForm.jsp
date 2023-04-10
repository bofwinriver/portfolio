<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>게시판 내용수정</title>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/css/noticeWriteForm.css" rel="stylesheet"/>
<script>
   function totalList(){
       
       const backForm = document.querySelector('#backForm');
       backForm.submit();
   }
   function enter(){
      
      if (event.keyCode === 13){
         const textarea = document.querySelector('textarea');
         textarea.value +="\n";
         
      }
      
   }
         
    function formSubmit(){
      const form = document.querySelector('form');
      const textarea = document.querySelector('textarea');
      
      let input = document.createElement('input');
      input.setAttribute('type', 'hidden');
      input.setAttribute('name', 'noticeContent');
      input.setAttribute('value', textarea.value.replace("\n","<br>")); 
      
      form.appendChild(input);
      form.submit();
       
    }
    
   
</script>
</head>
<body> 
   <div id="totalDiv">
      <jsp:include page="sidebar.jsp"/>
      <jsp:include page="header.jsp"/>
      <div id="mainBody">
         <div id="mainBody2">
          	<c:if test="${specificNotice.noticeWriter eq null }">
         		<h3>게시글 작성</h3>
         	</c:if>
         	<c:if test="${specificNotice.noticeWriter != null }">
         		<h3>게시글 수정</h3>
         	</c:if>         	
            <hr>
		      <form:form action="${pageContext.request.contextPath}/courses/notice/write/${classNumber}" modelAttribute="specificNotice" method="POST"> 
		      	<c:if test="${specificNotice.noticeWriter!=null}">
		      		<input type="hidden" name="modify" value="true"/>
		      	</c:if>
		      	<form:hidden path="noticeNumber"/>
		      	<form:hidden path="classNumber"/>         
		     	<form:hidden path="noticeDate"/>  
		     	<form:hidden path="noticeViews"/>
		     	<form:hidden path="noticeWriter"/>  
                  <label for="noticeTitle" class="form-label"></label>
                  <form:input path="noticeTitle" class="form-control" list="datalistOptions" id="noticeTitle"/>
               <br>
               <form:textarea path="noticeContent" oninput="enter()"></form:textarea>
               <hr>
               <button type="submit" class="btn btn-info" onclick="formSubmit()">등록</button>
               <button type="button" class="btn btn-secondary" onclick="totalList()">취소</button>      
            </form:form> 
            <form:form id="backForm" action="${pageContext.request.contextPath}/courses/notice/${classNumber}" method="POST">
                  
            </form:form>         
         </div>   
      </div>
   </div>      
   
   
   
</body>
</html>