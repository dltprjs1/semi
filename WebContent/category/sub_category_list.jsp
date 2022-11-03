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
	<c:set var="sub" value="${sub_list }"/>
	<jsp:include page="../include/admin_top.jsp"/>
	<div align="center">
		<table border="1" cellspacing="0" width="500">
			<tr>
				<th>서브 카테고리 번호</th>
				<th>서브 카테고리 이름</th>
			</tr>
				<c:forEach items="${sub }" var="sub">
			<tr>
					<td>
						${sub.sub_category_num }
					</td>
					<td>
						${sub.sub_category_name }
					</td>
			</tr>
				</c:forEach>
		</table>
	</div>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
</html>