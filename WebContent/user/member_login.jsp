<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린저스 : 로그인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script>

<script>
// JavaScript 키 : b3c649792fd4d054a8b60299da478e2d
// REST API 키 : 617a393522b6cb65ea54d2ed4350878e

	function kakaoLogin(){
	window.Kakao.init("b3c649792fd4d054a8b60299da478e2d");//발급받은 키 중 javascript키를 사용해준다.
	// Kakao.Auth.authorize() : 간편 로그인 실행하는 함수
	
		window.Kakao.Auth.login({
			scope: 'profile_nickname, account_email, gender, age_range',
			redirectUri: '${REDIRECT_URI}',
			nonce: '${NONCE}',
			success: function(authObj){
				console.log(authObj);
				
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: function(response){
						//사용자 정보를 가져오기.
						let account= response.kakao_account;
						$('#form-kakao-login input[name=email]').val(account.email);
						$('#form-kakao-login input[name=name]').val(account.profile.nickname);
						$('#form-kakao-login input[name=img]').val(account.profile.img);
						// 사용자 정보가 포함된 폼을 서버로 제출한다.
						document.querySelector('#form-kakao-login').submit();						
					},
					
					fail: function(error){
						// 경고창에 에러메시지 표시
						alert('카카오 로그인 처리 중 오류가 발생했습니다.');
					}
				}); // api request 끝
				
			},// success 결과.
			fail:function(error){
				// 경고창에 에러메시지 표시
				alert('카카오 로그인 처리 중 오류가 발생했습니다.');
			}// fail 결과.
		});
	}	// kakaoLogin() 함수 end

</script>
<style type="text/css">
	
	body {
	 width: 100vw;
	 height: 100vh;
	 margin : 0;
	}
	
	/* 하단 바 CSS (chall_bottom.jsp) */
	.foot_container {
		display: grid;
		grid-template-columns: 1fr 2fr 1fr;
		grid-template-rows: 50px;
		text-align: center;
	}
	
	.footer{
		grid-column: 2/3;
		grid-row: 1/2;	
		color: gray;
	}
	
	.footer a{
		color: gray;
	}
	
	/* 로그인 페이지 CSS */
	.log_container {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		grid-template-rows: 1fr	2fr	1fr;
		text-align: center;
	}
	
	a {
		text-decoration: none;
		color: black;
	}
	
	.log_header {
		grid-column: 2/3;
		grid-row: 1/2;
	}
	
	.log_content{
		display: grid;
		place-items: center;
		grid-column: 2/3;
		grid-row: 2/3;	
	}
	
	.log_form {
		display: grid;
		place-items: center;
		width : 500px;
		border : 1px solid gray;
		border-radius: 10px;
		padding: 20px;
		padding-top: 40px;
	}
	
	.login_title{
		font-size: 25px;
	}
	
	.input_text {
		border : 1px solid lightgray;
		width: 360px;
		height: 121.11px;	
	}
	
	.input_text1 {
		width: 350px;
		height: 50px;
		border : 0px;
		font-size: 16px;
		padding : 5px;
	}
	
	.input_text2 {
		width: 350px;
		height: 50px;
		border : 0px;
		border-top : 1px solid lightgray;
		font-size: 16px;
		padding : 5px;
	}	
	
	.input_btn{
		cursor: pointer;
		width: 350px; 
		height: 60px;
		border : 1px solid black;
		border-radius: 5px;
		background-color: #ff4d54;
		color: white;
		font-size: 18px;
		font-weight: bold;
	}
	
	.find_join{
		list-style: none;
		display: flex;
		justify-content: center;
		padding: 0;
	}
	
	.bar{
		color : lightgray;
	}
	
	.sns_login {
		list-style: none;
		padding: 0;
	}
	
	
</style>

</head>
<body>
	
	<div class="log_container">
		<header class="log_header">
			<br>
			<br>
			<br>
				<a href="<%=request.getContextPath() %>/main.do"> <img alt="챌린저스 로고" src="<%=request.getContextPath() %>/uploadFile/logo_standard.svg" width="250"> </a>
			<br>
			<br>
			<hr width="80%" color="#ff4d54">
			<h1 class="login_title">로그인</h1>
		</header>
		
		<article class="log_content">
				<form class="log_form" method="post" action="<%=request.getContextPath() %>/member_login_ok.do">
					<div class="input_text">
						<input class="input_text1" type="text" name="mem_id" placeholder=" 아이디">
						<br>
						<input class="input_text2" type="password" name="mem_pwd" placeholder=" 비밀번호">
					</div>
					<br>
					<br>
					<input class="input_btn" type="submit" value="로그인">
				</form>
	
				<ul class="find_join">
					<li><a href="<%=request.getContextPath() %>/member_find.do">비밀번호 찾기&nbsp;</a></li>
					<li><b class="bar">|</b><a href="<%=request.getContextPath() %>/member_find.do">&nbsp;아이디 찾기&nbsp;</a></li>
					<li><b class="bar">|</b><a href="<%=request.getContextPath() %>/member_join.do">&nbsp;회원가입</a></li>
				</ul>
				
				<ul class="sns_login">
					<li><a href="javascript:kakaoLogin();" ><img alt="카카오 로그인" src="<%=request.getContextPath() %>/uploadFile/kakao_login_medium_narrow.png"></a></li>
					<li><a href="">네이버로 시작</a></li>
				</ul>
				
				<form id="form-kakao-login" method="post" action="<%=request.getContextPath()%>/member_kakao_login_ok.do">
		    			<input type="hidden" name="name"/>
		    			<input type="hidden" name="email"/>
		    			<input type="hidden" name="img"/>					
				</form>
		</article>
	</div>