<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//비밀번호 찾기 클릭시 이뤄지는 ajax통신 페이지
	request.getParameter("utf-8");
	String id=request.getParameter("memId");
	String phone=request.getParameter("memPhone");
	p_memberDao dao=p_memberDao.getInstance();
	String pwd=dao.findPwd(id, phone);
%>
{"pwd":"<%=pwd %>"}