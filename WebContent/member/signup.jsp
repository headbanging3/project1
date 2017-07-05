<%@page import="p_memberdto.p_memberDto"%>
<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//회원가입 버튼 클릭시 이뤄지는 jsp페이지
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String email=request.getParameter("email");
	String addr=request.getParameter("addr");
	
	p_memberDto dto=new p_memberDto();
	p_memberDao dao=p_memberDao.getInstance();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setName(name);
	dto.setPhone(phone);
	dto.setEmail(email);
	dto.setAddr(addr);
	boolean isSuccess=dao.insert(dto);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>signup.jsp</title>
</head>
<body>
<%if(isSuccess){ %>
<script>
	alert("회원가입을 축하드립니다.");
	location.href="../index.jsp";
</script>
<%}else{ %>
<script>
	alert("잘못된 접근입니다.");
	location.href="signup_form.jsp";
</script>
<%} %>
</body>
</html>