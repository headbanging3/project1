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
		margin-top:60px;
		text-align:center;
	}

	#signForm{
		display:inline-block;
		padding :50px;
	}
	.form-group{
		padding:20px;		
		width:700px;
	}
	button{
		width:200px;
	}
	#idValid{
		width:80px;
	}
	#addr{
		width:600px;
	}
	.form-inline{
		margin-top:30px;
	}
</style>
</head>
<body>
<jsp:include page="../index_navbar.jsp"></jsp:include>
<div class="container">

	<div id="signForm" class="panel panel-default">
		 <div class="panel-heading">
          	<h1 class="panel-title">회원가입</h1>
        </div>
        	<form action="signup.jsp" class="form-inline" method=post id="signup">
				 <div class="form-group">	
				 	<label for="id">* 아이디 : </label>
					<input type="text" class="form-control" name="id" id="id" placeholder="영문자5~15자"/>
					<button type="button" id="idValid" class="btn btn-default">중복검색</button>
				</div>
				<div class="form-group">
					<label for="pwd">* 비밀번호 : </label>
					<input type="password" class="form-control" name="pwd" id="pwd"/><br />
					<p id="pwd_help" class="help-block">최소 1개의 숫자 혹은 특수문자를 포함한 6~20자 사이</p>								
				</div>
				<div class="form-group">
					<label for="pwd2">* 비밀번호 확인 : </label>
					<input type="password" class="form-control" name="pwd2" id="pwd2"/><br />
				</div>
				<div class="form-group">
					<label for="name">* 이름 : </label>
					<input type="text" class="form-control" name="name" id="name" /><br />
				</div>
				<div class="form-group">
					<label for="phone">* 번호 : </label>
					<input type="text" class="form-control" name="phone" id="phone" /><br />
				</div>
				<div class="form-group">
					<label for="email">이메일 : </label>
					<input type="text" class="form-control" name="email" id="email" />
				</div>
				<div class="form-group">
					<label for="addr">주소 : </label>
					<input type="text" class="form-control" name="addr" id="addr" /><br />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">가입</button>
					<button type="button" id="cancel" class="btn btn-primary">취소</button>
				</div>	
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