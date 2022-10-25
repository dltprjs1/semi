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
	<div align="center">
		<h3>카테고리 리스트</h3>
		<c:set var="list" value="${list }"/>
		<table border="1" cellspacing="0" width="500">
			<tr>
				<th>카테고리 번호</th>
				<th>카테고리 코드</th>
				<th>카테고리 이름</th>
				<th>카테고리 이미지</th>	
				<th>카테고리 삭제</th>			
			</tr>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">					
					<tr>
						<td>${dto.category_num }</td>
						<td>${dto.category_code }</td>
						<td>${dto.category_name }</td>
						<td><img src="${dto.category_image }" width="100" height="100"></td>
						<td align="center"><input type="button" value="삭제" onclick="location.href='<%=request.getContextPath()%>/category_delete.do?category_num=${dto.category_num }'"></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5" align="center"><h3>카테고리가 존재하지 않습니다.</h3></td>
				</tr>
			</c:if>
			<tr>
				<td colspan="5" align="center">
					<input type="button" value="카테고리 추가" onclick="location.href='<%=request.getContextPath()%>/create_category.do'">
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
</html>