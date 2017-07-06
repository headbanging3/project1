<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키에 저장된 아이디를 담을 변수
	String savedId="";
	//request 객체에 담겨서 전달된 쿠키 목록을 읽어온다.
	Cookie[] cookies=request.getCookies();
	
	
	if(cookies != null && cookies.length >0){
		for(Cookie tmp:cookies){
			if(tmp.getName().equals("savedId")){
				//쿠키 value 를 읽어와서 변수에 담는다.
				savedId=tmp.getValue();
			}
		}
	}
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쿠키 테스트</title>
</head>
<body>

</body>
</html>