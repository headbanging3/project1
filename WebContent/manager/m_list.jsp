<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.List"%>
<%@page import="p_memberdao.p_memberDao"%>
<%@page import="p_memberdto.p_memberDto"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("EUC-KR");
	p_memberDao dao = p_memberDao.getInstance();

	List<p_memberDto> list = dao.getList();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>m_list.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<h3></h3>
<jsp:include page="menu.jsp"/>
  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid ">
     <table border="1" class="class="table table-striped table-bordered table-hover">
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
			<tr class="success">
				<td><%=tmp.getMem_num() %></td>
				<td><%=tmp.getId() %></td>
				<td><%=tmp.getPwd() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getPhone() %></td>
				<td><%=tmp.getEmail() %></td>
				<td><%=tmp.getAddr() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><a href="updateform.jsp?num=<%=tmp.getMem_num()%>">수정</a></td>
				<td><a href="delete.jsp?num=<%=tmp.getMem_num()%>">삭제</a></td>
			</tr>
		<%} %>
		</tbody>
		</table>
    </div>
  </div>
  <!-- /본문 -->
	
</body>
</html>