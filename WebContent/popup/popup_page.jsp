<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인후 리다일렉트 이동할 url 주소를 읽어온다.
	String url = request.getParameter("url");
	if(url==null){
		
		url=request.getContextPath();
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
<form action="loginresult.jsp?url=<%=url %>" method="post">
	<div class="form-group">
	<label for="id">아이디  </label>
	<input type="text" name="id" id="id" /><br />
	<label for="pwd">비밀번호</label>
	<input type="text" name="pwd" /><br />
	
	<label>
		<input type="checkbox" name="isSave" value="yes" />
	아이디저장</label>
	<label>
		<input type="checkbox" name="isSave2" value="yes" />
	로그인 상태유지</label><br />
	</div>
	<button class="btn btn-primary" type="submit">    로그인    </button>
	
</form>

<form action="">
	<button class="btn btn-defalt" id="btn" onclick="btn_click();">회원가입</button>
</form>

<script>
function btn_click() {
	opener.location.href='../member/signup_form.jsp'; 
	window.close();

}
</script>
</body>
</html>