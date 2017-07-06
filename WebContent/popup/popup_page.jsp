<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	//쿠키에 저장된 아이디를 담을 변수
	String savedId="";
	String savedPwd="";
	//request 객체에 담겨서 전달된 쿠키 목록을 읽어온다.
	Cookie[] cookies=request.getCookies();
	
	
	if(cookies != null && cookies.length >0){
		for(Cookie tmp:cookies){
			if(tmp.getName().equals("savedID")){
				//쿠키 value 를 읽어와서 변수에 담는다.
				savedId=tmp.getValue();
				
			}
		}
	}
	
%>	

<html>
<head>
<meta charset="UTF-8">
<title>member/popup/popup_page.html</title>
<link rel="stylesheet" href="../resource/css/bootstrap.css"/>
<style>
body{
	margin-left:80px
}
</style>
</head>
<body>
<h3>로그인 페이지</h3>
<form action="loginresult.jsp" method="post">
	<div class="form-group">
	<label for="id">아이디 &nbsp  &nbsp </label>
	<input type="text" name="id" id="id" value="<%=savedId %>"/><br />
	
	<label for="pwd">비밀번호</label>
	<input type="password" name="pwd" /><br />
	
	<label>
	
	<input type="checkbox" name="isSave" value="yes" />
	아이디저장</label>
	<label>
	
	</div>
	<button class="btn btn-primary" type="submit">    로그인    </button>
	
</form>

<form action="">
	<a href="javascript:signUpBtn_click()" style="margin-right:20px;">회원가입</a>
	<a href="javascript:findBtn_click()">아이디/비밀번호 찾기</a>
</form>

<script>
function signUpBtn_click() {
	opener.location.href='../member/agreeInfo.jsp'; 
	window.close();
}
function findBtn_click() {
	opener.location.href='../member/findId.jsp'; 
	window.close();
}
</script>
</body>
</html>