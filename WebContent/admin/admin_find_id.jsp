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
	<jsp:include page="../include/chall_top.jsp" />
		<div align="center">
		<form method="post" action="<%=request.getContextPath() %>/admin_namecheck.do">
			<table border="1" cellspacing="0">
				<tr>
					<th>이름</th>
					<td>
						<input name="admin_name" id="admin_name">
						<input type="submit" value="확인" onclick="location.href='<%=request.getContextPath()%>/admin/admin_checkId.jsp'">
					</td>
				</tr>
				
			</table>
		</form>
		</div>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script> 
<script type="text/javascript">
</script>
</html>