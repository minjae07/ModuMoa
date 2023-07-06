<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <title>Admin 배불뚝이</title>
    
    <!-- Bootstrap CSS CDN -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="${cp}/resources/css/style3.css">
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
</head>
<body>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <h4>회원 관리</h4>
      <form action="users" method="get"></form>
      <div class="table-responsive">
        <table id="memtable" class="table table-bordred table-striped">
          <thead>
            <th><input type="checkbox" id="checkall" /></th>
            <th>번호</th>
            <th>아이디</th>
            <th>이름</th>
            <th>나이</th>
            <th>성별</th>
            <th>이메일</th>
            <th>삭제</th>
          </thead>
          <c:forEach items="${memList}" var="mvo">
            <tr>
            <c:if test="${mvo.memID =='admin'}">
            <td></td>
            </c:if>
            <c:if test="${mvo.memID !='admin'}">
              <td><input type="checkbox" name="chk" /></td>
            </c:if> 
              <td>${mvo.memIdx}</td>
              <td>${mvo.memID}</td>
              <td>${mvo.memName}</td>
              <td>${mvo.memAge}</td>
              <td>${mvo.memGender}</td>
              <td>${mvo.memEmail}</td>
                <c:if test="${mvo.memID =='admin'}">
			      <td>어드민 계정</td>
			    </c:if>
			    <c:if test="${mvo.memID !='admin'}">
			      <td>
			        <input type="button" value="삭제" class="btn btn-default" onclick="if(confirm('${mvo.memID}님을 삭제하시겠습니까?')){memberDel(${mvo.memIdx})}">
			      </td>
			    </c:if>
            </tr>
          </c:forEach>
        </table>
      </div>
      <button type="button" class="btn btn-sm btn-warning pull-right" onclick="if(confirm('전체 삭제하시겠습니까?')){memberDeleteClick();}">
        삭제
      </button>
			
</table>
</div>
</div>
</div>
</div>
</div>
</div>




        <div class="overlay"></div>


        <!-- jQuery CDN -->
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <!-- Bootstrap Js CDN -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- jQuery Custom Scroller CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

        <script type="text/javascript">
            
            $(document).ready(function() {
            	  $("#checkall").click(function() {
            	    if ($(this).prop("checked")) {
            	      $("input[name=chk]").prop("checked", true);
            	    } else {
            	      $("input[name=chk]").prop("checked", false);
            	    }
            	  });
            	});
            
            
            function memberDel(idx) {
            	
            }
        </script>
</body>
</html>
