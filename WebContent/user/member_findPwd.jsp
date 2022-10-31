<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린저스 : 아이디 찾기</title>
<style type="text/css">
	.error{
	display: none;
	}
</style>
<script type="text/javascript">

	$(function(){
		if("$(.text).val()==""){
			document.getElementById("a_div").style.display = "none";
			document.getElementById("b_div").style.display = "";
		}else{//조건 1이 아닐떄
			document.getElementById("a_div").style.display = "";
	        document.getElementById("b_div").style.display = "none";
		}
	})

</script>
</script>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp" />
	<div class="findPwd_container">
		<h2>비밀번호 찾기</h2>
		<article class="findPwd_content">
			<form class = "findPwd_form" action="<%=request.getContextPath() %>/member_findPwdAuth.do" method="post">
				<div class="textbox">
			  		<label for="text">이름</label>
			  		<input id="text" name="name" required="" type="text" />
			   		<div class="error" >이름을 입력하세요.  </div>
			 	</div>
			 	
				<div class="textbox">
			  		<label for="text">아이디</label>
			  		<input id="text" name="id" required="" type="text" />
			   		<div class="error">아이디를 입력하세요.  </div>
			 	</div>
			 	
			 	
				<div class="textbox">
			  		<label for="email">이메일</label>
			  		<input id="email" name="email" required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i" type="email" />
			  	<div class="error">유효하지 않은 이메일주소 입니다.  </div>
				</div><br><br>
			   	<input type="submit" id="check" value="비밀번호찾기">
			</form>
		</article>
	</div>
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>