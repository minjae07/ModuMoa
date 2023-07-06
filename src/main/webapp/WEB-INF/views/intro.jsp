<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>메인 화면</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
		if(${!empty msgType}){
				$("#messageType").attr("class","modal-content panel-success");
			$("#myMessage").modal("show");
		} 
	});
  
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
  
</head>
<body>
<div class="container">
<jsp:include page="common/header.jsp"/>  
 	 <div class="panel panel-default">
  	 	 	<div class="panel-body">
				<ul class="nav nav-tabs">
				  <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
				</ul>
				
				<div class="tab-content">
				  <div id="home" class="tab-pane fade in active">
				   	 <jsp:include page="home.jsp"/>  
				  </div>
				</div>
  	 	 	</div>
  	 	 	

   		 	  <jsp:include page="./common/footer.jsp"></jsp:include>
 	 </div>
</div>

</body>
</html>
