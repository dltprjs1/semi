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
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#1").css('color','black');
		$("#2,#3").css('color','lightgray');
		
		$("#2").click(function(){						// 인증
			$("#2").css('color','black');
			$("#1,#3").css('color','lightgray');
			$(".ekqqusx").hide();
			$(".ekqquso").show();
		})
		$("#3").click(function(){						// 결제
			$("#3").css('color','black');
			$("#1,#2").css('color','lightgray');
			$(".ekqquso").hide();
			$(".ekqqusx").show();
		})
		$("#1").click(function(){
			$("#1").css('color','black');
			$("#2,#3").css('color','lightgray');
			$(".ekqquso,.ekqqusx").show();
		})
	});
</script>
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
	
.header {
	background-color: #F6F7F9;
	height: 247px;
	padding: 60px 0px 30px;
	
}

.h_container {
	margin-left: 120px;
}

.h_container2 {
	border: none;
	width: 30px;
	display: inline-block;
	height: 66px;
	background-color: white;
	border-radius: 7px;
}

.search {
	width: 350px;
	height: 66px;
	font-size: 20px;
	border: none;
	border-radius: 7px;
	position: absolute;
}

img {
	margin-top: 20px;
}

.header2 {
	background-color: #F6F7F9;
}

.h_bottom {
	margin-left: 100px;
}

.list li {
	display: inline-block;
	width: 87px;
}

.list li b {
	margin-left: 15px;
}

.h_underline {
	margin-top: 20px;
	border: solid;
	height: 3px;
}
.all {
	margin-left: 150px;
	font-size: 18px;
}

.all a {
	color: black;
	width: 200px;
}

.ekqquso , .ekqqusx {
	margin-top: 30px;
}
.ekqqus_title{
	display: inline-block;
	padding-right: 100px;
}
.ekqqus_title li{
	display: inline-block;
	width: 400px;
	font-weight: bold;
}

#oo , #xx{
	color: #787878;
}
</style>
</head>
<body>
	<jsp:include page="../include/admin_top.jsp" />
		<c:set var="list" value="${list }" />
		<c:set var="user_content" value="${user_content }"/>
		<div class="header">
			<div class="h_container">
				<h4>검색어를 입력해 주십시오.</h4>
				<div class="h_container2">
					<img .class="eee"
						src="https://chlngers.com/assets/svgs/icon-search-line-black.svg"
						width="30" height="30">
				</div>
				<input class="search" name="search">
			</div>
		</div>
		<div class="header2">
			<div class="h_bottom">
				<ul class="list">
					<a href="#"><li id="1"><b>전 체<b>
									<div class="h_underline"></div></li></a>
					<a href="#"><li id="2"><b>답 변 O<b>
									<div class="h_underline"></div></li></a>
					<a href="#"><li id="3"><b>답 변 X<b>
									<div class="h_underline"></div></li></a>
				</ul>
			</div>
		</div>
		<div class="all">
		<c:forEach items="${list }" var="dto">
			<div class="ekqqusx">
				<c:if test="${empty dto.p_q_answer_cont}">
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
				</c:if>
			</div>
		</c:forEach>
		<c:forEach items="${list }" var="dto">
			<div class="ekqquso">
				<c:if test="${!empty dto.p_q_answer_cont}">
					<b id="oo">${dto.p_q_num }</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
				</c:if>
			</div>
		</c:forEach>
		</div>
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
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>