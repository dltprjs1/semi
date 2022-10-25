<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린저스 : 회원가입</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

	<jsp:include page="../include/chall_top.jsp" />
		<div align="center">
			<article class="join_container">
				<h2>회원가입</h2>
				<!-- 회원번호,아이디,이름,비번,나이,연락처,주소,가입날짜,이메일 -->
				<form method="post" action="<%=request.getContextPath() %>/member_join_ok.do">
							
							<label class="left_title" for="id">아이디</label>
							<br>
							<input type="text" name="id" id="id">
							<br>
						
							<label class="left_title" for="pwd">비밀번호</label>
							<br>
							<input type="password" name="pwd" id="pwd">
							<br>
						
							<label class="left_title" for="pwd2">비밀번호 확인</label>
							<br>
							<input type="password"  name="pwd2" id="pwd2">
							<br>
						
							<label class="left_title" for="pwd2">이메일</label>
							<br>
							<input type="email"> @ <input type="email">
							<br>
						
							<label class="left_title" for="age">나이</label>
							<br>
							<input type="text" name="age" id="age">
							<br>
						
							<label class="left_title" for="phone">연락처</label>
							<br>
							<input type="text" name="phone" id="phone">
							<br>
								
								<select name="phone1">
									<option >010</option>
									<option >011</option>
								</select>
								-<input type="text" name="phone2">-<input type="text" name="phone3">
							
				<!--아이디 중복 확인 해야함. 비밀번호 일치 확인 해야함. -->
				</form>
		
			</article>
		</div>


	
	<jsp:include page="../include/chall_bottom.jsp" />
			
</body>
</html>