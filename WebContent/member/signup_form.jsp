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
	#signForm div{
		padding:30px;
	}
	button{
		margin-left:30px;
		width:200px;
		
	}
	
	input{
		width:200px;
		height:30px;
	}
	#idValid{
		width:80px;
		margin-left:10px;
	}
</style>
</head>
<body>
<jsp:include page="../index_navbar.jsp"></jsp:include>
<div class="container">
<h3>회원가입</h3>
	<div id="signForm">
			<form action="signup.jsp" method="post" id="signup">
				<div>
					<label for="id">아이디</label>
					<input type="text" name="id" id="id" placeholder="영문자 5~15자"/>
					<button type="button" id="idValid" class="btn btn-primary">중복확인</button>
				</div>
				<div>
					<label for="pwd">비밀번호</label>
					<input type="password" name="pwd" id="pwd" placeholder="영문자 5~15자"/><br />
				</div>
				<div>
					<label for="name">이름</label>
					<input type="text" name="name" id="name" /><br />
				</div>
				<div>
					<label for="phone">번호</label>
					<input type="text" name="phone" id="phone" /><br />
				</div>
				<div>
					<label for="email">이메일</label>
					<input type="text" name="email" id="email" /><br />
				</div>
				<div>
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
	
	var reg1= /^[a-zA-Z0-9]{4,14}$/;
	var reg2= /^[a-zA-Z0-9]{4,14}$/;
	
	
	$("#signup").on("submit",function(){
		var inputId=$("#id").val();
		var inputPwd=$("pwd").val();
		
		var pwdMatching=reg2.test(inputPwd);
		
	});
	
	$("idValid").on("click",function(){
		var inputId=$("#id").val();
		var idMatching=reg1.test(inputId);
		if(idMatching){
			alert("이용 가능합니다.")
			return false;
		}else{
			alert("아이디 형식을 확인하세요");
			$("#id")focus();
			return false;
		}
	});
</script>
</body>
</html>