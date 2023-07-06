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
  <div class="panel panel-default">
    <div class="panel-body">
    	<form action = "${cpath}/register.do" method="post">
    	<input type="hidden" name="memID" value="${mvo.memID}"> 
    	
    	<div class="form-group"  style="overflow: hidden;">
    		<div lass="form-group" style="float: left; width: 15%;">
		    	<select class="form-control" name="boardType">
		    			<option value="free" selected>자유 게시판</option>
		    		<c:if test="${mvo.memID == 'admin'}">
		    			<option value="notice">공지사항</option>
		    		</c:if>
				 </select>
			</div>
    		<div class="form-group" style="float: left; width: 65%;">
    				<input type="text" name="title" class="form-control" placeholder="제목" />
    		</div>
    	</div>
    		
    		<div class="form-group">
    			<label>내용</label>
    				<textarea rows="10" name="content" id="content" class="form-control"></textarea>
    		</div>
    		<div class="form-group">
    			<label>작성자</label>
    				<input type="text" name="writer" value="${mvo.memName}" class="form-control" readonly="readonly"/>
    		</div>
    		<button class="btn btn-default btn-sm pull-right">등록</button>
    		<button type="reset" class="btn btn-default btn-sm">취소</button>
    		<button type="button" class="btn btn-sm btn-info" onclick="list();">목록</button>
    	</form>
    </div>
     <jsp:include page="../common/footer.jsp"></jsp:include>
  </div>
  
</div>
</body>
<script src="/resources/smarteditor2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var oEditors = []; 
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "/resources/smarteditor2/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		}
	});
	
	    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
	    let content = document.getElementById("content").value
	    
	    if(content == '<p>&nbsp;</p>') {
	        alert("내용을 입력해주세요.")
	        oEditors.getById["content"].exec("FOCUS")
	        return
	    } else {
	        console.log(content)
	        let writePost = {
	            title: $("#title")[0].value
	            ,content: content
	        }
	        
	        //ajax 통신으로 서버로 보내 데이터 저장함
	        $.ajax({
	            url: "postInsertAjax"
	            , data: writePost
	            , type: 'POST'
	            , success: function(data) {
	                console.log('success')
	                alert('저장되었습니다.')
	                location.href='${cpath}/tboard.do"'
	            }
	            , error: function(jqXHR, textStatus, errorThrown) {
	                console.log(jqXHR)
	                alert('오류가 발생하였습니다.')
	            }
	        })
	    }
});
function list(){
	location.href="${cpath}/tboard.do";
};




</script>
</html>
