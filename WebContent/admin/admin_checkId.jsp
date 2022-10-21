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
	<div align="center">
	<c:set var="content" value="${content }"/>
		<form method="post" action="<%=request.getContextPath() %>/mail.Send.do">
		<input type="hidden" name="email" value="${content.admin_email }">
		<input type="hidden" name="name" value="${content.admin_name }">
		<input type="hidden" name="id" value="${content.admin_id }">
			<table border="1" cellspacing="0">
				<c:if test="${!empty content }">
				<tr>
					<td>${content.admin_email }</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="인증메일 받기" >
					</td>
				</tr>
				</c:if>
				
				<c:if test="${empty content }">
				<tr>
					<td><h3>회원님의 아이디가 존재하지 않습니다.</h3></td>
				</tr>
				</c:if>
			</table>
		</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script> 
<script type="text/javascript">
</script>
</html>