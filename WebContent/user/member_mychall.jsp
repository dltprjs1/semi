<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린저스 : 나의 챌린지 현황</title>
<style type="text/css">
	
	.my_container{
		display: grid;
		grid-template-columns: 1fr 3fr 1fr;
		grid-template-rows: 1fr 1fr 1fr 4fr 1fr;
	}

	.mypage {
		grid-column: 2/3;
		grid-row: 1/2;
	}
		
	.my_navi{
		grid-column: 2/3;
		grid-row: 2/3;
	}
	
	.my_navi a {
		text-decoration: none;
		color: #fff;
	}
		
	.my_title{
		grid-column: 2/3;
		grid-row: 3/4;
		margin-top: 20px;
	}

	
	.my_navi ul {
		display: grid;
		grid-template-columns: repeat(4,1fr);
		grid-template-rows: 1fr;
		padding: 0px;
		align-items: center;
		background-color: #ff4d54;
	}
	
	.my_navi li {
		font-size: 18px;
		border-left: 1px solid lightgray;
		color: #fff;
		font-weight: bold;
	}
	
	.mypage_container h1 {
		font-size: 35px;
	}
	
	.mypage_container h2 {
		font-size: 20px;
	}
	
	.mychall_atricle {
		grid-column: 2/3;
		grid-row: 4/5;	
	}
	
	.mychall_ul{
		list-style: none;
		display: grid;
		place-items: center;
		grid-template-columns: 1fr 1fr 1fr;
		grid-template-rows: 1fr;
		padding: 0;
		margin: 20px 60px;
	}
	
	.mychall_ul li:nth-child(1)	{
		grid-column: 1/2;
		grid-row: 1/2;	
	}
	
	.mychall_ul li:nth-child(2)	{
		grid-column: 2/3;
		grid-row: 1/2;	
	}
	
	.mychall_ul li:nth-child(3)	{
		grid-column: 3/4;
		grid-row: 1/2;	
	}
	
	.mychall_ul li{
		padding: 9px 5px 5px 5px;
		margin: 15px;
		width: 100px;
		height: 40px;
		font-size: 20px;
		font-weight: bold;
		border-radius: 5px;	
		background-color: #ff4d54;
		
	}
	
	a {
		vertical-align: middle;
		text-decoration: none;
		color: white;
	}
	
</style>
<%
	int member_no = Integer.parseInt(request.getParameter("no"));

	System.out.println("mychall no >>> " + member_no);

%>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp" />
	<div align="center">
		
		<article class="my_container">
		
			<div class="mypage">
					<h1>마이페이지</h1>
			</div>
			
			<nav class="my_navi">
					<ul>
						<li><a href="<%=request.getContextPath() %>/member_mypage.do?no=<%=member_no %>">회원 정보 조회/수정</a></li>
						<li><a href="<%=request.getContextPath() %>/member_mychall.do?no=<%=member_no %>">나의 챌린지 현황</a></li>
						<li><a href="<%=request.getContextPath() %>/member_mymoney.do?no=<%=member_no %>">나의 예치금.상금</a></li>
						<li><a href="<%=request.getContextPath() %>/member_mylevel.do?no=<%=member_no %>">나의 레벨.배지</a></li>
					</ul>
			</nav>
			
			<div class="my_title">
				<h2>나의 챌린지 현황</h2>
			</div>
				
			<section class="mychall_atricle">
					<ul class="mychall_ul">
						<li><a href="<%=request.getContextPath()%>/member_myOngoingChall.do?no=<%=member_no %>">참가중</a></li>
						<li><a href="<%=request.getContextPath()%>/member_myCompleteChall.do?no=<%=member_no %>">완료</a></li>
						<li><a href="<%=request.getContextPath()%>/member_myCreateChall.do?no=<%=member_no %>">개설</a></li>
					</ul>
			</section>	
		</article>		
	</div>

	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>