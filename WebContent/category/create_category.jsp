<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/admin_top.jsp" />
	<div align="center">
		<h3>카테고리 추가하기</h3>
		<br>
		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/create_category.do">
			<table border="1" cellspacing="0" width="500">
				<tr>
					<th>카테고리 코드</th>
					<td><input name="category_code"></td>
				</tr>
				<tr>
					<th>카테고리 이름</th>
					<td><input name="category_name"></td>
				</tr>
				<tr>
					<th>카테고리 이미지</th>
					<td><input type="file" name="category_image"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="추가하기"></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>