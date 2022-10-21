<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp" />
	<div align="center">
		<c:set var="content" value="${content }" />
		<form method="post"
			action="<%=request.getContextPath() %>/mail_send2.do">
			<input type="hidden" name="name" value="${content.admin_name }">
			<input type="hidden" name="id" value="${content.admin_id }">
			<input type="hidden" name="email" value="${content.admin_email }">
			<input type="hidden" name="key" value="${key }">
			<table border="1" cellspacing="0">
				<tr>
					<th>이메일</th>
					<td>${content.admin_email }</td>
					<input type="submit" value="임시비밀번호받기">
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>