<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>
<h3>회원가입 페이지 입니다.</h3>
<div class="container">
	<form action="signup.jsp" method="post">
		<label for="id">아이디</label>
		<input type="text" name="id" id="id" /><br />
		<label for="pwd">비밀번호</label>
		<input type="password" name="pwd" id="pwd"/><br />
		<label for="name">이름</label>
		<input type="text" name="name" id="name" /><br />
		<label for="phone">번호</label>
		<input type="text" name="phone" id="phone" /><br />
		<label for="email">이메일</label>
		<input type="text" name="email" id="email" /><br />
		<label for="addr">주소</label>
		<input type="text" name="addr" id="addr" /><br />	
	</form>
</div>

</body>
</html>