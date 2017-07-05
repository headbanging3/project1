<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/bootstrap.min.css" />
<link rel="stylesheet" href="resource/css/custom.css" />
</head>
<body>
<!-- navbartop! -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index_navbar.jsp">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">회원가입/로그인</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">고객센터 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">BEST FAQ</a></li>
            <li><a href="#">상품문의</a></li>
            <li><a href="#">주문/결제</a></li>
            <li><a href="#">배송</a></li>
            <li><a href="#">주문 취소 및 교환</a></li>
            <li><a href="#">반품</a></li>
            <li class="divider"></li>
            <li><a href="#">문의하러 가기</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!-- navbartop end -->

<!-- navbarmiddle -->
<div class="btn-group btn-group-justified" role="group" aria-label="...">
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default">Left</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default">Middle</button>
  </div>
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default">Right</button>
  </div>
</div>
<!-- navbarmiddle end -->
<div class="jumbotron">
  <h3> 고객센터 페이지 입니다.</h3>
  <h1>무엇을 도와드릴까요?</h1>
  <p>...</p>
  <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
</div>

<!-- 이름, 이멜, 상담 내용 form -->
<div class="col-sm-8 col-sm-offset-2">
	<form action="">
		<div class="form-group">
			<label for="name" class="control-label"><strong>이름</strong></label>
			<input type="text" id="name" class="form-control" />
		</div>
		<div class="form-group">
			<label for="email"><strong>이메일</strong></label>
			<input type="email" id="email" class="form-control"/>
			<p class="help-block">답변 받을 이메일을 입력하세요.</p>
		</div>
		<strong>문의내용</strong><textarea class="form-control" rows="7"></textarea>
		<button type="submit" class="btn btn-default">제출</button>
	</form>
</div>

<script src="resource/js/jquery-3.2.0.js"></script>
<script src="resource/js/bootstrap.min.js"></script>
</body>
</html>