<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style type="text/css">

	.pagination {
		justify-content: center;
	}
	
</style>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp"/>
	<div align="center">
		<c:set var="list" value="${list }"/>
		<h3>회원 목록 전체 리스트</h3>
		<c:if test="${!empty list }">
				<table border="1" cellspacing="0" width="30%" align="center">
					<tr>
						<th>회원 번호</th>
						<th>회원 아이디</th>
						<th>회원 이름</th>
						<th>회원 레벨</th>
						<th>신고 누적 횟수</th>
						<th>회원 삭제</th>
					</tr>
			<c:forEach items="${list }" var="dto">
					<tr align="center">
						<td>${dto.mem_num }</td>
						<td>${dto.mem_id }</td>
						<td>${dto.mem_name }</td>
						<td>${dto.mem_level }</td>
						<td><a href="<%=request.getContextPath()%>/report_content.do?mem_id=${dto.mem_id}&page=${page}">${dto.mem_report_count }</a></td>
						<td><input type="button" onclick="location.href='<%=request.getContextPath()%>/admindelete.do?mem_id=${dto.mem_id }&page=${page }'" value="삭제하기"></td>
					</tr>
			</c:forEach>
				</table>
		</c:if>
	<nav>
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" 
		      		href="category_question.do?page=1">First</a>
		    </li>
		    <li>
		      <a class="page-link" 
		      		href="category_question.do?page=${page - 1 }">Previous</a>
		    </li>
		    <c:forEach begin="${startBlock }"
	       				end="${lastBlock }" var="i">
		      
		      <c:if test="${i == page }">
		         <li class="page-item active" aria-current="page">
		           <a class="page-link" href="category_question.do?page=${i }">${i }</a>
		         </li>
		      </c:if>
	      
		      <c:if test="${i != page }">
		         <li class="page-item">
		           <a class="page-link" href="category_question.do?page=${i }">${i }</a>
		         </li>
		      </c:if>
	   		</c:forEach>
		    
		    <c:if test="${lastBlock < allPage }">
		      <li class="page-item">
		      	<a class="page-link" href="category_question.do?page=${page + 1 }">Next</a>
		      </li>
		      <li class="page-item">
		      	<a class="page-link" href="category_question.do?page=${allPage }">End</a>
		      </li>
		    </c:if>
		  </ul>
		</nav>
	</div>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
</html>