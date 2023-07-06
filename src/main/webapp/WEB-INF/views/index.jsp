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
	
	function detail(index) {
  		$(".idx").val(index);
		$("#detail").submit();
	};
	
	function goMsg(){
		alert("임시조치 되었습니다. 관리자에게 문의해주세요.");
	}
</script>
<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
  
  <style type="text/css">
		tr[data-boardtype="notice"][data-memid="admin"] td {
		  color: red;
		  font-weight: bold;
		}
  </style>
</head>
<body>
<div class="container">
<jsp:include page="common/header.jsp"/>  
 	 <div class="panel panel-default">
 	 
<%--   	 		<div>
				<img src="${contextPath}/resources/images/main.png" style="width:100%; height:400px;" />
			</div>
 --%>  	 	 	
 <div class="panel-body">
   	
   	
   	<h3>공지사항</h3>
 <form class="frm" id="detail" action="/view.do" method="get">
    <input type="hidden" value="" name="idx" class="idx">
   	</form>
  <div class="panel panel-default">
					    <div class="panel-body">
					    	 <table class="table table-boardered table-hover">
    		<thead>
    			<tr>
    				<th>번호</th>
    				<th>제목</th>
    				<th>작성자</th>
    				<th>작성일</th>
    				<th>조회수</th>
    			</tr>
    		</thead>
    		<c:forEach var="vo" items="${notice}" varStatus="i">
    		<c:if test="${vo.boardAvailable==1}">
    			<tr data-boardtype="${vo.boardType}" data-memid="${vo.memID}" style="cursor: pointer;" onclick="detail(${vo.idx});"/>
    		</c:if>
    		<c:if test="${vo.boardAvailable==0}">
    			<tr onclick="goMsg();"/>
    		</c:if>
    				<td>${i.index+1}</td>
    				<td>
    				<c:if test="${vo.boardLevel>0}">
    				 <c:forEach begin="1" end="${vo.boardLevel}">
    				 	<span style="padding-left: 10px;"></span>
    				 </c:forEach>
    				</c:if>
    				<c:if test="${vo.boardLevel>0}">
    				[RE]
    				</c:if>
    				<c:if test="${vo.boardAvailable==0}">
    					임시조치된 게시물입니다.
    				</c:if>
    				<c:if test="${vo.boardAvailable>0}">
    					<c:out value='${vo.title}'></c:out>
    				</c:if>
    				</td>
    				<td>${vo.writer}</td>
    				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.indate}"/></td>
    				<td>${vo.count}</td>
    			</tr>
    		</c:forEach>
    		<c:if test="${empty list}">
    			<td colspan="5" style="text-align: center;">게시글이 없습니다</td>
			</c:if>
    	</table>
					    </div>
    				</div>
    				
    				
 <h3>인기 게시글</h3>
 <form class="frm" id="detail" action="/view.do" method="get">
    <input type="hidden" value="" name="idx" class="idx">
   	</form>
  <div class="panel panel-default">
					    <div class="panel-body">
					    	 <table class="table table-boardered table-hover">
    		<thead>
    			<tr>
    				<th>번호</th>
    				<th>제목</th>
    				<th>작성자</th>
    				<th>작성일</th>
    				<th>조회수</th>
    			</tr>
    		</thead>
    		<c:forEach var="vo" items="${list}" varStatus="i">
    		<c:if test="${vo.boardAvailable==1}">
    			<tr data-boardtype="${vo.boardType}" data-memid="${vo.memID}" style="cursor: pointer;" onclick="detail(${vo.idx});"/>
    		</c:if>
    		<c:if test="${vo.boardAvailable==0}">
    			<tr onclick="goMsg();"/>
    		</c:if>
    				<td>${i.index+1}</td>
    				<td>
    				<c:if test="${vo.boardLevel>0}">
    				 <c:forEach begin="1" end="${vo.boardLevel}">
    				 	<span style="padding-left: 10px;"></span>
    				 </c:forEach>
    				</c:if>
    				<c:if test="${vo.boardLevel>0}">
    				[RE]
    				</c:if>
    				<c:if test="${vo.boardAvailable==0}">
    					임시조치된 게시물입니다.
    				</c:if>
    				<c:if test="${vo.boardAvailable>0}">
    					<c:out value='${vo.title}'></c:out>
    				</c:if>
    				</td>
    				<td>${vo.writer}</td>
    				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.indate}"/></td>
    				<td>${vo.count}</td>
    			</tr>
    		</c:forEach>
    		<c:if test="${empty list}">
    			<td colspan="5" style="text-align: center;">게시글이 없습니다</td>
			</c:if>
    	</table>
					    </div>
    				</div>
    				
   <jsp:include page="./common/footer.jsp"></jsp:include>
 

<!-- 성공 메세지를 출력(modal) -->
	<div id="myMessage" class="modal fade" role="dialog" >
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div id="messageType" class="modal-content panel-info">
	      <div class="modal-header panel-heading">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">${msgType}</h4>
	      </div>
	      <div class="modal-body">
	        <p>${msg}</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>	
	  </div>
	</div>    
	
	
</body>
</html>
