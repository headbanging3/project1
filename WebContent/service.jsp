<%@page import="p_memberdao.p_memberDao"%>
<%@page import="p_memberdto.p_memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에 저장된 회원의 아이디를 이용해서 회원정보를 얻어온다.
	String id=(String)session.getAttribute("id");
	p_memberDto dto=p_memberDao.getInstance().sergetData(id);
	String cPath=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/bootstrap.min.css" />
<link rel="stylesheet" href="resource/css/custom.css" />
</head>
<body>
<jsp:include page="index_navbar.jsp"></jsp:include>
<div class="jumbotron">
  <h3> 고객센터 페이지 입니다.</h3>
  <h1>무엇을 도와드릴까요?</h1>
  <!-- 로그인하지 않으면 로그인 버튼 생기게 -->
  <%if(id==null){%>
  	<p><a class="btn btn-primary btn-lg" href="javascript:showPopup()" role="button">로그인하러 가기</a></p>
  <%} else {%>
  	<p><a class="btn btn-primary btn-lg" href="service/" role="button">나의 문의 내역</a></p>
  <%} %>
</div>

<!-- 이름, 이멜, 상담 내용 form -->
<div class="col-sm-8 col-sm-offset-2">
	<form action="service/ser_insert.jsp" method="post">
		<div class="form-group">
			<input type="hidden" id="mem_num" name="mem_num" 
			<%if(id!=null){ %>	
				value="<%=dto.getMem_num() %>"
			<%} else { %>
				value="<%=9999 %>"
			<%} %>/>
			<label for="name" class="control-label"><strong>이름</strong></label>
			<input type="text" id="name" name="name" class="form-control"
			<%if(id!=null) {%>
				value="<%=dto.getName() %>"
			<%} %>/>
		</div>
		<div class="form-group">
			<label for="email"><strong>이메일</strong></label>
			<input type="email" id="email" name="email" class="form-control" 
			<%if(id!=null) {%>
				value="<%=dto.getEmail() %>"
			<%} %>/>
			<p class="help-block">답변 받을 이메일을 입력하세요.</p>
		</div>
		<strong>문의내용</strong><textarea class="form-control" rows="7" id="s_content" name="s_content"></textarea>
		<button type="submit" class="btn btn-default">제출</button>
	</form>
</div>
<script src="resource/js/jquery-3.2.0.js"></script>
<script src="resource/js/bootstrap.min.js"></script>
<script>

 	//팝업 띄우는 함수 
	function showPopup(){
		window.open("<%=cPath%>/popup/popup_page.jsp","팝업창","width=400,height=300,top=100,left=100");
	}
</script>
</body>
</html>