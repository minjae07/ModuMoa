 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>게시판</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script>
  
  function goAddPage() {
	location.href="/addBoardPage.do"
}
  </script>
</head>
<body>
	<div class="container">
	<jsp:include page="../common/header.jsp"/>
	  <h2>게시판목록</h2>
		  <div class="panel panel-default">
		    <div class="panel-heading">BOARD</div>
		    <div class="panel-body" id="wfrom">
		    <form id="frm">
			    <input type="hidden" name="memID" id="memID" value="${mvo.memID}" />
		    	<table style="border: 1px solid black;">
		    		<tr style="border: 1px solid black;">
		    			<th>번호</th>
		    			<th>제목</th>
		    			<th>작성자</th>
		    			<th>조회수</th>
		    			<th>작성일</th>
		    		</tr>
		    		<tr>
		    			<td>번호</td>
		    			<td>번호</td>
		    			<td>번호</td>
		    			<td>번호</td>
		    			<td>번호</td>
		    		</tr>
		    		
		    	</table>
		    
			</form>
		    </div>
		    <div>
		    	<button type="button" onclick="goAddPage()">글등록</button>
		    </div>
		       <jsp:include page="../common/footer.jsp"></jsp:include>
		  </div>
		</div>
	
	</body>
</html>
