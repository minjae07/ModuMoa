<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>배불뚝이</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
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
</head>
<body>
	<div class="container">
	<jsp:include page="../common/header.jsp"/>
	<h2>게시판</h2>
	  <div class="panel panel-default">
	    <div class="panel-body">
		 <form id="modify"  action="/modify.do" method="POST">
		 <input type="hidden" value="${vo.idx}" name="idx" class="idx">
		<table	class="table-responsive">
		  <tr>
		    <td colspan="3" style="text-align: center;">
		    	<input type="text" name="title" value="${vo.title}"/>
		    </td>
		    <th class="view-count-cell" style="text-align: right;"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.indate}"/></th>
		  </tr>
		  <tr>
	    	 <td class="icon-cell">
	    	 	<span class="glyphicon glyphicon-heart-empty">
	    	 	<input type="text" name="writer" readonly="readonly" value="${vo.writer}"/>
	    	 </td>
	    <td class="author-cell"></td>
	    <td class="view-count-cell" style="text-align: right;">조회수: ${vo.count}
	   </td>
	  </tr>
	  <tr>
	    <td colspan="4"><textarea rows="10" class="form-control" name="content">${vo.content}</textarea></td>
	  </tr>
    		<td colspan="4" style="text-align: left;">
	    		<button type="button" class="btn btn-sm btn-danger" onclick="history.go(-1)">수정취소</button>
	    		<button type="button" class="btn btn-sm btn-info" onclick="list();">목록</button>
	    		<button type="button" class="btn btn-sm btn-success pull-right" onclick="modify();">수정 완료</button>
    		</td>
    	</table>
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
	
	function modify() {
		  $('#modify').submit();
		}
	
</script>


</html>
