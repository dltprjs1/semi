<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	body {
	 width: 100vw;
	 height: 100vh;
	 margin : 0;
	}	
	
	/* 아이디/비밀번호 찾기 페이지 공통 위치 start */	
	.findPwd_container{
		display: grid;
		place-items: center;
		grid-template-columns: 1fr 2fr 1fr;
		grid-template-rows: 100px 50px 80px 200px 50px;
	}
	
	.findPwd_top{
		grid-column: 2/3;
		grid-row: 1/2;
		align-items: center;
	}
	
	.findPwd_top ul{
		display: inline-block;
		width: 100%;
		list-style: none;
		padding: 0px;
		margin: 0px;
		line-height: 50px;		
	}
	
	.findId {
		display: inline-block;
		width: 200px;
		height: 50px;
		text-align: center;
		
	}
	
	.findPwd {
		display: inline-block;
		width: 200px;
		height: 50px;
		text-align: center;
		background-color:#ff4d54;
		
	}
	
	.findPwd_top a{
		text-decoration: none;
		display:block;
		width: 200px;
		height: 50px;
		color: #000;
		font-size: 20px;
		
	}
	/* 아이디/비밀번호 찾기 페이지 공통 위치  end */
	
	.index{
		justify-self: center;
		grid-column: 2/3;
		grid-row: 2/3;	
		border-top: 3px solid lightgray;
	}
		
	.index_ul{
		
		padding: 0px;
		list-style: none;
		display: grid;
		grid-template-columns: 140px 120px 145px;
		grid-template-rows: 50px;
		margin: 0px;		
	}
	
	.index_ul li{
		padding: 0px;
	}
	
	/* 단계 별로 색상 주기 */
	.index_ul li:nth-child(2){
		color:#ff4d54;
	}
	
	.bar {
		font-size:30px;
		color: lightgray; 
	}	
		
	.arrow{
		color: lightgray;
		font-weight: bold;
	}	

	.find_title {
		grid-column: 2/3;
		grid-row: 3/4;
	}	
</style>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp" />
	
	<div class="findPwd_container">
	<!-- 아이디 찾기/ 비밀번호 찾기 공통 영역 start-->
		<nav class="findPwd_top">
			<ul>
				<li class="findId"><a href="<%=request.getContextPath() %>/user/member_findId.jsp">아이디 찾기</a></li> 
				<span class="bar">|</span>
				<li class="findPwd"><a href="#">비밀번호 찾기</a></li>
			</ul>
		</nav>
		<!-- 아이디 찾기/ 비밀번호 찾기 공통 영역 end-->
		<div class="index">
			<ul class="index_ul">
				<li>01. 아이디 입력<span class="arrow"> ></span></li>
				<li>02. 본인 확인<span class="arrow"> ></span></li>
				<li>03. 비밀번호 재설정</li>
			</ul>
		</div>	
		<h2 class="find_title">비밀번호 찾기</h2>
		<hr>
		<article class="findPwd_content">
		</article>
	</div>
</body>
</html>