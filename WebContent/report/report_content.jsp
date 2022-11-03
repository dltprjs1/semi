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
	<c:set var="list" value="${list }"/>
	<div align="center">
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
		<h3>${dto.mem_id_reported }님의 신고 내역</h3>
		<br>
		<table border="1" cellspacing="0">
			<tr>
				<th>신고번호</th>
				<td><input name="report_num" value="${ dto.report_num}"></td>
			</tr>
			<tr>
				<th>신고 누적 횟수</th>
				<td><input name="report_count" value="${dto.report_count }"></td>
			</tr>
			<tr>
				<th>챌린지</th>
				<td><input name="chall_title" value="${dto.chall_title }"></td>
			</tr>
			<tr>
				<th>신고 내용</th>
				<td><textarea rows="20" cols="100" name="report_content">${dto.report_content }</textarea></td>
			</tr>
			<tr>
				<th>신고 한 회원</th>
				<td><input name="mem_id_report" value="${ dto.mem_id_report}"></td>
			</tr>
		</table>
		<br>
		<br>
			</c:forEach>
		</c:if>
	</div>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
</html>