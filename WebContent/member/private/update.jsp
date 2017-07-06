
<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="p_memberdto.p_memberDto"/> 
<jsp:setProperty property="*" name="dto"/>   
<%
	//UsersDto 객체에  담긴 내용을 이용해서 수정 반영한다.
	p_memberDao.getInstance().update(dto);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>
<p><%=dto.getId() %> 회원님 정보를 수정했습니다.</p>
<a href="info.jsp">확인</a>
</body>
</html>