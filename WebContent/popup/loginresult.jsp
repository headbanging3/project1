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
	//폼전송 파라미터를 읽어온다.
		String id= request.getParameter("id");
		String pwd= request.getParameter("pwd");
		//아이디 저장 checkbox 를 체크 했으면 null 이 아니다.
		String isSave=request.getParameter("isSave");
		
		if(isSave != null){ // null이 아니면 쿠키를 응답해서 id 가 저장되도록
			//쿠키 객체를 생성
			Cookie cookie=new Cookie("savedID",id);
			
			//최대 유지시간 초단위로 설정
			cookie.setMaxAge(3600);
			//쿠키 응답 하기 
			response.addCookie(cookie);
		}
		
		session.setAttribute("savedID", id);
		
		String memberld=(String)session.getAttribute("savedId");
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

<% } else { %>
	
	<script>
		alert("아이디 비밀번호를 확인해 주세요");
		location.href="../popup/popup_page.jsp";
	</script>
<% } %>


</body>
</html>