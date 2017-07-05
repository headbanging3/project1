<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="p_memberdto.p_memberDto"/>
<jsp:setProperty property="*" name="dto"/> 
<%
	boolean isValid=p_memberDao.getInstance().isValid(dto);	
	String cPath=request.getContextPath();
	
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


<% 
	if(isValid){ 
		session.setAttribute("id", dto.getId());
		
%>
	<script>
			opener.location.reload();
		 	// 팝업을 끄는 함수
		 	self.close();
		 	
	</script>

<% }else{ %>
	<p>아이디 혹은 비밀번호가 틀립니다.</p>
	<script>
		location.href="../popup/popup_page.html"
	</script>
<% } %>


</body>
</html>