<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-default">		<!-- 색상변경 -->
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${contextPath}/">모두모아</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
     	<li><a href="intro.do">소개</a></li>
        <li><a href="tboard.do">자유게시판</a></li>
      <%--   <c:if test="${mvo.memID == 'admin'}">
        <!-- <li><a href="tboard.do?boardType=notice">임시 게시판</a></li>  --> 
        </c:if>  --%> 
        <li><a href="QnA.do">고객센터</a></li>   
      </ul>
      <c:if test="${empty mvo}">
	      <ul class="nav navbar-nav navbar-right">
	            <li><a href="${contextPath}/memLoginForm.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
	            <li><a href="${contextPath}/memJoin.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>            
	      </ul>
      </c:if>
      <c:if test="${!empty mvo}">
	      <ul class="nav navbar-nav navbar-right">
	      		<li class="dropdown">
			          <li><a href="${contextPath}/mypage.do"><span class="glyphicon glyphicon glyphicon-wrench"></span> 마이페이지</a></li>
			      </li>
			    <c:if test="${mvo.memID == 'admin'}">
			    	 <li><a href="${contextPath}/admin.do">관리자 페이지</a></li>
			    </c:if>
	            <li><a href="${contextPath}/memLogout.do"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>            
	            <c:if test="${!empty mvo}">
			    <c:if test="${empty mvo.memProfile}">
			      <li><img class="img-circle" src="${contextPath}/resources/images/person.PNG" style="width: 50px; height: 50px"/> ${mvo.memName} 님</li>
			    </c:if>
			    <c:if test="${!empty mvo.memProfile}">
			      <%-- <li><img class="img-circle" src="${contextPath}/resources/upload/${mvo.memProfile}" style="width: 50px; height: 50px"/> ${mvo.memName} 님</li> --%>
			      <li><img class="img-circle" src="${contextPath}/resources/upload/${mvo.memProfile}" style="width: 50px; height: 50px"/> ${mvo.memName} 님</li>
			    </c:if>			  
			  </c:if>
	      </ul>
      </c:if>
      
      
    </div>
  </div>
	<div style="text-align: right" id="google_translate_element" class="hd_lang"></div>
</nav>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage: 'ko',
			includedLanguages: 'ko,ja,en,zh-CN,zh-TW',
			layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
			autoDisplay: false
		}, 'google_translate_element');
	}
  </script>
  <script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>