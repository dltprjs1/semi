<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린저스 : 비밀번호 찾기</title>
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
		grid-template-rows: 100px 100px 50px 200px 50px;
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
		border-left: 1px solid lightgray;
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
		justify-self: right;
		grid-column: 2/3;
		grid-row: 3/4;	
	}
		
	.index_ul{
		
		padding: 0px;
		list-style: none;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		grid-template-rows: 50px;
		margin: 0px;		
	}
	
	.index_ul li{
		padding: 0px;
	
	}
	
	.findPwd_container h2{
		justify-self: center;
		grid-column: 2/3;;
		grid-row: 2/3;
	}
	
	.findPwd_content{
		grid-column: 2/3;;
		grid-row: 4/5;
		
	}
	
	.findPwd_content label{
		font-weight: bold;
		text-align: left;
	}
	
	.inputBox{
		margin: 0px;
		width: 300px;
		height: 50px;
		border: 1px solid lightgray;
		padding: 0px 0px 0px 15px;
		border-radius: 5px;
	}
	
	.form_area{
		grid-column: 2/3;
		grid-row: 2/3;	
		margin-bottom: 20px;	
	}

	.findPwd_btn{
		grid-column: 2/3;
		grid-row: 4/5;	
		width: 317.22px;
		height: 50px;	
		border: 0;
		color: white;
		font-size: 20px;
		font-weight: bold;
		background-color: #ff4d54;
		border-radius: 5px;
		cursor: pointer;
	}
	
	.error {
		color: red;
	}	


</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	
    $(function(){
    	$("#reqError1").hide();
    	
    	/* 공통 함수 start*/    	
    	// 에러메세지를 띄우는 함수
   		function showMsg(msgDiv,msg){
	        	msgDiv.text(msg);
	        	msgDiv.show();
   		} 	
    	
    	// 에러메세지를 숨기는 함수
   		function hideMsg(msgDiv){
	        	msgDiv.hide();     			
   		} 	
    	/* 공통함수 end */
    	
    	
    	// 입력창 포커스가 사라질 때 유효성 검사 함수 호출	
    	$("#idInput").blur(function() {
    		checkId();
    	});
	
  	
    	// 아이디 유효성 검사 함수
    	function checkId(){
        	let inputId = $("#idInput");
        	let msgDiv = $("#reqError");
        	let msg = "아이디를 입력하세요.";
        	
        	// 필수값 검사
    		if (inputId.val() == ""){	
    			showMsg(msgDiv,msg);
    		}else{
    			hideMsg(msgDiv);
    		}
    	}

</script>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp" />
	<div class="findPwd_container">
	
		<!-- 아이디 찾기/ 비밀번호 찾기 공통 영역 start-->
		<nav class="findPwd_top">
			<ul>
				<li class="findId"><a href="<%=request.getContextPath() %>/user/member_findId.jsp">아이디 찾기</a></li> 
				<li class="findPwd"><a href="#">비밀번호 찾기</a></li>
			</ul>
		</nav>
		<!-- 아이디 찾기/ 비밀번호 찾기 공통 영역 end-->
		
		<h2>비밀번호 찾기</h2>
		<div class="index">
			<ul class="index_ul">
				<li>01. 아이디 입력<span class="arrow">></span></li>
				<li>02. 본인 확인<span class="arrow">></span></li>
				<li>03. 비밀번호 재설정</li>
			</ul>
		</div>	
		<hr>
		<article class="findPwd_content">
		
			<form action="<%=request.getContextPath() %>/member_findPwdAuth.do" method="post">
				<div class="form_area">
			  		<label for="text">아이디</label>
			  		<br>
			  		<input class="inputBox" id="idInput" name="id" type="text" required />
			   		<div class="error" id="reqError"></div>
			 	</div>	
			 	<input type="submit" class="findPwd_btn" value="다음"> 	
			</form>
		</article>
	</div>
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>