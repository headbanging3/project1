<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인정보 동의서</title>
<style>
	.container{
		margin: 0 auto;
		border: 1px solid red;
		text-align:center;
		padding-top:100px;
	}
	.container div{
		padding:20px;
	}
	label, input{
		margin:20px;
	}
	h3{
		padding-bottom:20px;
	}
</style>
</head>
<body>
<jsp:include page="../index_navbar.jsp"></jsp:include>
<div class="container">
	<div>
		<h3>개인정보 수집 동의</h3>
		<textarea name="agreeInfo1" id="agreeInfo1" cols="100" rows="10" disabled="disabled">
			개인정보 감사히 쓰겠습니다. 냠냠
		</textarea><br />
		<label for="agree1">개인정보 수집에 동의 합니다.</label>
		<input type="checkbox" id="agree1"/>
	</div>
	<div>
		<h3>개인정보 활용 동의</h3>
		<textarea name="agreeInfo2" id="agreeInfo2" cols="100" rows="10" disabled="disabled">
			개인정보 감사히 쓰겠습니다. 냠냠
		</textarea><br />
		<label for="agree2">개인정보 수집에 동의 합니다.</label>
		<input type="checkbox" id="agree2" />
	</div>
	<div>
		<button id="next" class="btn btn-primary">회원가입</button>
		<button id="cancel" class="btn btn-primary">돌아가기</button>
	</div>
</div>
<script src="../resource/js/jquery-3.2.0.js"></script>
<script>
	//회원가입 버튼 클릭시 checkbox가 체크 되었는지 확인
	$("#next").on("click", function(){
		var ag1=$("input:checkbox[id=agree1]").is(':checked');
		var ag2=$("input:checkbox[id=agree2]").is(':checked');
		if(ag1 && ag2){
			location.href="signup_form.jsp";
		}else{
			alert("개인정보 동의에 체크 해주세요.");
		}
	});
	//취소버튼 클릭시
	$("#cancel").on("click",function(){
		location.href="../index.jsp";
	});
</script>
</body>
</html>