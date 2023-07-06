<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/7dc8c16daa.js" crossorigin="anonymous"></script>
<style>
* {padding:0;margin:0;}
input[id="menuicon"] {display:none;}
input[id="menuicon"] + ul {display:block;position:fixed;right:0;top:50%;transform:translateY(-50%);transition:all .35s;text-align:right;}
input[id="menuicon"] + ul > li {display:block;width:50px;height:50px;border:1px solid #f1f1f1;position:relative;margin-top:-1px;}
input[id="menuicon"] + ul > li > a {display:block;width:auto;height:50px;overflow:hidden;transition:all .35s;}
input[id="menuicon"] + ul > li > label {display:block;cursor:pointer;width:auto;height:50px;background:#dadada;}
input[id="menuicon"] + ul > li:nth-child(1) label span {display:block;position:absolute;width:50%;height:3px;border-radius:30px;background:#333;transition:all .35s;}
input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(1) {top:30%;left:50%;transform:translateX(-50%);}
input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(2) {top:50%;left:50%;transform:translate(-50%,-50%);}
input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(3) {bottom:30%;left:50%;transform:translateX(-50%);}
input[id="menuicon"] + ul > li:nth-child(2) a .icon {background:url('./img/search.png') center center no-repeat;background-size:50%;display:inline-block;width:50px;height:50px;vertical-align:middle;}
input[id="menuicon"] + ul > li:nth-child(3) a .icon {background:url('./img/sand-clock.png') center center no-repeat;background-size:50%;display:inline-block;width:50px;height:50px;vertical-align:middle;}
input[id="menuicon"]:checked + ul {z-index:2;right:300px;}
input[id="menuicon"]:checked + ul > li:nth-child(1) label {z-index:2;right:300px;}
input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(1) {top:50%;left:50%;transform:translate(-50%,-50%) rotate(45deg);}
input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(3) {bottom:50%;left:50%;transform:translate(-50%,50%) rotate(-45deg);}
div[class="sidebar"] {width:300px;height:100%;background:#f5f5f5;position:fixed;top:0;right:-300px;z-index:1;transition:all .35s;}
input[id="menuicon"]:checked + ul + div {right:0;}

table.searchTbl {
  border-collapse: collapse;
  
}
table.searchTbl th {
  border: 1px solid black;
  padding: 8px;
}
table.searchTbl td {
  border: 1px solid black;
  padding: 8px;
}
table.searchTbl th:nth-child(3) {
  width: 10%;
}
table.searchTbl td:nth-child(3) {
  width: 10%;
}
table.searchTbl title {
  background-color: lightgray;
}
table.searchTbl contents {
  background-color: lightgray;
}
table.searchTbl date {
  background-color: lightgray;
}
</style>
</head>
<body>

<input type="checkbox" id="menuicon">
<ul>
	<li>
		<label for="menuicon">
			<span></span><span></span><span></span>
		</label>
	</li>
</ul>

<div class="sidebar">

	      <h3 style="text-align:center;">빠른 검색</h3>
	      <div class="input-group mb-3" style="display:table-cell; width:1%; vertical-align: middle;">
	      	<input id="searchBar" type="text" class="form-control" placeholder="검색어를 입력해주세요">
	      	<div class="input-group-append">
	      		<button id="search" class="btn btn-sm btn-primary pull-right">검색</button>
	      		<a onclick="openPop()">조금더 크게 보기</a>
	      		<label>
				  <input type="radio" name="sort" value="accuracy" checked> 정확도순
				</label>
				<label>
				  <input type="radio" name="sort" value="recency"> 최신순
				</label>
	      	</div>
	      </div>
	      <table class="searchTbl">
	      <div id="searchList" style="overflow: scroll; height: 500px; padding: 30px" >
	      이곳에 내용이 나타납니다!
	      </div>
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
	      </table>
</div>



<div class="panel-footer" style="text-align: center">
	    <p>Copyright © 2018 tcpschool.co.,Ltd. All rights reserved.</p>
	    <p>Contact webmaster for more information. 000-1234-5678</p>
</div>
</body>
</html>

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
            word+="<th class='title' colspan='2' style='text-align: center;'>내용</th>";
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
              word += "<td class='index'>" + Index + "</td>";
              word+="<td><a href='"+url+"'>"+title+"</a></td>";
              word+="</tr>";
              word += "<td colspan='2' style='text-align: center;'>" + datetime + "</td>";

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
    
    function openPop(){
      var popup = window.open('http://localhost:9080/quiSearch.do', '빠른 검색', 'width=1200px,height=800px,scrollbars=yes');
    }
  </script>