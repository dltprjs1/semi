<%@page import="com.cs.model.CScenterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    	int pq_user_no = Integer.parseInt(request.getParameter("pq_user_no").trim());
    	System.out.println(pq_user_no);
    
    	CScenterDAO dao = CScenterDAO.getinstance();
    	String str = dao.getPQList(pq_user_no);
    	
    	out.println(str);

    %>