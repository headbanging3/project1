<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="p_memberdao.p_memberDao"/> 
<jsp:setProperty property="*" name="dto"/>
<%
	//p_memberDao 객체에 담긴 내용을 이용해서 수정 반영한다.

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p></p>
<a href="info.jsp">확인</a>
</body>
</html>