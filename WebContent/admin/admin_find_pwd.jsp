<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp" />
	<div align="center">
		<form method="post"
			action="<%=request.getContextPath()%>/adminFindPwd.do">
			<table border="1" cellspacing="0">
				<tr>
					<th>이름</th>
					<td><input name="admin_name"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input name="admin_id"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="확인">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>