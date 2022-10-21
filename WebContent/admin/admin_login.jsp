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
			action="<%=request.getContextPath()%>/admin_login_Ok.do">
			<table border="1" cellspacing="0" width="20%">
				<tr>
					<th>아이디</th>
					<td><input name="admin_id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="admin_pwd"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="로그인"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="<%=request.getContextPath()%>/admin_join.do">회원가입</a>&nbsp;&nbsp;&nbsp;
						<a href="<%=request.getContextPath()%>/admin_find_id.do">아이디찾기</a>&nbsp;&nbsp;&nbsp; 
						<a href="<%=request.getContextPath()%>/admin_find_pwd.do">비밀번호찾기</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>