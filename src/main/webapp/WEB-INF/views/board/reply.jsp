<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
  <title>배불뚝이</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
	
</head>
<body>
 
<div class="container">
<jsp:include page="../common/header.jsp"/>
  <h2>게시판</h2>
  <div style="margin-left: -15px;">
  <jsp:include page="../board/reply_dummy.jsp"/>
  </div>
  <div class="panel panel-default">
    <div class="panel-body">
    	<form action = "${cpath}/reply.do" method="post" id="reply">
    	<input type="hidden" name="idx" value="${vo.idx}">
		<input type="hidden" name="memID" value="${vo.memID}">
		<input type="hidden" name="boardType" value="reply">
    	
    	
    		<div class="form-group">
    			<label>제목</label>
   				<input type="text" name="title" class="form-control" value="<c:out value=''/>" required/>
    		</div>
    		<div class="form-group">
    			<label>답변</label>
   				<textarea rows="10" name="content" class="form-control"><c:out value=''/></textarea>
    		</div>
    		<div class="form-group">
    			<label>작성자</label>
   				<input type="text" name="writer" id="writer" value="${mvo.memName}" class="form-control" readonly="readonly"/>
    		</div>
	    		<button class="btn btn-default btn-sm pull-right" onclick="addReply();">등록하기</button>
	    		<button type="reset" class="btn btn-default btn-sm">취소</button>
	    		<button type="button" class="btn btn-sm btn-info" onclick="list();">목록</button>
    		</form>
    </div>
     <jsp:include page="../common/footer.jsp"></jsp:include>
  </div>
</div>
</body>
<script type="text/javascript">
	function list(){
		location.href="${cpath}/tboard.do";
	};
	
	function addReply(){
		console.log($('#writer').val());
		return;
		$('#reply').submit();
	}
</script>
</html>