<%@page import="p_memberdto.p_memberDto"%>
<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("memName");
	String email=request.getParameter("memEmail");
	p_memberDao dao=p_memberDao.getInstance();
	String id=dao.findId(name, email);
%>
{"id":"<%=id %>"}