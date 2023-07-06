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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
  
  
  <script type="text/javascript">
  	$(document).ready(function(){
  		var result = '${result}';
  		checkModal(result);
  		
  		$(document).ready(function(){
  		
  		  var pageFrm = $("#pageFrm");
  		  $(".pagination a").on("click", function(e) {
  		    e.preventDefault();
  		    var page = $(this).attr("href"); // 페이지 번호
  		    var url = "${cpath}/tboard.do?page=" + page + "&perPageNum=" + ${pageMaker.cri.perPageNum};
  		    $(location).attr("href", url);

  		    pageFrm.find("#page").val(page);
  		    pageFrm.submit();
  		  });
  		});

  	 
  		
  		 $('#sherchBtn').click(function() {
  			var searchType = $('.searchType option:selected').val();
  			var keyWord = $('.keyWord').val();
  			
  			$('#searchType').val(searchType);  			
  			$('#keyWord').val(keyWord);  			
  			$('#searchForm').submit();
		})  
  	});
  	
  	
  	
  	function checkModal(result){
  		if(result==''){
  			return;
  		}
  		if(parseInt(result)>0){
  			$(".modal-body").html("게시글 "+${criteria.totalCount-(criteria.page-1)*criteria.perPageNum -i.index}+"번이 등록되었습니다.");
  		}
  			$("#myModal").modal("show");
  	};
  	
  	function search(){
  		 $("#sherchBtn").trigger("click");
  	};
  	
  	function detail(index) {
  		$(".idx").val(index);
		$("#detail").submit();
	};
  	
  	function wrt() {
  		location.href="${cpath}/register.do";
	};
	
	function goMsg(){
		alert("임시조치 되었습니다. 관리자에게 문의해주세요.");
	}

	</script>
  </script>
  
</head>
<body>
<div class="container">
<jsp:include page="../common/header.jsp"/>
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
    				<%-- <td>${(criteria.page-1)*criteria.perPageNum+i.index+1}</td> --%>
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
    	
    	<!-- 검색 -->
    	  <div style="text-align: center;">
   <form class="form-inline" id="searchForm"  action="/tboard.do" method="POST">
	<input type="hidden" id="searchType" name="searchType" value="">
	<input type="hidden" id="keyWord" name="keyWord" value="">
    <div class="form-group" style="">
    
    <div>
    	<select class="form-control searchType">
    		<option value="title">제목</option>
    		<option value="writer">작성자</option>
    		<option value="content">내용</option>
    	</select>
    	<input type="text" class="form-control keyWord" onkeypress="if(event.keyCode==13){search();}" value="" >
    	<button type="submit" class="search-btn" id="sherchBtn" value="검색">
    		<i class="fas fa-search"></i>
    	</button>
    </div>
   </form> 
   </div>
    	
    	
    	<!-- 페이징처리 -->
		<div style="text-align: center;">
			<ul class="pagination">
				<!-- 이전 -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous">
						<a href="${pageMaker.startPage-1}">이전</a>
					</li>
				</c:if>
			
				<!-- 페이지 번호 처리 -->
				<c:forEach var="pageNum" begin="${pageMaker.startPage}" end ="${pageMaker.endPage}">
					<li class="paginate_button" ${pageMaker.cri.page==pageNum ? 'active' : ''}><a href="${pageNum}">${pageNum}</a>
					</li>
				</c:forEach>
				
				<!-- 다음 -->
				<c:if test="${pageMaker.next}">
					<li class="pageinate_button next">
						<a href="${pageMaker.endPage+1}">다음</a>
					</li>
				</c:if>
			</ul>
			<%-- <div class="panel-footer">
			<jsp:include page="../common/footer.jsp"></jsp:include>
			</div> --%>
		</div>
		<!-- End -->
		
		<form id="pageFrm" action="${cpath}/tboard.do" method="get">
			<input type="hidden" id="page" name="page" value="${pageMaker.cri.page}">
			<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
		</form>

    	
    	
    	
    	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">등록</h4>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>




  <jsp:include page="../common/footer.jsp"></jsp:include>


</div>

    </div>
   
  </div>
</div>

</body>
</html>
