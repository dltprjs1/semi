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
	<jsp:include page="../include/admin_top.jsp" />
	<div align="center">
		<b>챌린지 관리 페이지</b>


	<c:set var="list" value="${list }" />
		<div>
		<c:forEach items="${list }" var="dto">
			<c:set var="count" value="${count + 1 }" />
				<a href="<%=request.getContextPath()%>/challenge_modify.do?chall_num=${dto.chall_num}&page=${page}"><img src="<%=request.getContextPath() %>/uploadFile/${dto.chall_mainimage }" width="200" height="200"></a>
				${dto.chall_title }
				<c:if test="${count % 3 == 0 }">
					</div>
					<div>
				</c:if>
		</c:forEach>

	</div>
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>