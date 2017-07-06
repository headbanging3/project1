<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cPath=request.getContextPath();
	System.out.println(cPath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,600,700' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="../resource/css/reset.css"> <!-- CSS reset -->
<link rel="stylesheet" href="../resource/css/style.css"> <!-- Resource style -->
<script src="../resource/js/modernizr.js"></script> <!-- Modernizr -->
<title>나의 문의 내역입니다.</title>

</head>
<body>
<jsp:include page="../index_navbar.jsp"></jsp:include>
<nav id="cd-lateral-nav">
		<ul class="cd-navigation">
			<li class="item-has-children">
				<a href="#0">Services</a>
				<ul class="sub-menu">
					<li><a href="#0">Brand</a></li>
					<li><a href="#0">Web Apps</a></li>
					<li><a href="#0">Mobile Apps</a></li>
				</ul>
			</li> <!-- item-has-children -->

			<li class="item-has-children">
				<a href="#0">Products</a>
				<ul class="sub-menu">
					<li><a href="#0">Product 1</a></li>
					<li><a href="#0">Product 2</a></li>
					<li><a href="#0">Product 3</a></li>
					<li><a href="#0">Product 4</a></li>
					<li><a href="#0">Product 5</a></li>
				</ul>
			</li> <!-- item-has-children -->

			<li class="item-has-children">
				<a href="#0">Stockists</a>
				<ul class="sub-menu">
					<li><a href="#0">London</a></li>
					<li><a href="#0">New York</a></li>
					<li><a href="#0">Milan</a></li>
					<li><a href="#0">Paris</a></li>
				</ul>
			</li> <!-- item-has-children -->
		</ul> <!-- cd-navigation -->

		<ul class="cd-navigation cd-single-item-wrapper">
			<li><a href="#0">Tour</a></li>
			<li><a href="#0">Login</a></li>
			<li><a href="#0">Register</a></li>
			<li><a href="#0">Pricing</a></li>
			<li><a href="#0">Support</a></li>
		</ul> <!-- cd-single-item-wrapper -->

		<ul class="cd-navigation cd-single-item-wrapper">
			<li><a class="current" href="#0">Journal</a></li>
			<li><a href="#0">FAQ</a></li>
			<li><a href="#0">Terms &amp; Conditions</a></li>
			<li><a href="#0">Careers</a></li>
			<li><a href="#0">Students</a></li>
		</ul> <!-- cd-single-item-wrapper -->

		<div class="cd-navigation socials">
			<a class="cd-twitter cd-img-replace" href="#0">Twitter</a>
			<a class="cd-github cd-img-replace" href="#0">Git Hub</a>
			<a class="cd-facebook cd-img-replace" href="#0">Facebook</a>
			<a class="cd-google cd-img-replace" href="#0">Google Plus</a>
		</div> <!-- socials -->
	</nav>
<div id="contentsbox" class="container">
	<div class="jumbotron">
	  <h2> 나의 문의 내역 입니다.</h2>
	</div>
	
	<!-- table -->
	<div class="table-responsive">
		<table class="table table-striped table-hover">
			<thead>
				<tr class="info">
					<th>번호</th>
					<th>글 제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>asfsaf</td>
					<td>safsaf</td>
					<td>asfsaf</td>
					<td>safsaf</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="../resource/js/main.js"></script> <!-- Resource jQuery -->

</body>
</html>