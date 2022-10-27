<%@page import="com.user.model.UserDTO"%>
<%@page import="com.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	UserDTO user_content = (UserDTO)request.getAttribute("user_content");
%>
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
	#table td{
		text-align: center;
	}
	#table th{
		text-align: center;
	}
	
</style>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp" />
	<div align="center">
		<h3>1:1문의 리스트</h3>
		<br>
		<c:set var="list" value="${list }" />
		<c:set var="user_content" value="${user_content }"/>
		<table id="table" border="1" cellspacing="0" width="800">
			<tr>
				<th>문의 번호</th>
				<th>챌린지</th>
				<th>회원 아이디</th>
				<th>제 목</th>
				<th>등록일</th>
				<th>재등록</th>
				<th>답변유무</th>
			</tr>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.p_q_num }</td>
						<td>${dto.p_q_chall_num}</td>
						<td>${dto.p_q_user_num}</td>
						<td><a href="<%=request.getContextPath()%>/question_content.do?p_q_num=${dto.p_q_num}&page=${page}&p_q_user_num=${dto.p_q_user_num }">${dto.p_q_title}</a></td>
						<td>${dto.p_q_regdate}</td>
						<td>
							<c:if test="${dto.p_q_again_num != 0}">
							Yes
							</c:if>
							<c:if test="${dto.p_q_again_num == 0}">
							No
							</c:if>
						</td>
						<td>
							<c:if test="${dto.p_q_answer_num != 0}">
							Yes
							</c:if>
							<c:if test="${dto.p_q_answer_num == 0}">
							No
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
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
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>