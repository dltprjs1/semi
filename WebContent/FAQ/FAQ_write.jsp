<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/admin_top.jsp"/>
	<div align="center">
		<form method="post" action="<%=request.getContextPath() %>/FAQ_insert.do">
			<table border="1" cellspacing="0">
				<tr>
					<th>공지사항 제목</th>
					<td>
						<input name="faq_title">
					</td>
				</tr>
				<tr>
					<th>공지사항 내용</th>
					<td>
						<textarea rows="20" cols="100" name="faq_content"></textarea>
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="faq_category">
							<option value="1">인증</option>
							<option value="2">결제</option>
							<option value="3">상금</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
</html>
