<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="p_memberdto.p_memberDto"/>
<jsp:setProperty property="*" name="dto"/> 
<%
	boolean isValid=p_memberDao.getInstance().isValid(dto);	

	//로그인후 리다일렉트 이동할 url 주소
	String url=request.getParameter("url");
	if(url==null){
		url=request.getContextPath();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginresult.jsp</title>
</head>
<body>


<% if(isValid){ 
	session.setAttribute("id", dto.getId()); %>
	<script>window.close();
	location.href="../index2_navbar.jsp"
	</script>
		 

<%}else{ %>
	
	<script>
		alert("아이디 비밀번호를 확인해 주세요");
		location.href="../popup/popup_page.html";
	</script>
<%} %>


</body>
</html>