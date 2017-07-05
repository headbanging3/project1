<%@page import="p_memberdto.p_memberDto"%>
<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	p_memberDao dao = p_memberDao.getInstance();
	p_memberDto dto = dao.getData(num);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원 정보 수정</h3>
<form action="update.jsp" method="post">
	<input type="hidden" name="num" value="<%=dto.getMem_num()%>"/>
	번호 <input type="text" value="<%=dto.getMem_num()%>" disabled/><br/>
	이름 <input type="text" name="name" 
			value="<%=dto.getName()%>"/> <br/>
	아이디 <input type="text" name="id" 
			value="<%=dto.getId()%>"/> <br/>
	비밀번호 <input type="text" name="pwd" 
			value="<%=dto.getPwd()%>"/> <br/>
	핸드폰 <input type="text" name="phone" 
			value="<%=dto.getPhone()%>"/> <br/>
	이메일 <input type="text" name="email" 
			value="<%=dto.getEmail()%>"/> <br/>												
	주소 <input type="text" name="addr"
			value="<%=dto.getAddr()%>"/> <br/>
	<button type="submit">확인</button>	
</form>
</body>
</html>