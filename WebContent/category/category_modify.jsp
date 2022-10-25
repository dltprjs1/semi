<%@page import="com.category.medel.CategoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	CategoryDTO content = (CategoryDTO)request.getAttribute("content11");
	System.out.println(content.getCategory_code());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp" />
	<div align="center">
		<h3>카테고리 수정</h3>
		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/category_modify_Ok.do">
			<input type="hidden" name="category_num" value="<%=content.getCategory_num()%>">
			<table border="1" cellspacing="0" width="600">
						<tr>
							<th>카테고리 코드</th>
							<td><input name="category_code" value="<%=content.getCategory_code()%>"></td>
						</tr>
						<tr>
							<th>카테고리 이름</th>
							<td><input name="category_name" value="<%=content.getCategory_name()%>"></td>
						</tr>
						<tr>
							<th>카테고리 이미지</th>
							<td><input type="file" name="category_image"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="수정하기">
								<input type="reset">
							</td>
						</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>