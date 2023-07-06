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
  <script src="http://madalla.kr/js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript">
	$(document).ready(function(){
		if(${!empty msgType}){
			$("#messageType").attr("class","modal-content panel-warning");
			$("#myMessage").modal("show");
		}
	});
  </script>
  <script type="text/javascript">
	  $(function() {
		    $("#myFile").on('change', function(){
		    readURL(this);
		    });
		});
		function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		        $('#View').attr('src', e.target.result);
		        }
		        reader.readAsDataURL(input.files[0]);
		    }
		}
  </script>
</head>
<body>
<div class="container">
<jsp:include page="../common/header.jsp"/>
  <h2>마이페이지</h2>
  <div class="panel panel-default">
    <div class="panel-heading">회원 사진등록 양식</div>
    <div class="panel-body">
    	<form action="${contextPath}/memImageUpdate.do" method="post" enctype="multipart/form-data">	<!-- enctype="multipart/form-data": 바이너리와 string을 구분해서 넘김 -->
    		<input type="hidden" name="memID" value="${mvo.memID}"/>
    		<table class="table table-bordered" style="text-align: center; border: 1px solid;">
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">아이디</td>
			<td>${mvo.memID}</td>
    		</tr>
    		<tr>
    			<td style="width: 110px; vertical-align: middle;">사진 업로드</td>
    			<td colspan="2">
    				<form id="imgForm">
    				
    				<c:if test="${!empty mvo}">
					    <c:if test="${mvo.memProfile eq ''}">
	    					<img id="View" src="${contextPath}/resources/images/person.PNG" alt="이미지 미리보기" height="80" width="80"/>
	    				</c:if>
					    <c:if test="${mvo.memProfile ne ''}">
	    					<img id="View" src="${contextPath}/resources/upload/${mvo.memProfile}" alt="이미지 미리보기" height="80" width="80"/>    
						</c:if>    
					</c:if>  
					    <input type='file' id="myFile" accept="image/png, image/jpeg, image/jpg" name="memProfile"/>
					</form>
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2" style="text-align: left;">
    				<input type="submit" class="btn btn-primary btn-sm pull-right" value="등록"/>
    			</td>
    		</tr> 
    		</table>
    	</form>
    </div>
    <!-- 실패 메세지 -->
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
    <jsp:include page="../common/footer.jsp"></jsp:include>
  </div>
</div>

</body>
</html>
