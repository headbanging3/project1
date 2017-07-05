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
		padding:20px;		
		width:500px;
		height:80px;
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
	#addr{
		width:400px;
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
					<label for="id">* 아이디 : </label>
					<input type="text" name="id" id="id"/>
					
					<button type="button" id="idValid" class="btn btn-primary">중복확인</button>
					<p id="id_help" class="help-block">영문자 5~15자</p>		
				</div>
				<div>
					<label for="pwd">* 비밀번호 : </label>
					<input type="password" name="pwd" id="pwd"/><br />
					<p id="pwd_help" class="help-block">최소 1개의 숫자 혹은 특수문자를 포함한 6~20자 사이</p>								
				</div>
				<div>
					<label for="pwd2">* 비밀번호 확인 : </label>
					<input type="password" name="pwd2" id="pwd2"/><br />
				</div>
				<div>
					<label for="name">* 이름 : </label>
					<input type="text" name="name" id="name" /><br />
				</div>
				<div>
					<label for="phone">* 번호 : </label>
					<input type="text" name="phone" id="phone" /><br />
				</div>
				<div>
					<label for="email">이메일 : </label>
					<input type="text" name="email" id="email" /><br />
				</div>
				<div>
					<label for="addr">주소 : </label>
					<input type="text" name="addr" id="addr" /><br />
				</div>
				<button type="submit" class="btn btn-primary">가입</button>
				<button type="button" id="cancel" class="btn btn-primary">취소</button>	
			</form>
		</div>
	
</div>
<script src="../resource/js/jquery-3.2.0.js"></script>
<script>
	//아이디와 비밀번호가 유효한지 확인을 위한 변수
	var isValId=false;
	var isValPwd=false;

	//취소 버튼 클릭시 index페이지로 이동
	$("#cancel").on("click",function(){
		location.href="../index.jsp";
	});
	
	//아이디 및 비밀번호 정규식
	var reg1= /^[a-zA-Z0-9]{4,14}$/;
	var reg2= /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
	
	//회원가입 버튼 클릭시 제출되는 버튼
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
	
	//중복확인 버튼 클릭시
	$("#idValid").on("click",function(){
		var inputId=$("#id").val();
		var idMatching=reg1.test(inputId);
		var isOverlab=false;
		//DB에 중복된 ID가 있는지 확인을 위한 ajax통신
		$.ajax({
			url:"overlab.jsp",
			method:"POST",
			data:{id:inputId},
			success:function(data){
				var obj=JSON.parse(data);
				if(inputId==obj.id){
					alert("아이디가 존재 합니다.");
					return false;
				}else{
					isOverlab=true;
					if(idMatching && isOverlab){
						alert("이용 가능합니다.");
						isValId=true;
					}else{
						alert("아이디 형식을 확인하세요");
						$("#id").focus();
					}
				}
			}
		});
	});
</script>
</body>
</html>