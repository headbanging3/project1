<%@page import="java.util.List"%>
<%@page import="p_memberdao.p_memberDao"%>
<%@page import="p_memberdto.p_memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	p_memberDao dao = p_memberDao.getInstance();

	List<p_memberDto> list = dao.getList();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="menu.jsp"/>
<body>
<h3></h3>
	<table border="1">
		<thead>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>주소</th>
			<th>가입날짜</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		</thead>
		
		<tbody>
		<% for(p_memberDto tmp : list) { %>
			<tr>
				<td><%=tmp.getMem_num() %></td>
				<td><%=tmp.getId() %></td>
				<td><%=tmp.getPwd() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getPhone() %></td>
				<td><%=tmp.getEmail() %></td>
				<td><%=tmp.getAddr() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><a href="updateform.jsp?num=<%=tmp.getMem_num()%>">수정</a></td>
				<td><a href="">삭제</a></td>
			</tr>
		<%} %>
		</tbody>
		</table>
</body>
</html>