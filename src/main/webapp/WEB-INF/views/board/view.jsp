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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  
  <style>
  table {
        border-collapse: collapse;
        width: 100%;
        table-layout: fixed;
      }
      
      th {
        text-align: center;
        vertical-align: middle;
        height: 50px;
      }

      td {
        text-align: left;
        vertical-align: middle;
        height: 50px;
        padding: 5px;
        
      }

      #icon-cell {
        width: 5%;
        height: 50px;
      }

      #author-cell {
        width: 22%;
        height: 50px;
      }

      #views-cell {
        width: 13%;
        height: 50px;
        text-align: right;
      }

      #content-cell {
        width: 60%;
        height: 50px;
      }
	  #junk-cell {
	  	width: 30px;
	  	height: 50px;
	  }
	  
      textarea {
        height: 300px;
        width: 100%;
        resize: none;
      }
      input {
		font-size: 15px;
		border: 0;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		
		}
      
      
    </style>
    
      <style type="text/css">
  .search-btn {
  color: #6D6D6D;
  float: right;
  width: 35px;
  height: 35px;
  border-radius: 50%;
  background: #EDEDED;
  display: flex;
  align-items: center;
  justify-content: center;
}

.searchText {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

tr[data-boardtype="notice"][data-memid="admin"] td {
  color: red;
  font-weight: bold;
}


  </style>
  
</head>
<body>
	<div class="container">
	<jsp:include page="../common/header.jsp"/>
	<h3>자유게시판</h3>
	  <div class="panel panel-default">
	    <div class="panel-body">
		 <form id="modify"  action="/modify.do" method="GET">
		  <!-- <input type="hidden" value="" name="idx" class="idx"> -->
		  </form>
		<table	class="table-responsive">
		  <tr>
		    <td colspan="3" style="text-align: left; ">
		    	<c:if test="${vo.memID=='admin' && vo.boardType=='notice'}">
				    <input type="text"  name="title" style="width: 90%; color: red; font-weight: bold;" readonly="readonly" value="<c:out value='${vo.title}'/>" />
				</c:if>
				<c:if test="${vo.boardType !='notice'}">
				    <input type="text"  name="title" style="width: 90%;" readonly="readonly" value="<c:out value='${vo.title}'/>" />
				</c:if>
		    </td>
		    <th class="view-count-cell" style="text-align: right;"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.indate}"/></th>
		  </tr>
		  <tr>
	    	 <td class="icon-cell"><span class="glyphicon glyphicon-heart-empty">
	    	 <input type="text"  name="writer"  readonly="readonly" value="<c:out value='${vo.writer}'/>"/>
	    	  </td>
	    <td class="author-cell"></td>
	    <td class="view-count-cell" style="text-align: right;">조회수: ${vo.count}
	   </td>
	  </tr>
	  <tr>
	    <td colspan="4">
	  <div style="min-height: 200px; height:auto; border: none; background: transparent;" name="content" id="content" class="form-control" readonly="readonly">${vo.content}</div>
	  </tr>
    		<td colspan="4" style="text-align: left;">
    	  <c:if test="${!empty mvo && vo.boardType != 'notice'}">
    		<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${cpath}/reply.do?idx=${vo.idx}'">답글</button>
    	  </c:if>
    	<c:if test="${mvo.memName == vo.writer}">
    		<button type="button" class="btn btn-sm btn-success" onclick="location.href='${cpath}/modify.do?idx=${vo.idx}'">수정</button>
		 	<button type="button" class="btn btn-sm btn-warning" onclick="if(confirm('삭제하시겠습니까?')){location.href='${cpath}/remove?idx=${vo.idx}';}">
			삭제
			</button>
		</form>
 		
		<!-- page=2&perPageNum=5   "${cpath}/tboard.do?page=" + page + "&perPageNum=" + ${pageMaker.cri.perPageNum};-->
    	</c:if>
    	<c:if test="${mvo.memID == 'admin' && vo.boardAvailable == '1'}">
    		<button type="button" class="btn btn-sm pull-right" onclick="location.href='${cpath}/temp.do?idx=${vo.idx}'">임시조치</button>
    	</c:if>
    	<c:if test="${mvo.memID == 'admin' && vo.boardAvailable == '0'}">
    		<button type="button" class="btn btn-sm pull-right" onclick="location.href='${cpath}/delTemp.do?idx=${vo.idx}'">임시조치 해제</button>
    	</c:if>
    		<button type="button" class="btn btn-sm btn-info" onclick="location.href='${cpath}/tboard.do?'">목록</button>
		</td>
    	</table>
    </div>
    
<hr></hr>    
    
<!-- Comments List -->
    <form action = "${cpath}/tblReply" method="post" id="reply">

