<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#2").css('color','black');
		$("#1,#3").css('color','lightgray');
	});
</script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/question/question.css">
</head>
<body>
	<jsp:include page="../../include/admin_top.jsp" />
	<jsp:include page="../include_question_search.jsp" />
		<div class="header2">
			<div class="h_bottom">
				<ul class="list">
					<a href="category_question.do"><li id="1"><b>전 체<b>
									<div class="h_underline"></div></li></a>
					<a href="answer_check_O.do"><li id="2"><b>답 변 O<b>
									<div class="h_underline"></div></li></a>
					<a href="answer_check_X.do"><li id="3"><b>답 변 X<b>
									<div class="h_underline"></div></li></a>
				</ul>
			</div>
		</div>
		<div class="asd"></div>
		<div class="body">
	<div class="all">
	<c:set var="list" value="${list }" />
	<c:forEach items="${list }" var="dto">
			<div class="ekqqusx">
					<b id="xx">${dto.p_q_num }</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<ul class="ekqqus_title">
						<li><a href="<%=request.getContextPath()%>/question_content.do?p_q_num=${dto.p_q_num}&page=${page}&p_q_user_num=${dto.p_q_user_num }">${dto.p_q_title}</a></li>
						<li>
							<c:if test="${!empty dto.p_q_answer_cont}">
								O
							</c:if>
							<c:if test="${empty dto.p_q_answer_cont}">
								X
							</c:if>
						</li>
					</ul>
				<br>
			</div>
		</c:forEach>
		</div>
		
		<nav>
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" 
		      		href="answer_check_X.do?page=1">First</a>
		    </li>
		    <li>
		      <a class="page-link" 
		      		href="answer_check_X.do?page=${page - 1 }">Previous</a>
		    </li>
		    <c:forEach begin="${startBlock }"
	       				end="${lastBlock }" var="i">
		      
		      <c:if test="${i == page }">
		         <li class="page-item active" aria-current="page">
		           <a class="page-link" href="answer_check_X.do?page=${i }">${i }</a>
		         </li>
		      </c:if>
	      
		      <c:if test="${i != page }">
		         <li class="page-item">
		           <a class="page-link" href="answer_check_X.do?page=${i }">${i }</a>
		         </li>
		      </c:if>
	   		</c:forEach>
		    
		    <c:if test="${lastBlock < allPage }">
		      <li class="page-item">
		      	<a class="page-link" href="answer_check_X.do?page=${page + 1 }">Next</a>
		      </li>
		      <li class="page-item">
		      	<a class="page-link" href="answer_check_X.do?page=${allPage }">End</a>
		      </li>
		    </c:if>
		  </ul>
		</nav>
		</div>
		<div class="pagination_search"></div>
		<jsp:include page="../../include/chall_bottom.jsp" />
</body>
</html>