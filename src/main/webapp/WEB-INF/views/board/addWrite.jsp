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

</head>
<body>
	<div class="container">
	<jsp:include page="../common/header.jsp"/>
	  <h2>게시판</h2>
		  <div class="panel panel-default">
		    <div class="panel-heading">BOARD</div>
		    <div class="panel-body" id="wfrom" >
		      <form id="frm">
		      <input type="hidden" name="memID" id="memID" value="${mvo.memID}" />
					<table class="table">
					<tr>
					</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" id="title" name="title" class="form-control" /></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea rows="7" id="content" name="content" class="form-control"></textarea></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" id="writer" name="writer" class="form-control" value="${mvo.memName}" readonly="readonly"/></td>
						</tr>
						<tr>
						<td colspan="2" align="center">
						<button type="button" class="btn btn-success btn-sm" onclick="goInsert()">등록</button>
						<button type="reset" class="btn btn-warning btn-sm" id="fclear">취소</button>
						<button type="button" class="btn btn-info btn-sm" onclick="goList()">목록</button>
						</tr>
					</table>
				</form>
		    </div>
		     <jsp:include page="../common/footer.jsp"></jsp:include>
		  </div>
		</div>
	
	</body>
</html>
