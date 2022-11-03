<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

	let rowsize = 12;
	let block = 10;
	let page = 1;
	
	if (page != 1) {
		page = Integer.parseInt(request.getParameter("page").trim());
	}
	
	let startNo = (page * rowsize) - (rowsize - 1);
	let lastNo = (page * rowsize);
	let startBlock = (((page - 1)/block)*block)+1;
	let lastBlock = (((page - 1)/block)*block)+block;
	let totalRecord = dao.getTotalRecord();
	let allPage = Math.ceil(totalRecord / rowsize);
	console.log(allPage);
	if(lastBlock > allPage) {
		lastBlock = allPage;
	}
	
	$(function(){
		$("#1").css('color','black');
		$("#2,#3,#4,#5,#6,#7,#8,#9,#10").css('color','lightgray');
		
		$("#2").click(function(){						// 인증
			$("#2").css('color','black');
			$("#1,#3,#4,#5,#6,#7,#8,#9").css('color','lightgray');
			$(".training,.eating,.life,.mind,.hobby,.environment,.etc,.study,.selfcare").show();
			$(".eating,.life,.mind,.hobby,.environment,.etc,.study,.selfcare").hide();
			$(".training").show();
		})
		$("#3").click(function(){						// 결제
			$("#3").css('color','black');
			$("#1,#2,#4,#5,#6,#7,#8,#9").css('color','lightgray');
			$(".training,.eating,.life,.mind,.hobby,.environment,.etc,.study,.selfcare").show();
			$(".training,.life,.mind,.hobby,.environment,.etc,.study,.selfcare").hide();
			$(".eating").show();
		})
		$("#4").click(function(){						// 상금
			$("#4").css('color','black');
			$("#1,#2,#3,#5,#6,#7,#8,#9").css('color','lightgray');
			$(".training,.eating,.life,.mind,.hobby,.environment,.etc,.study,.selfcare").show();
			$(".training,.eating,.mind,.hobby,.environment,.etc,.study,.selfcare").hide();
			$(".life").show();
		})
		$("#5").click(function(){						// 상금
			$("#5").css('color','black');
			$("#1,#2,#3,#4,#6,#7,#8,#9").css('color','lightgray');
			$(".training,.eating,.life,.mind,.hobby,.environment,.etc,.study,.selfcare").show();
			$(".training,.life,.life,.hobby,.environment,.etc,.study,.selfcare").hide();
			$(".mind").show();
		})
		$("#6").click(function(){						// 상금
			$("#6").css('color','black');
			$("#1,#2,#3,#5,#4,#7,#8,#9").css('color','lightgray');
			$(".training,.eating,.life,.mind,.hobby,.environment,.etc,.study,.selfcare").show();
			$(".training,.life,.mind,.mind,.environment,.etc,.study,.selfcare").hide();
			$(".hobby").show();
		})
		$("#7").click(function(){						// 상금
			$("#7").css('color','black');
			$("#1,#2,#3,#5,#6,#4,#8,#9").css('color','lightgray');
			$(".training,.eating,.life,.mind,.hobby,.environment,.etc,.study,.selfcare").show();
			$(".training,.life,.mind,.hobby,.hobby,.etc,.study,.selfcare").hide();
			$(".environment").show();
		})
		$("#8").click(function(){						// 상금
			$("#8").css('color','black');
			$("#1,#2,#3,#5,#6,#7,#4,#9").css('color','lightgray');
			$(".training,.eating,.life,.mind,.hobby,.environment,.etc,.study,.selfcare").show();
			$(".training,.life,.mind,.hobby,.environment,.environment,.study,.selfcare").hide();
			$(".etc").show();
		})
		$("#9").click(function(){						// 상금
			$("#9").css('color','black');
			$("#1,#2,#3,#5,#6,#7,#8,#4").css('color','lightgray');
			$(".training,.eating,.life,.mind,.hobby,.environment,.etc,.study,.selfcare").show();
			$(".training,.life,.mind,.hobby,.environment,.etc,.etc,.selfcare").hide();
			$(".study").show();
		})
		$("#10").click(function(){						// 상금
			$("#10").css('color','black');
			$("#1,#2,#3,#5,#6,#7,#8,#9").css('color','lightgray');
			$(".training,.eating,.life,.mind,.hobby,.environment,.etc,.study,.selfcare").show();
			$(".training,.life,.mind,.hobby,.environment,.etc,.etc,.study").hide();
			$(".selfcare").show();
		})
		$("#1").click(function(){
			$("#1").css('color','black');
			$("#2,#3,#4,#5,#6,#7,#8,#9,#10").css('color','lightgray');
			$(".training,.eating,.life,.mind,.hobby,.environment,.etc,.study,.selfcare").show();
		})
	});
