<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div id="CS_container"> 

	<div id="CS_leftSpace">
	&nbsp;
	</div>

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