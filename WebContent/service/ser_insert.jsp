<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="p_memberdto.p_memberDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
	request.setCharacterEncoding("utf-8");
	int mem_num = Integer.parseInt(request.getParameter("mem_num"));
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String s_content =  request.getParameter("s_content");
	
	boolean isSuccess=p_memberDao.getInstance().serinsert(mem_num, s_content);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){%>
		<p>저장했습니다.</p>
		<a href="../index.jsp">홈으로가기</a>
	<%} else {%>
		<p>저장실패ㅠㅠ</p>
	<%} %>

</body>
</html>