<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String cPath = request.getContextPath();

	int num = Integer.parseInt(request.getParameter("num")); 

	
	p_memberDao dao = p_memberDao.getInstance();

	boolean isSuccess = dao.delete(num);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delete.jsp</title>
</head>
<body>
<script>
<%if(isSuccess) { %>
	alert("회원정보 삭제");
	location.href = "<%=cPath %>/manager/m_list.jsp";
<%} else { %>
	alert("실패");
	location.href = "<%=cPath %>/manager/m_list.jsp";
<%} %>
</script>
</body>
</html>