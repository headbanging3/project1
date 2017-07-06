<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.container{
		margin: 0 auto;
		border: 5px solid #cecece;
		text-align:center;
		padding-top:100px;
	}
	h3{
		padding-bottom:30px;
	}
	.container div{
		padding:20px;
	}
	.container button{
		margin : 20px;
	}
</style>
</head>
<body>
<jsp:include page="../index_navbar.jsp"></jsp:include>
<div class="container">
	<div>
		<h3>아이디 찾기</h3>
		<label for="memName">이름 : </label>
		<input type="text" name="memName" id="memName" /><br />
		<label for="memEmail">이메일 : </label>
		<input type="text" name="memEmail" id="memEmail" /><br />
		<button type="submit" id="findIdBtn" class="btn btn-primary">찾기</button>
	</div>
	<div>
		<h3>비밀번호 찾기</h3>
		<label for="memId">아이디 : </label>
		<input type="text" name="memId" id="memId"/><br />
		<label for="memPhone">전화번호 : </label>
		<input type="text" name="memPhone" id="memPhone"/><br />
		<button id="findPwdBtn" class="btn btn-primary">찾기</button>
	</div>
</div>
<script src="../resource/js/jquery-3.2.0.js"></script>
<script>
	//아이디 찾기 버튼 클릭시
	$("#findIdBtn").on("click",function(){
		var memName=$("#memName").val();
		var memEmail=$("#memEmail").val();
		if(memName=="" || memEmail==""){
			alert("정보를 입력해주세요.");
			return false;
		}
		//data를 전달해서 유효값 불러오기
		$.ajax({
			url:"findIdAjax.jsp",
			method:"POST",
			data:{memName:memName,
					memEmail:memEmail},
			success:function(data){
				var obj=JSON.parse(data);
				if(obj.id=="null"){
					alert("찾는 아이디가 없습니다.");
				}else{
					alert(obj.id);	
				}
			}
		});
		$("#memName").val("");
		$("#memEmail").val("");
	});
	
	//비밀번호 찾기 버튼 클릭시
	$("#findPwdBtn").on("click",function(){
		var memId=$("#memId").val();
		var memPhone=$("#memPhone").val();
		if(memId=="" || memPhone==""){
			alert("정보를 입력해주세요.");
			return false;
		}
		//data를 전달해서 유효값 불러오기
		$.ajax({
			url:"findPwdAjax.jsp",
			method:"POST",
			data:{memId:memId,
					memPhone:memPhone},
			success:function(data){
				var obj=JSON.parse(data);
				if(obj.pwd==""){
					alert("아이디 또는 번호를 확인해주세요.");
				}else{
					alert(obj.pwd);	
				}
			}
		});
		$("#memId").val("");
		$("#memPhone").val("");
	});
</script>
</body>
</html>