<div class="card my-4">
  <h5 class="card-header"><i class="material-icons" style="font-size:27px">&#xe0b7; 댓글</i></h5>
  <div class="card-body">
    <ul class="list-unstyled">
      <c:forEach items="${replyList}" var="reply">
        <li class="media">
        <c:if test="${reply.writer == '관리자'}">
        	 <div class="media-body">
			    <div style="background-color: #f8f9fa; border-radius: 5px; padding: 5px; color: red; font-weight: bold;">
			      <p class="mb-1">${reply.writer} <span class="text-muted indate"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${reply.regdate}"/></span></p>
			    </div>
			    <p style="font-weight: bold;">${reply.content}</p>
			 </div>
        </c:if>
        <c:if test="${reply.writer != '관리자'}">
		  <div class="media-body">
		    <div style="background-color: #f8f9fa; border-radius: 5px; padding: 5px;">
		      <p class="mb-1">${reply.writer} <span class="text-muted indate"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${reply.regdate}"/></span></p>
		    </div>
		    <p>${reply.content}</p>
		  </div>
		 </c:if>
		</li>
      </c:forEach>
       <c:if test="${empty replyList}">
              <p style="text-align: center;">댓글이 없습니다</p>
       </c:if>
    </ul>
  </div>
</div>

<!-- Comments Form -->
<div class="card my-4">
  <h5 class="card-header"></h5>
  <div class="card-body">
    <form name="comment-form" id="addReply" action="${cpath}/addReply" method="post" autocomplete="off">
      <input type="hidden" name="idx" value="${vo.idx}">
      <input type="hidden" name="writer" value="${mvo.memName}" readonly="readonly">
    </form>
    <c:if test="${!empty mvo}">
    <div class="form-group">
      <textarea name="content" class="form-control" rows="3"></textarea>
    </div>
    <button class="btn btn-default btn-sm pull-right" onclick="tblreply();">등록</button>
    </c:if>
  </div>
</div>
</form>


<h3>자유게시판</h3>
  <div class="panel panel-default" >
  
   	<form class="frm" id="detail" action="/view.do" method="get">
    <input type="hidden" value="" name="idx" class="idx">
   	</form>
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
    		<c:forEach var="notice" items="${notice}" varStatus="i">
    		<tr data-boardtype="${notice.boardType}" data-memid="${notice.memID}" style="cursor: pointer;" onclick="detail(${notice.idx});">
	    		<td>${i.index+1}</td>
	    		<td>
	    			<c:out value='${notice.title}'></c:out>
	    		</td>
	    		<td>${notice.writer}</td>
	    		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.indate}"/></td>
	    		<td>${notice.count}</td>
    		</tr>
    		</c:forEach>
    		
    		
    		<c:forEach var="vo" items="${list}" varStatus="i">
    		<c:if test="${vo.boardAvailable==1}">
    			<tr data-boardtype="${vo.boardType}" data-memid="${vo.memID}" style="cursor: pointer;" onclick="detail(${vo.idx});"/>
    		</c:if>
    		<c:if test="${vo.boardAvailable==0 && mvo.memID != 'admin'}">
    			<tr onclick="goMsg();"/>
    		</c:if>
    		<c:if test="${vo.boardAvailable==0 && mvo.memID == 'admin'}">
    			<tr data-boardtype="${vo.boardType}" data-memid="${vo.memID}" style="cursor: pointer;" onclick="detail(${vo.idx});"/>
    		</c:if>
    				<td>${criteria.totalCount-(criteria.page-1)*criteria.perPageNum -i.index}</td>
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
    		<c:if test="${!empty mvo}">
    		<tr>
    			<td colspan="5">
    				<button id="regBtn" class="btn btn-sm btn-primary pull-right" onclick="wrt();">글쓰기</button>
    			</td>
    		</tr>
    		</c:if>
    	</table>

 <jsp:include page="../common/footer.jsp"></jsp:include>
      </div>
</div>	
    	

    	
    	
    	
<!-- 퀵메뉴 -->
    	<div id="Quick" class="" style="position: absolute; left: 10px; ">
    <table class="quickMenuBar" style="">
        <tr>
            <td colspan="2" style="cursor:pointer;" onclick="window.scrollTo(0,0);">TOP</td>
        </tr>
    </table>
</div>
<!-- 퀵메뉴 끝 -->



</body>
<script type="text/javascript">
$(document).ready(function() {
	
	
});

function tblreply(){
	$('#addReply').submit();
}
function detail(index) {
		$(".idx").val(index);
	$("#detail").submit();
};


function wrt() {
		location.href="http://localhost:9080/register.do";
};

function goMsg(){
	alert("임시조치 되었습니다. 관리자에게 문의해주세요.");
}

//퀵메뉴 추가 이벤트 시작
$(document).ready(function(){
$(window).scroll(function(){  //스크롤이 움직일때마다 이벤트 발생
      var position = $(window).scrollTop()+200; // 현재 스크롤바의 위치값을 반환
      $("#Quick").stop().animate({top:position+"px"}, 400); //해당 오브젝트 위치값 재설정
   });

});


</script>
</html>




