<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.grid{
		display: grid;
		grid-template-columns : repeat(3,1fr);
		grid-template-rows : 300px 300px 300px;
	}
	
</style>
</head>
<body>
	<jsp:include page="../include/admin_top.jsp"/>
	<br><br><br>
	<div class="grid" align="center">
		<c:set var="admin_id" value="${admin_id }"/>
		<c:set var="admin_name" value="${admin_name }"/>
		
			<a id="1" href="<%=request.getContextPath() %>/admin_control.do"><img src="<%=request.getContextPath()%>/uploadFile/admin/회원관리_image.png" width="200" height="200"></a>
			<a id="2" href="<%=request.getContextPath() %>/category_control.do"><img src="<%=request.getContextPath()%>/uploadFile/admin/카테고리관리_image.png" width="200" height="200"></a>
			<a id="3" href="<%=request.getContextPath() %>/category_question.do"><img src="<%=request.getContextPath()%>/uploadFile/admin/1대1문의_image.png" width="200" height="200"></a>
			<a id="4" href="<%=request.getContextPath() %>/FAQ_control.do"><img src="<%=request.getContextPath()%>/uploadFile/admin/공지사항관리_image.png" width="200" height="200"></a>
			<a id="5" href="<%=request.getContextPath() %>/challenge_control.do"><img src="<%=request.getContextPath()%>/uploadFile/admin/챌린지관리_image.png" width="200" height="200"></a>
			<a id="6" href="<%=request.getContextPath() %>/challenge_control.do"><img src="<%=request.getContextPath()%>/uploadFile/admin/챌린지만들기_image.png" width="200" height="200"></a>
	</div>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
</html>