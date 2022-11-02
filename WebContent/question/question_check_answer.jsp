<%@page import="com.question.model.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QuestionDTO content = (QuestionDTO)request.getAttribute("q_content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	$(function(){
		$(".top_li_5").hide(1000);
	})
	
</script>
<style type="text/css">
<style type="text/css">
	#container{
	background-color: #F6F7F9;
}
.header {
	background-color: #F6F7F9;
	height: 100%;
	padding: 60px 0px 30px;
}

.h_container_num {
	margin-left: 120px;
}

.h_container {
	margin-left: 120px;
	margin-top: 100px;
}

.h_container_cate {
	margin-left: 120px;
	margin-top: 100px;
}

.h_container_cont {
	margin-left: 120px;
	margin-top: 50px;
}

.h_container2 {
	border: none;
	width: 30px;
	display: inline-block;
	height: 66px;
	background-color: white;
	border-radius: 7px;
}
.ansdmlnum{
	width: 700px;
	height: 66px;
	font-size: 20px;
	border: none;
	border-radius: 7px;
	position: absolute;
}
.search {
	width: 700px;
	height: 66px;
	font-size: 20px;
	border: none;
	border-radius: 7px;
	position: absolute;
}

.category_name {
	width: 700px;
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
	margin-top: 100px;
}

.h_bottom {
	margin-left: 100px;
}

.list li {
	display: inline-block;
	width: 70px;
}

.list li b {
	margin-left: 15px;
}

.h_underline {
	margin-top: 20px;
	border: solid;
}

.cont {
	border: none;
	border-radius: 7px;
}
.btn{
	margin-left : 120px;
	position: relative;
	border: none;
	display: inline-block;
	padding: 15px 30px;
	border-radius: 7px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
	background-color: #519d9e;
	color: black;
}
.btn:hover{
	background-color: #77af9c;
	color: #d7fff1;
}
</style>
</head>
<body>
	<jsp:include page="../include/admin_top.jsp"/>
		<form method="post" action="question_update_check.do">
		<input type="hidden" name="p_q_num" value="<%=content.getP_q_num() %>">
		<input type="hidden" name="mem_id" value="${param.mem_id }">
		<div id="container">
		<div class="header">
				<div class="h_container_num">
					<h2>문의 번호</h2>
					<input class="ansdmlnum" value="<%=content.getP_q_num() %>" readonly>
				</div>
				<div class="h_container">
					<h2>제 목</h2>
					<input class="search" value="<%=content.getP_q_title()%>" readonly>
				</div>
				<div class="h_container_cate">
					<h2>카테고리</h2>
					<input class="category_name"value="<%=content.getP_q_category_num()%>" readonly>
				</div>
				<div class="header2"></div>
				<div class="h_container_cont">
					<h2>내 용</h2>
					<textarea class="cont" rows="20" cols="100" readonly><%=content.getP_q_content() %></textarea>
				</div>
				<div class="h_container_cont">
					<h2>답 변</h2>
					<textarea class="cont" rows="20" cols="100" name="p_q_answer_cont" readonly><%=content.getP_q_answer_cont() %></textarea>
				</div>
				<br>
				<br>
				<input class="btn" type="submit" value="확인">
			</div>
		</div>
		</form>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
</html>