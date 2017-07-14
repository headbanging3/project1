<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id =(String) session.getAttribute("id");
	String manager="hide";
	
	if(id==null)
		id="";
	
	
	if(id.equals("root"))
		manager = "";

%>    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	.hide {
		display:none;
	}
</style>

</head>
<body>
<jsp:include page="index_navbar.jsp"></jsp:include>

<div class="container">
	<h3>메인 페이지 입니다.</h3>
	<ul class="pagination">
		<li><a href="manager/">관리자페이지</a></li>
		<li class="<%=manager%>"><a href="user_page/index.jsp">유저페이지</a></li>
	</ul>
	
</div>




</body>
</html>