<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

	<link rel="stylesheet" href="css/plain-login.css">
	<link rel="stylesheet"
	     href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
</style>

</head>


<body>
	  
    <div>		
		<div id="loginbox">			
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title"><h4><b>회원정보 수정</b></h4></div>
				</div>
				<div style="padding-top: 30px" class="panel-body">
					<div class="form-group">
      <form:form action="${pageContext.request.contextPath}/modifyUserInfoForm/save" modelAttribute="userInfoList" method="POST"> 
      <form:hidden path="username"/>
      <form:hidden path="etc" />
				<table>
				   	<tr>	
					    <td>
	                        <label for="major" class="form-label">전공</label>
	                        <form:hidden path="major" value="tessst"/>
	                        <input type="text" class="form-control" placeholder="${userInfoList.major}" name="major" id="major" disabled readonly/>
						<br>
						</td>
              		</tr>		    
				    <tr>
					    <td>
                        <label for="email" class="form-label">Email</label>
                        <form:input path="email" class="form-control" id="email" list="datalistOptions" />
						<br>
						</td>
					</tr>
				   	<tr>
              		<tr>							
					    <td>
                        <label for="name" class="form-label">이름</label>
                        <input type="text" class="form-control" placeholder="${userInfoList.name}" name="name" id="name" disabled readonly/>
						<br>
						</td>
              		</tr>
              		<tr>				
					    <td>
                        <label for="birth" class="form-label">생일</label>
                        <input type="text" class="form-control" placeholder="${userInfoList.birth}" name="birth" id="birth" disabled readonly/>
						<br>
						</td>
              		</tr>
				</tbody>
				</table>							
						<div style="margin-top: 10px" class="form-group">						
							<div>
								<button type="submit" class="btn btn-info changePW" class="save">변경</button>								 
								<button type="button" class="btn btn-secondary goHome"
								 onclick="window.location.href='${pageContext.request.contextPath}/'">취소</button>								 
							</div>
						</div>        
         </form:form>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>
