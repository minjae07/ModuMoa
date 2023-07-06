<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>조금 더 크게 보기</title>
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
        
     $(document).on("click", ".page-btn", function() {
    	 $(".page-btn").removeClass("selected");
         $(this).addClass("selected");
         
         var page = $(this).attr("value");
         $("#search").trigger("click");
         
         
         
    	});
    	
    	
      $("#search").click(function() {
        var query = $("#searchBar").val();
        var sort = $("input[name='sort']:checked").val();
        var page = $(".page-btn.selected").attr("value");
        var iPerPage = 10;
        var startIdx = (page - 1) * iPerPage + 1;
        
        if(query=="") {
          alert("검색어를 입력하세요");
          return false;
        }

        $.ajax({
          url: "https://dapi.kakao.com/v2/search/web",
          headers: {"Authorization": "KakaoAK 19f74c8668226b9330c827f04e3b8e06"},
          type: "GET",
          data: {"query": query,
        	  	 "sort": sort,  
        	     "page": page
          },
          dataType: "json",
          success: function(data) {
            var word="<table class='table table-hover'>";
            word+="<thead>";
            word+="<tr>";
            word+="<th class='title'>번호</th>";
            word+="<th class='title'>제목</th>";
            word+="<th class='contents'>내용</th>";
            word+="<th class='date' >작성일</th>";
            word+="</tr>";
            word+="</thead>";
            word+="<tbody>";
            $.each(data.documents,function(index, obj){
              var title = obj.title;
              var contents = obj.contents;
              var datetime = obj.datetime.split("T")[0]; 
              var url = obj.url;
              var Index = startIdx + index;
              
              word+="<tr>";
              word+="<td style='width:4%;'class='index'>" + Index + "</td>";
              word+="<td style='width:18%;'><a href='"+url+"'>"+title+"</a></td>";
              word+="<td style='width:70%;'>"+contents.substring(0, 200)+"</td>";
              word+="<td style='width:8%;'>"+datetime+"</td>";
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

<div class="sidebar">

	      <h3 style="text-align:center;">빠른 검색</h3>
	      <div class="input-group mb-3" style="width: 100%;  display: flex; justify-content: center;" >
	      	<input id="searchBar" type="text" style="text-align:center; width: 50%;" placeholder="검색어를 입력해주세요">
	      	<div class="input-group-append">
	      		<button id="search" class="btn btn-sm btn-primary pull-right">검색</button>
	      	</div>
	      </div>
	      <div style="display: flex; justify-content: center;"> 
		      	<label>
					  <input type="radio" name="sort" value="accuracy" checked> 정확도순
					</label>
					<label>
					  <input type="radio" name="sort" value="recency"> 최신순
				</label>
			</div>
	      <table class="searchTbl">
	      <div id="searchList" style="overflow: scroll; height: 500px; padding: 30px; text-align:center;">
	      이곳에 내용이 나타납니다!
	      </div>
	      </table>
	       <div style="text-align: center">
			  <a class="page-btn selected" value="1">   1   </a>
			  <a class="page-btn" value="2">   2   </a>
			  <a class="page-btn" value="3">   3   </a>
			  <a class="page-btn" value="4">   4   </a>
			  <a class="page-btn" value="5">   5   </a>
			  <a class="page-btn" value="6">   6   </a>
			  <a class="page-btn" value="7">   7   </a>
			  <a class="page-btn" value="8">   8   </a>
			  <a class="page-btn" value="9">   9   </a>
			  <a class="page-btn" value="10">   10   </a>
			</div>
</div>

<a href="http://localhost:9080/quiVideo.do">동영상 검색</a>
<a href="http://localhost:9080/quiImage.do">이미지 검색</a>


</body>
</html>


