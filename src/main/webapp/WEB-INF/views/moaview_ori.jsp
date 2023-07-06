<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>조금더 크게 보기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
 <style>
table {
  border-collapse: collapse;
  
}
th, td {
  border: 1px solid black;
  padding: 8px;
}
th:nth-child(3), td:nth-child(3) {
  width: 10%;
}
.title {
  background-color: lightgray;
}
.contents {
  background-color: lightgray;
}
.date {
  background-color: lightgray;
}

</style>
  <script type="text/javascript">
    $(document).ready(function() {
      $("#search").click(function() {
        var query = $("#searchBar").val();
        if(query=="") {
          alert("검색어를 입력하세요");
          return false;
        }

        $.ajax({
          url: "https://dapi.kakao.com/v2/search/web",
          headers: {"Authorization": "KakaoAK 19f74c8668226b9330c827f04e3b8e06"},
          type: "GET",
          data: {"query": query},
          dataType: "json",
          success: function(data) {
            var word="<table class='table table-hover'>";
            word+="<thead>";
            word+="<tr>";
            word+="<th class='title'>제목</th>";
            word+="<th class='contents'>내용</th>";
            word+="<th class='date'>작성일</th>";
            word+="</tr>";
            word+="</thead>";
            word+="<tbody>";
            $.each(data.documents,function(index, obj){
              var title = obj.title;
              var contents = obj.contents;
              var datetime = obj.datetime.split("T")[0]; 
              var url = obj.url;
              word+="<tr>";
              word+="<td><a href='"+url+"'>"+title+"</a></td>";
              word+="<td>"+contents.substring(200, 600)+"</td>";
              word+="<th>"+datetime+"</th>";
              word+="</tr>";

            });
            word+="</tbody>";
            word+="</table>";
            $("#searchList").html(word);
          },
          error: function() {
            alert("error");
          }
        });
      });
    });
  </script>
  
  
</head>
<body>

<div class="container">
  <h2>모아보기</h2>
  <p>더 쉽고 빠른 모아보기</p>
  <p>여러분들께 편리한 검색과 지차체마다 다른 정책들을 한눈에 보여드립니다.</p>
  <ul class="nav nav-pills">
  	<li class="active"><li><a data-toggle="pill" href="#Moa">Home</a></li>
    <li><a data-toggle="pill" href="#Moaview">모아보기</a></li>
    <li><a data-toggle="pill" href="#Searchview">웹사이트 검색</a></li>
  </ul>
  
  <div class="tab-content">
    <div id="Moa" class="tab-pane fade in active">
      <img src="${contextPath}/resources/images/mom.png" style="width:100%; height:100%;" />
    </div>
    <div id="Moaview" class="tab-pane fade">
    <br>
    <div style="border: 1px solid none;" width="auto"; padding="30px";>
      		<jsp:include page="moa.jsp"/>  
    </div>
    </div>
    	<div id="Searchview" class="tab-pane fade"  style="min-height : 500px; max-height: 1000px;">
	      <h3>Web SEARCH</h3>
	      <div class="input-group mb-3">
	      	<input id="searchBar" type="text" class="form-control" placeholder="검색어를 입력해주세요">
	      	<div class="input-group-append">
	      		<button id="search">검색</button>
	      	</div>
	      </div>
	      <div id="searchList" style="overflow: scroll; height: 500px; padding: 30px" >
	      이곳에 내용이 나타납니다!
	      </div>
    	</div>
  </div>
</div>

</body>
</html>



