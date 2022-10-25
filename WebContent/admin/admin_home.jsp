<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp"/>
		<c:set var="admin_id" value="${admin_id }"/>
		<c:set var="admin_name" value="${admin_name }"/>
		${admin_name }님 환영합니다!
		
		<a href="<%=request.getContextPath() %>/admin_control.do">회원 관리 및 삭제</a>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
</html>