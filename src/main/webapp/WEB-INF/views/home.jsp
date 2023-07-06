<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>모두모아</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="15">
<div class="container-fluid" "background-color:#2196F3;color:#fff;height:220px;">
  <h1>모두모아 커뮤니티</h1>
  <h3>다양한 정보와 검색 기능으로 모두가 함께하는 커뮤니티 사이트</h3>
</div>
<br> 

<div class="container">
  <div class="row">
    <nav class="col-sm-3" id="myScrollspy">
      <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="780">
        <li><a href="#section1">개발 배경</a></li>
        <li><a href="#section2">개발자의 이야기</a></li>
        <li><a href="#section3">모두 모아란?</a></li>
        <li><a href="#section4">자유 게시판</a></li>
         <li><a href="#section5">고객센터 게시판</a></li>
      </ul>
    </nav>
    <div class="col-sm-9">
      <div id="section1" class="visible-md visible-lg">    
        <h2>개발 배경</h2>
        <p><b>모두모아</b>는 사용자들이 다양한 주제에 대해 소통하고 정보를 공유할 수 있는 온라인 커뮤니티 플랫폼입니다. </p>
       <p>우리는 사회적인 연결과 지식 교류를 촉진할 수 있는 안전하고 개방적인 공간을 제공하기 위해 <b>모두모아</b>를 개발하였습니다. </p>
        <p>현대 사회에서 많은 사람들이 온라인 플랫폼을 통해 의견을 나누고 상호작용하는 가운데, <b>모두모아</b>를 통해 사용자들이 </p>
        <p>서로에게 영감을 주고 배울 수 있는 환경을 만들고자 했습니다.</p>
      </div>
      <div id="section2"> 
        <h2>개발자 이야기</h2>
        <p><b>모두모아</b>는 열정적인 개발자 팀에 의해 만들어졌습니다. </p>
        <p>우리 팀은 다양한 분야에서 전문적인 경험을 가지고 있으며, 사용자 경험과 기능 개선에 대한 열정을 가지고 있습니다. </p>
        <p>우리는 사용자들의 다양한 의견을 수렴하고 개발에 반영함으로써 커뮤니티의 성장과 발전을 위해 노력하고 있습니다. </p>
        <p>질문이나 개선 제안이 있으면 언제든지 고객센터를 통해 연락 주시기 바랍니다. </p>
        <p>우리는 항상 사용자들의 피드백을 듣고 더 나은 <b>모두모아</b>를 만들기 위해 노력하고자 합니다.</p>
      </div>        
      <div id="section3">
      	<h2>모두 모아란?</h2>
      	<p><b><b>모두모아</b></b>는 다양한 기능으로 여러분들께 도움이 되고자 합니다. </p>
      	<br>
      	<div id="section4">
      	<h4>자유 게시판</h4>
      	<p> 자유 게시판은 사용자들에게 자유로운 토론과 다양한 주제에 대한 의견을 나눌 수 있는 공간을 제공합니다. </p>
      	<p>이 게시판은 사회, 문화, 엔터테인먼트, 취미 등 어떤 주제든 자유롭게 토론하고 정보를 공유할 수 있는 장입니다.</p>
		<p>여기에서는 사용자들이 다양한 시각과 경험을 바탕으로 다양한 의견을 나누며, 새로운 아이디어를 발견하고 창조적인 토론을 </p>
		<p>진행할 수 있습니다. </p>
		<p>자유 게시판은 사회적 연결과 다양성을 존중하는 커뮤니티를 형성하기 위한 중요한 요소로서, 사용자들이 자유로운 의사소통과 </p>
		<p>상호작용을 즐길 수 있는 플랫폼입니다.</p>
		<br>
		
      	<div id="section5">
      	<h4>고객센터 게시판</h4>
      	<p>고객센터는 사용자들이 질문, 문제 또는 제안 사항을 제기할 수 있는 전담 공간입니다.</p>
      	<p>우리는 사용자들의 의견을 소중히 여기며, 그들의 요구에 신속하고 정확하게 대응하기 위해 최선을 다하고 있습니다.</p>
		<p>고객센터는 사용자들이 <b>모두모아</b>를 보다 원활하게 이용할 수 있도록 도움을 주고, 기술적인 문제나 서비스 관련 문의에 대한 </p>
		 <p>지원을 제공합니다.</p>
		<p>여기서 사용자들은 질문이나 문제를 제기할 수 있으며, 운영팀은 신속하게 답변을 드리고 필요한 지원을 제공합니다.</p>
		<p>고객센터는 사용자들과의 소통과 상호작용을 통해 커뮤니티의 발전을 위해 노력하는 중요한 역할을 수행하고 있습니다.</p>
		<p>우리는 항상 사용자들의 의견을 환영하며, 더 나은 <b>모두모아</b>를 만들기 위해 최선을 다하고 있습니다.</p>
      	<br>
      	<br>
      </div>
    </div>
  </div>
</div>
</body>
</html>
