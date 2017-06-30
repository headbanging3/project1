<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/member/signup_form.jsp</title>
<link rel="stylesheet" href="../resource/css/bootstrap.min.css" />
<style>
	.container{
		margin: 0 auto;
		border: 1px solid red;
		text-align:center;
		padding-top:100px;
		
	}
	#signForm{
		display:inline-block;
		padding :50px;
		
	}
	button{
		margin-left:30px;
		width:200px;
		
	}
	.form-group{
		padding :20px;
		width:300px;
	}
	input{
		width:200px;
		height:30px;
		marign-left:30px;
	}
</style>
</head>
<body>
<div class="container">
<h3>회원가입</h3>
	<div id="signForm">
			<form action="signup.jsp" method="post">
				<div class="form-group">
					<label for="id">아이디</label>
					<input type="text" name="id" id="id" /><br />
				</div>
				
				<div class="form-group">
					<label for="pwd">비밀번호</label>
					<input type="password" name="pwd" id="pwd"/><br />
				</div>
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" name="name" id="name" /><br />
				</div>
				<div class="form-group">
					<label for="phone">번호</label>
					<input type="text" name="phone" id="phone" /><br />
				</div>
				<div class="form-group">
					<label for="email">이메일</label>
					<input type="text" name="email" id="email" /><br />
				</div>
				<div class="form-group">
					<label for="addr">주소</label>
					<input type="text" name="addr" id="addr" /><br />
				</div>
				<button type="submit" class="btn btn-primary">가입</button>
				<button id="cancel" class="btn btn-primary">취소</button>	
			</form>
		</div>
		
	
	
</div>
<script src="../resource/js/jquery-3.2.0.js"></script>
<script>
	document.querySelector("cansel")
	.addEventListener(function(){
		location.href="../index.jsp";
	});
</script>
</body>
</html>