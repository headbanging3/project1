<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/member/signup_form.jsp</title>
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
			<form action="signup.jsp" method=post id="signup">
				<div>
					<label for="id">* 아이디</label>
					<input type="text" name="id" id="id" placeholder="영문자 5~15자"/>
					<button type="button" id="idValid" class="btn btn-primary">중복확인</button>
				</div>
				<div>
					<label for="pwd">* 비밀번호</label>
					<input type="password" name="pwd" id="pwd" placeholder="영문자 5~15자"/><br />
				</div>
				<div>
					<label for="pwd2">* 비밀번호 확인</label>
					<input type="password" name="pwd2" id="pwd2"/><br />
				</div>
				<div>
					<label for="name">* 이름</label>
					<input type="text" name="name" id="name" /><br />
				</div>
				<div>
					<label for="phone">* 번호</label>
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
				<button type="button" id="cancel" class="btn btn-primary">취소</button>	
			</form>
		</div>
	
</div>
<script src="../resource/js/jquery-3.2.0.js"></script>
<script>
	var isValId=false;
	var isValPwd=false;

	$("#cancel").on("click",function(){

		location.href="../index.jsp";
	});
	
	var reg1= /^[a-zA-Z0-9]{4,14}$/;
	var reg2= /^[a-zA-Z0-9]{4,14}$/;
	
	
	$("#signup").on("submit",function(){
		var inputPwd=$("#pwd").val();
		var inputPwd2=$("#pwd2").val();
		var pwdMatching=reg2.test(inputPwd);
		if(pwdMatching && inputPwd==inputPwd2){
			isValPwd=true;
			console.log("isValPwd=true");
		}
		if(isValId==false){
			alert("아이디 중복환인을 눌러주세요");
			return false;
		}else if(isValPwd==false){
			alert("비밀번호를 확인해주세요");
			return false;
		}
	});
	
	$("#idValid").on("click",function(){
		var inputId=$("#id").val();
		var idMatching=reg1.test(inputId);
		console.log(idMatching);
		if(idMatching){
			alert("이용 가능합니다.");
			isValId=true;
			console.log("isValId=true");
		}else{
			alert("아이디 형식을 확인하세요");
			console.log("isValId=false");
			$("#id").focus();
		}
	});
</script>
</body>
</html>