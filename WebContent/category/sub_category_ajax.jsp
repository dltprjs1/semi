<%@page import="com.chall.controller.ActionForward"%>
<%@page import="com.category.medel.SubDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.category.medel.CategoryDTO"%>
<%@page import="com.category.medel.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int category_num = Integer.parseInt(request.getParameter("category_num").trim());
	CategoryDAO dao = CategoryDAO.getInstance();
	String str = dao.getSubList(category_num);
	CategoryDTO content11 = dao.getCategoryContent(category_num);
	List<SubDTO> list = dao.getsub_list(category_num);
	request.setAttribute("content11",content11);
	request.setAttribute("list",list);
	ActionForward forward = new ActionForward();
	out.println(str);
%>
