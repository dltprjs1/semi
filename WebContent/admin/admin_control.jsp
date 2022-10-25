<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp"/>
		<c:set var="list" value="${list }"/>
		<h3>회원 목록 전체 리스트</h3>
		<c:if test="${!empty list }">
				<table border="1" cellspacing="0" width="80%" align="center">
					<tr>
						<th>회원 번호</th>
						<th>회원 아이디</th>
						<th>회원 이름</th>
						<th>회원 레벨</th>
						<th>신고 누적 횟수</th>
						<th>회원 삭제</th>
					</tr>
			<c:forEach items="${list }" var="dto">
					<tr align="center">
						<td>${dto.mem_num }</td>
						<td>${dto.mem_id }</td>
						<td>${dto.mem_name }</td>
						<td>${dto.mem_level }</td>
						<td><a href="<%=request.getContextPath()%>/report_content.do?mem_id=${dto.mem_id}&page=${page}">${dto.mem_report_count }</a></td>
						<td><input type="button" onclick="location.href='<%=request.getContextPath()%>/admindelete.do?mem_id=${dto.mem_id }&page=${page }'" value="삭제하기"></td>
					</tr>
			</c:forEach>
				</table>
		</c:if>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
</html>