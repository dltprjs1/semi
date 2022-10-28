<%@page import="com.category.medel.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int category_num = Integer.parseInt(request.getParameter("category_num").trim());
	CategoryDAO dao = CategoryDAO.getInstance();
	String str = dao.getSubList(category_num);
	out.println(str);
%>
