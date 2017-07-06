<%@page import="p_memberdao.p_memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//아이디 중복확인을 위한 ajax통신 페이지
 	String inputId=request.getParameter("id");
 	String id=p_memberDao.getInstance().isOverlab(inputId);
 %>
{"id":"<%=id %>"}