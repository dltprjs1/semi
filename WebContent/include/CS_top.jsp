<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrp -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

</head>
<body>
<div id="CS_container"> 

	<div id="CS_left_aside">
			<div>
				<ul>
					<li><a href="<%=request.getContextPath()%>/CS_main.do">공지사항</a></li>
					<li><a href="<%=request.getContextPath()%>/CS_FAQ.do">FAQ</a></li>
					<li><a href="<%=request.getContextPath()%>/CS_privateQ.do">일대일문의</a></li>
				</ul>
			</div>
	</div>
	<div id="CS_content">