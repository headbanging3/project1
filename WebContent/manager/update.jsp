<%@page import="p_memberdao.p_memberDao"%>
<%@page import="p_memberdto.p_memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String cPath=request.getContextPath();

	//로그인후 리다일렉트 이동할 url 주소
	String url=request.getParameter("url");
	
	if(url==null){
		url=request.getContextPath();
	}
	

	// 수정할 회원의 정보를 읽어온다
   request.setCharacterEncoding("utf-8");
   int num=Integer.parseInt(request.getParameter("num"));
   String id=request.getParameter("id");
   String pwd=request.getParameter("pwd");
   String name=request.getParameter("name");
   String phone=request.getParameter("phone");
   String email=request.getParameter("email");
   String addr=request.getParameter("addr");
   String regdate = request.getParameter("regdate");
   //MemberDto객체에 담는다
   p_memberDto dto=new p_memberDto(num,id,pwd,name,phone,email,addr,regdate);
   p_memberDao dao= p_memberDao.getInstance();
   boolean isSuccess = dao.update1(dto);	
   
   
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update.jsp</title>
</head>
<body>
<% if(isSuccess) { %>
	<script>
		alert('<%=id%>' + " 회원정보 수정");
		location.href = "<%=cPath%>/manager/m_list.jsp";
	</script>
<%} else {%>
	<script>
		alert("수정 실패")
	</script>
<%} %>

</body>
</html>