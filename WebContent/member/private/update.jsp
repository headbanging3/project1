
<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="p_memberdto.p_memberDto"/> 
<jsp:setProperty property="*" name="dto"/>   
<%
	
	p_memberDao.getInstance().update(dto);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>

<script>
	alert("<%=dto.getId() %> 회원님 정보를 수정했습니다.")
	location.href="info.jsp";
</script>

</body>
</html>