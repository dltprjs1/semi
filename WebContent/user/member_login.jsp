<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린저스 : 로그인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- <script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.min.js"></script> -->

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
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
  integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>
<script>
Kakao.init("b3c649792fd4d054a8b60299da478e2d"); //발급받은 키 중 javascript키를 사용해준다.
</script>
<script>
// JavaScript 키 : b3c649792fd4d054a8b60299da478e2d
// REST API 키 : 617a393522b6cb65ea54d2ed4350878e
/*
	function kakaoLogin(){
	window.Kakao.init("b3c649792fd4d054a8b60299da478e2d");//발급받은 키 중 javascript키를 사용해준다.
	// Kakao.Auth.authorize() : 간편 로그인 실행하는 함수
	
		window.Kakao.Auth.login({
			scope: 'profile_nickname , gender, account_email, birthday, profile_image',
			redirectUri: '${REDIRECT_URI}',
			serviceTerms: 'profile_nickname , gender, account_email, birthday, profile_image',
			nonce: '${NONCE}',
			success: function(authObj){
				console.log(authObj);
				
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: function(response){
						//카카오에서 사용자 정보 가져오기.
						let account= response.kakao_account;
						$('#form-kakao-login input[name=id]').val(account.profile_nickname);
						$('#form-kakao-login input[name=gender]').val(account.gender);
						$('#form-kakao-login input[name=email]').val(account.account_email);
						$('#form-kakao-login input[name=birth]').val(account.birthday);
						$('#form-kakao-login input[name=img]').val(account.profile_image);
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
*/


	// 카카오 로그인
	function kakaoLogin(){
		// 1. 카카오 간편 로그인 요청. (서비스 서버에서 인가 코드를 사용해 REST API로 토큰 받기를 요청하여 로그인을 완료)
		Kakao.Auth.authorize({
			// 인가 코드를 전달받을 서비스 서버의 URI(카카오 개발자 사이트에 등록)
			redirectUri: '${REDIRECT_URI}',	
			// 2-1 추가 항목 동의 받을 내용.
			scope: 'profile_nickname , gender, account_email, birthday, profile_image, openid',
			// 2-2 약관 선택해 동의 받기 요청 시 사용. scope와 동일하게 작성.
			serviceTerms: 'profile_nickname , gender, account_email, birthday, profile_image, openid',
			// 2-3 카카오 자동 로그인 기능.
			prompts: 'login',
			
/* 보안 관련 내용 나중에.	
			// state: 카카오 로그인 과정 중 동일한 값을 유지하는 임의의 문자열(정해진 형식 없음).
			// 각 사용자의 로그인 요청에 대한 state 값은 고유.(Cross-Site Request Forgery(CSRF) 공격을 방어하기 위함.)
			// 인가 코드 요청, 인가 코드 응답, 토큰 발급 요청의 state 값 일치 여부로 요청 및 응답 유효성 확인 가능.
			state: ,
			// 2-4 OpenID Connect ID 토큰 발급하기.
			// OpenID Connect(카카오 계정에 등록된 사용자 정보)를 통해 ID 토큰을 함께 발급받을 경우, ID 토큰 재생 공격을 방지하기 위해 사용
			// ID 토큰 유효성 검증 시 대조할 임의의 문자열(정해진 형식 없음)
			nonce: '${NONCE}',
*/			
		});
	// 간편 로그인 이외의 카카오 API(위의 2-1~2-4)를 클라이언트에서 JavaScript SDK로 호출하려면 액세스 토큰(Access token) 값을 할당해야 함. 
		// 2. 토큰 할당하기.(Kakao.Auth.setAccessToken() 함수를 호출해서 서비스 서버에서 전달받은 액세스 토큰 값을 JavaScript SDK에서 사용하도록 할당.) 
		Kakao.Auth.setAccessToken('${ACCESS_TOKEN}');
		// 3. 현재 로그인한 사용자의 카카오계정 정보를 불러오기.
		// url 값을 /v2/user/me로 지정해 Kakao.API.request() 함수를 호출
		Kakao.API.request({
			  url: '/v2/user/me',
			  data: {
				// 프로퍼티 키로 사용자 정보 요청. 특정 사용자 정보만 지정
			    property_keys: ['kakao_account.profile', 'kakao_account.name', 'kakao_account.email', 'kakao_account.birthday', 'kakao_account.gender'],
			  	// 프로퍼티스로 사용자 정보 저장.
			    properties: {
			        '${CUSTOM_PROPERTY_KEY}': '${CUSTOM_PROPERTY_VALUE}',
			      },
			  },
			})
			  .then(function(response) {
			    console.log(response);
			    document.location.href = "member_login.do";
			  })
			  .catch(function(error) {
			    console.log(error);
			  });
		
	}

</script>	
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
		    			<%-- 카카오 변수명 --%>
		    			<input type="hidden" name="id"/>			<%-- (profile_nickname(닉네임) --%>
		    			<input type="hidden" name="gender"/>		<%-- gender --%>
		    			<input type="hidden" name="email"/>			<%-- account_email --%>
		    			<input type="hidden" name="birth"/>			<%-- birthday --%>
		    			<input type="hidden" name="img"/>			<%-- profile_image --%>				
				</form>
		</article>
	</div>
	</body>
	
</html>
	