<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>배불뚝이</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
<jsp:include page="../common/header.jsp"/>
  <h2>마이페이지</h2>
  <div class="panel panel-default">   
    <div class="panel-heading">회원정보 수정</div>
    
    <div>
    <table class="table table-bordered" style="align: center; width: 100px; height: 100px; margin:auto;">
    		<tr>
    			<td colspan="2">
    				<form id="imgForm">
    				<c:if test="${!empty mvo}">
					    <c:if test="${mvo.memProfile eq ''}">
	    					<img class="img-circle" id="View" src="${contextPath}/resources/images/person.PNG" alt="이미지 미리보기" height="100" width="90"/>
	    				</c:if>
					    <c:if test="${mvo.memProfile ne ''}">
	    					<img class="img-circle" id="View" src="${contextPath}/resources/upload/${mvo.memProfile}" alt="이미지 미리보기" height="100" width="90"/>    
						</c:if>    
					</c:if>  
					</form>
    			</td>
    		</tr>
    		<div>
    		</table>
    		 <a type="button" class="btn btn-info btn-sm pull-right" onclick="location.href='${contextPath}/memImageForm.do'">사진등록</a>
    </div>
    
    <div class="panel-body">
    	<form name="frm" action="${contextPath}/memUpdate.do" method="post">
    		<input type="hidden" id="memID" name="memID" value="${mvo.memID}"/>
    		<input type="hidden" id="memPassword" name="memPassword" value=""/>
    		<table class="table table-bordered" style="text-align: center; border: 1px solid;">
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">아이디</td>
    			<td>${mvo.memID}</td>
    		</tr>
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">비밀번호</td>
    			<td></td>
    		</tr>
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">아이디</td>
    			<td>${mvo.memName}</td>
    		</tr>
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">나이</td>
    			<td>${mvo.memAge}</td>
    		</tr>
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">성별</td>
    			<td>${mvo.memGender}</td>
    		</tr>
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">이메일</td>
    			<td>${mvo.memEmail}</td>
    		</tr>
    		<tr>
    			<td colspan="3" style="text-align: left;">
    				<button type="button" class="btn btn-primary btn-sm pull-right" onclick="location.href='${contextPath}/memUpdateForm.do'">수정하기</button>
    			</td>
    		</tr> 
    		</table>
    	</form>
    </div>
  
   <jsp:include page="../common/footer.jsp"></jsp:include>
  </div>
</div>
</body>
</html>