</script>
<style type="text/css">
.pagination {
	justify-content: center;
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
	width: 100px;
}

.list li b {
	margin-left: 15px;
}

.h_underline {
	margin-top: 20px;
	border: solid;
	height: 3px;
}
.con{
	display: grid;
	grid-template-columns: 10% 80% 10%;
	grid-template-rows: 10% 80% 10%;
}
.all{
	width : 80%;
	height : 80%;
	grid-column: 2/3;
	grid-row: 2/3;
	display: grid;
	grid-template-columns: repeat(3,1fr);
	grid-template-rows: 250px 250px 250px 250px;
	
}
.all div{
	text-align: center;
}
.all div:hover{
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
}
.all div:hover .tkdtpqhrl{
	background-color: #519d9e;
    color: #9dc8c8;
}
.tkdtpqhrl{
	border: 3px solid #519d9e;
    color: darkgray;
	position: relative;
    padding: 7px 15px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
.tkdtpqhrl:hover{
	background-color: #519d9e;
    color: #9dc8c8;
}
.all h2 {
	color: black;
}
.block{
	display: block;
}
</style>
</head>
<body>
	<jsp:include page="../include/admin_top.jsp" />

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
					<a href="#"><li id="1"><b>전체<b>
									<div class="h_underline"></div></li></a>
					<a href="#"><li id="2"><b>운동<b>
									<div class="h_underline"></div></li></a>
					<a href="#"><li id="3"><b>식습관<b>
									<div class="h_underline"></div></li></a>
					<a href="#"><li id="4"><b>생활<b>
									<div class="h_underline"></div></li></a>
					<a href="#"><li id="5"><b>정서<b>
									<div class="h_underline"></div></li></a>
					<a href="#"><li id="6"><b>취미<b>
									<div class="h_underline"></div></li></a>
					<a href="#"><li id="7"><b>환경&펫<b>
									<div class="h_underline"></div></li></a>
					<a href="#"><li id="8"><b>기타<b>
									<div class="h_underline"></div></li></a>
					<a href="#"><li id="9"><b>공부<b>
									<div class="h_underline"></div></li></a>
					<a href="#"><li id="10"><b>셀프케어<b>
									<div class="h_underline"></div></li></a>
				</ul>
			</div>
		</div>
	<div class = "con">
	<c:set var="list" value="${list }" />
		<div class="all">
		<c:forEach items="${list }" var="dto">
			<c:if test="${dto.chall_category_code_fk eq 'C001' }">
				<div class="training">
				<a class="block" href="<%=request.getContextPath()%>/challenge_modify.do?chall_num=${dto.chall_num}&chall_category=운동&page=${page}"><img src="<%=request.getContextPath() %>/uploadFile/${dto.chall_mainimage }" width="64" height="54">
				<br><br>
				<h2>${dto.chall_title }</h2>
				<br>
				<span class="tkdtpqhrl"> 상세보기 + </span>
				</a>
				</div>
			</c:if>
			<c:set var="count" value="${count + 1 }" />
			<c:if test="${dto.chall_category_code_fk eq 'C002' }">
				<div class="eating">
				<a class="block" href="<%=request.getContextPath()%>/challenge_modify.do?chall_num=${dto.chall_num}&chall_category=식습관&page=${page}"><img src="<%=request.getContextPath() %>/uploadFile/${dto.chall_mainimage }" width="64" height="54">
				<br><br>
				<h2>${dto.chall_title }</h2>
				<br>
				<span class="tkdtpqhrl"> 상세보기 + </span>
				</a>
				</div>
			</c:if>
			<c:set var="count" value="${count + 1 }" />
			<c:if test="${dto.chall_category_code_fk eq 'C003' }">
				<div class="life">
				<a class="block" href="<%=request.getContextPath()%>/challenge_modify.do?chall_num=${dto.chall_num}&chall_category=생활&page=${page}"><img src="<%=request.getContextPath() %>/uploadFile/${dto.chall_mainimage }" width="64" height="54">
				<br><br>
				<h2>${dto.chall_title }</h2>
				<br>
				<span class="tkdtpqhrl"> 상세보기 + </span>
				</a>
				</div>
			</c:if>
			<c:set var="count" value="${count + 1 }" />
			<c:if test="${dto.chall_category_code_fk eq 'C004' }">
				<div class="mind">
				<a class="block" href="<%=request.getContextPath()%>/challenge_modify.do?chall_num=${dto.chall_num}&chall_category=정서&page=${page}"><img src="<%=request.getContextPath() %>/uploadFile/${dto.chall_mainimage }" width="64" height="54">
				<br><br>
				<h2>${dto.chall_title }</h2>
				<br>
				<span class="tkdtpqhrl"> 상세보기 + </span>
				</a>
				</div>
			</c:if>
			<c:set var="count" value="${count + 1 }" />
			<c:if test="${dto.chall_category_code_fk eq 'C005' }">
				<div class="hobby">
				<a class="block" href="<%=request.getContextPath()%>/challenge_modify.do?chall_num=${dto.chall_num}&chall_category=취미&page=${page}"><img src="<%=request.getContextPath() %>/uploadFile/${dto.chall_mainimage }" width="64" height="54">
				<br><br>
				<h2>${dto.chall_title }</h2>
				<br>
				<span class="tkdtpqhrl"> 상세보기 + </span>
				</a>
				</div>
			</c:if>
			<c:set var="count" value="${count + 1 }" />
			<c:if test="${dto.chall_category_code_fk eq 'C006' }">
				<div class="environment">
				<a class="block" href="<%=request.getContextPath()%>/challenge_modify.do?chall_num=${dto.chall_num}&chall_category=환경,펫&page=${page}"><img src="<%=request.getContextPath() %>/uploadFile/${dto.chall_mainimage }" width="64" height="54">
				<br><br>
				<h2>${dto.chall_title }</h2>
				<br>
				<span class="tkdtpqhrl"> 상세보기 + </span>
				</a>
				</div>
			</c:if>
			<c:set var="count" value="${count + 1 }" />
			<c:if test="${dto.chall_category_code_fk eq 'C007' }">
				<div class="etc">
				<a class="block" href="<%=request.getContextPath()%>/challenge_modify.do?chall_num=${dto.chall_num}&chall_category=기타&page=${page}"><img src="<%=request.getContextPath() %>/uploadFile/${dto.chall_mainimage }" width="64" height="54">
				<br><br>
				<h2>${dto.chall_title }</h2>
				<br>
				<span class="tkdtpqhrl"> 상세보기 + </span>
				</a>
				</div>
			</c:if>
			<c:set var="count" value="${count + 1 }" />
			<c:if test="${dto.chall_category_code_fk eq 'C008' }">
				<div class="study">
				<a class="block" href="<%=request.getContextPath()%>/challenge_modify.do?chall_num=${dto.chall_num}&chall_category=공부&page=${page}"><img src="<%=request.getContextPath() %>/uploadFile/${dto.chall_mainimage }" width="64" height="54">
				<br><br>
				<h2>${dto.chall_title }</h2>
				<br>
				<span class="tkdtpqhrl"> 상세보기 + </span>
				</a>
				</div>
			</c:if>
			<c:set var="count" value="${count + 1 }" />
			<c:if test="${dto.chall_category_code_fk eq 'C009' }">
				<div class="selfcare">
				<a class="block" href="<%=request.getContextPath()%>/challenge_modify.do?chall_num=${dto.chall_num}&chall_category=자기관리&page=${page}"><img src="<%=request.getContextPath() %>/uploadFile/${dto.chall_mainimage }" width="64" height="54">
				<br><br>
				<h2>${dto.chall_title }</h2>
				<br>
				<span class="tkdtpqhrl"> 상세보기 + </span>
				</a>
				</div>
			</c:if>
		</c:forEach>
	</ul>
	</div>
	</div>
	<br><br><br><br>
	<nav>
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" 
		      		href="challenge_control.do?page=1">First</a>
		    </li>
		    <li>
		      <a class="page-link" 
		      		href="challenge_control.do?page=${page - 1 }">Previous</a>
		    </li>
		    <c:forEach begin="${startBlock }"
	       				end="${lastBlock }" var="i">
		      
		      <c:if test="${i == page }">
		         <li class="page-item active" aria-current="page">
		           <a class="page-link" href="challenge_control.do?page=${i }">${i }</a>
		         </li>
		      </c:if>
	      
		      <c:if test="${i != page }">
		         <li class="page-item">
		           <a class="page-link" href="challenge_control.do?page=${i }">${i }</a>
		         </li>
		      </c:if>
	   		</c:forEach>
		    
		    <c:if test="${lastBlock < allPage }">
		      <li class="page-item">
		      	<a class="page-link" href="challenge_control.do?page=${page + 1 }">Next</a>
		      </li>
		      <li class="page-item">
		      	<a class="page-link" href="challenge_control.do?page=${allPage }">End</a>
		      </li>
		    </c:if>
		  </ul>
		</nav>
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>