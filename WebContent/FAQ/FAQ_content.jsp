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
	<c:set var="content" value="${content }"/>
	<jsp:include page="../include/admin_top.jsp"/>
	<div align="center">
		<table border="1" cellspacing="0">
			<tr>
				<th>제 목</th>
				<td>${content.faq_title }</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<c:if test="${content.faq_category_num == 1}" >
						인증
					</c:if>
					<c:if test="${content.faq_category_num == 2}" >
						결제
					</c:if>
					<c:if test="${content.faq_category_num == 3}">
						상금
					</c:if>
				</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="20" cols="100" readonly>${content.faq_content }</textarea> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정하기" onclick="location.href='<%=request.getContextPath() %>/FAQ_modify.do?faq_num=${content.faq_num }&page=${page }'">
					<input type="button" value="삭제하기" onclick="location.href='<%=request.getContextPath() %>/FAQ_delete.do?faq_num=${content.faq_num }&page=${page }'">
					<input type="button" value="전체목록" onclick="location.href='<%=request.getContextPath() %>/FAQ_control.do?page=${page }'">
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
</html>