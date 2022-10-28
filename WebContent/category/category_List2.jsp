<%@page import="com.category.medel.CategoryDTO"%>
<%@page import="com.category.medel.SubDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

</head>
<body>
	<jsp:include page="../include/admin_top.jsp"/>
	<div align="center">
	<c:set var="list" value="${list }"/>
		<h3>카테고리 리스트</h3>
	<c:if test="${!empty list }">
		<c:forEach items="${list }" var="dto">
		<table border="1" cellspacing="0" width="600">
			<tr>
				<th>카테고리 번호</th>
				<th>카테고리 코드</th>
				<th>카테고리 이름</th>
				<th>카테고리 이미지</th>	
				<th>카테고리 삭제</th>			
			</tr>
					<tr>
						<td>
							${dto.category_num }
							<c:set var="category_num" value="${dto.category_num }"/>
						</td>
						<td>${dto.category_code }</td>
						<td>${dto.category_name }</td>
						<td >
						<form>
							<input type="hidden" name="category_num" value="${dto.category_num }">
							<img id="s_i" src="<%=request.getContextPath() %>/uploadFile/${dto.category_image }" width="100" height="100">
							<ul id="category">
								
							</ul>
						</form>
						</td>
						<td align="center">							
							<input type="button" value="수정" onclick="location.href='<%=request.getContextPath()%>/category_modify.do?category_num=${dto.category_num }'">
							<input type="button" value="삭제" onclick="location.href='<%=request.getContextPath()%>/category_delete.do?category_num=${dto.category_num }'">
						</td>
					</tr>
			<tr>
				<td colspan="6" align="center">
					<input type="button" value="카테고리 추가" onclick="location.href='<%=request.getContextPath()%>/category/create_category.jsp'">
				</td>
			</tr>
		</table>
				</c:forEach>	
			</c:if>
	</div>
	
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
<script type="text/javascript">
	
			
	$(document).ready(function(){
		$.ajaxSetup({
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post"
		});
		
		function sub(){
			$.ajax({
				url : "/Semi_Challengers/category/sub_category_ajax.jsp",
				data : {category_num : 1},
				datatype : "xml",
				success : function(data){
					let li = "";
					$(data).find("sub").each(function(){
						li += "<li>"+$(this).find("sub_category_name").text()+"</li>";
						$("#category").append(li);
					});
				},
				error : function(){
					alert('데이터 통신 에러')
				}
			});
		}
		
		
		$("#s_i").on("click",function(){
			sub();
		});
	});
	
</script>
</html>