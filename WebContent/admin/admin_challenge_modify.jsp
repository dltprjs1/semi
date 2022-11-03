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
	<jsp:include page="../include/admin_top.jsp"/>
		<c:set var="content" value="${content }"/>
		<table border="1" cellspacing="0" width="800">
			<tr>
				<th>공개/비공개</th>
				<td>
					<c:if test="${content.chall_open == 'open' }">
						공개
					</c:if>
					<c:if test="${content.chall_open != 'open' }">
						비공개
					</c:if>
				</td>
			</tr>
			<tr>
				<th>챌린지 제목</th>
				<td>${content.chall_title }</td>
			</tr>
			<tr>
				<th>챌린지 메인 이미지</th>
				<td>
					<img src="uploadFile/${content.chall_mainimage }">
				</td>
			</tr>
		</table>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
</html>