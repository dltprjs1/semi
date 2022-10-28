<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="dto" value="${dto }"/>
	<jsp:include page="../include/admin_top.jsp"/>
	<div align="center">
		<h3>공지사항 수정 폼 페이지</h3>
		<form method="post" action="<%=request.getContextPath() %>/FAQ_update.do">
		<input type="hidden" name="faq_num" value="${dto.faq_num }">
		<input type="hidden" name="page" value="${param.page }">
		<table border="1" cellspacing="0">
			<tr>
				<th>제 목</th>
				<td><textarea rows="1" cols="100" name="faq_title">${dto.faq_title }</textarea> </td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="faq_category_num">
						<option>:::카테고리 선택:::</option>
						<option value="1">인증</option>
						<option value="2">결제</option>
						<option value="3">상금</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="20" cols="100" name="faq_content">${dto.faq_content }</textarea> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
		</form>
	</div>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
</html>