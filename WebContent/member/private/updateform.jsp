<%@page import="p_memberdto.p_memberDto"%>
<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//p_memberDao 객체에 담긴 내용을 이용해서 수정 반영한다.
	String id=(String)session.getAttribute("id");
	p_memberDto dto=p_memberDao.getInstance().getData(id);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업데이트 폼</title>
</head>
<body>
	<h3>회원정보 수정 페이지 입니다.</h3>
<form action="update.jsp" method="post" id="updateForm">
	<input type="hidden" name="id" value="<%=id %>" />
	
	<label for="id">아이디</label>
	<input type="text" id="id" value="<%=id%>" 
		disabled="disabled"/><br />
	
	<label for="pwd">비밀번호</label>
	<input type="text" id="pwd"  
	value="<%=dto.getPwd() %>" />
	<br />
	
	<label for="pwd2">비밀번호 확인</label>
	<input type="text" name="pwd" id="pwd" 
	value="<%=dto.getPwd() %>" /> 
	<br />
	
	<label for="name">이름</label>
	<input type="text" name="name" id="name" 
	value="<%=dto.getName() %>" /> 
	<br />
	
	<label for="phone"> 전화번호 </label>
	<input type="text" name="phone" id="phone" 
	value="<%=dto.getPhone() %>" /> 
	<br />
	
	<label for="email">이메일 주소</label>
	<input type="text" name="email" id="email" 
	value="<%=dto.getEmail() %>" />
	<br />
	
	<label for="addr"> 주소 </label>
	<input type="text" name="addr" id="addr" 
	value="<%=dto.getAddr() %>" /> 
	<br />
	
	
	<button type="submit">수정 확인</button>
</form>

<script>
	document.querySelector("#updateForm")
	.addEventListener("submit",function(event){
		var inputPwd=document.querySelector("#pwd").value;
		var inputPwd2 = document.querySelector("#pwd2").value;
		if(inputPwd != inputPwd2){
			alert("비밀번호를 확인하세요");
			event.preventDefault();
		}
	});
</script>
</body>
</html>