<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_email = request.getParameter("email").trim();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린저스 : 비밀번호 찾기3</title>
<style type="text/css">

	body {
	 width: 100vw;
	 height: 100vh;
	 margin : 0;
	}	
	
	/* 비밀번호 찾기 페이지 공통 CSS start */
	/* 아이디/비밀번호 찾기 페이지 공통 위치 start */	
	.findPwd_container{
		display: grid;
		place-items: center;
		grid-template-columns: 1fr 2fr 1fr;
		grid-template-rows: 100px 50px 80px 300px 50px;
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
	.index_ul li:nth-child(3){
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

	.title_des{
		font-size: 14px;
		font-weight: normal;
		float: right;
	}	
	
	.findPwd_content{
		grid-column: 2/3;
		grid-row: 4/5;
		padding-top: 20px;
		border-top: 3px solid lightgray;
		
	}	/* 비밀번호 찾기 페이지 공통 CSS end */

	.input_label{
		font-size: 18px;
		font-weight: bold;
	}
	
	.inputBox{
		margin: 10px 0px 0px 0px;
		width: 400px;
		height: 50px;
		border: 1px solid lightgray;
		padding: 0px 0px 0px 15px;
		border-radius: 5px;
	}
	
	.form_area{
		grid-column: 2/3;
		grid-row: 2/3;	
	}
	
	.findPwdNext_btn_div{
		grid-column: 2/3;
		grid-row: 4/5;		
	}
	
	.rePwdOk_btn{
		margin-top: 20px;
		width: 417.22px;
		height: 50px;	
		border: 0;
		color: white;
		font-size: 20px;
		font-weight: bold;
		border-radius: 5px;
	    background-color: lightgray;
		
		/* 인증번호 확인 시 */
		/* background-color: #ff4d54; */
		/* cursor: pointer; */
	}	

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
$(function(){
	// 선택자 바꾸기~~~
	$(".error").hide();
	
	/* 공통 함수 start*/    	
	// 에러메세지를 띄우는 함수
	function showMsg(msgDiv,msg){
       	msgDiv.text(msg);
       	msgDiv.css('color','red');
       	msgDiv.show();
	} 	
	
	// 에러메세지를 숨기는 함수
	function hideMsg(msgDiv){
       	msgDiv.hide();     			
	} 	
	
   	// 필수값 검사하는 함수
   	function reqVal(inputId,msgDiv,msg){
		if (inputId.val() == ""){	
			showMsg(msgDiv,msg);
		}else{
			hideMsg(msgDiv);
		}
   	}	// reqVal() 함수 end
   	
   	// 유효성 에러 메세지 띄우는 함수.
    function showErrorMsg(obj, msg) {
        obj.attr("class", "error_next_box");	// 클래스 속성값 변경
        obj.html(msg);
        obj.show();
    }
   	
/*   	
   	// 입력창에 포커스 주는 함수
    function setFocusToInputObject(obj) {
        if(submitFlag) {
            submitFlag = false;
            obj.focus();
        }
    }	// setFocusToInputObject() 함수 end 
*/    

    // 입력창 아래에 성공 메세지 띄우는 함수.
    function showSuccessMsg(obj, msg) {
        obj.attr("class", "error_next_box green");
        obj.html(msg);
        obj.show();
    }	// showSuccessMsg() 함수 end
	
	/* 공통함수 end */
	
	
	// 입력창 포커스가 사라질 때 유효성 검사 함수 호출	
	$("#rePwdInput").blur(function() {
		checkRePwd();
	});
	
	$("#rePwdCheckInput").blur(function() {
		checkRePwdCheck();
	});
	
	
	// '비밀번호 재설정' 입력창 검사
	function checkRePwd(){
    	let inputId = $("#rePwdInput");
    	let msgDiv = $("#rePwdMsg");
    	let msg = "필수입력입니다.";
    	//let oMsg = $("#rePwdMsg");
    	
    	// 필수값 검사
		reqVal(inputId,msgDiv,msg);
   	
    	// 비밀번호 유효성 검사
    	let pwdReg = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
    	if( !pwdReg.test(inputId.val()) ){
    		showMsg(msgDiv,msg)
    		showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
    	}
    	
	}		
	
	// '비밀번호 재설정 확인' 입력창 검사
	function checkRePwdCheck(){
    	let inputId = $("#rePwdCheckInput");
    	let msgDiv = $("#rePwdCheckMsg");
    	let msg = "필수입력입니다.";
    	
    	// 필수값 검사
		reqVal(inputId,msgDiv,msg);
	}			
	
});

</script>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp" />
	<%--자바스크립트에서 필요한 값 히든--%>
	<input type="hidden" name="mem_id" id="mem_id" value="${param.get('id')}">
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
			<div class="form_area">
				<form>
			  		<label class="input_label" for="text">재설정 비밀번호</label><span class="title_des">재설정 할 비밀번호를 입력해 주세요.</span>
			  		<br>
			  		<input class="inputBox" id="rePwdInput" name="id" type="text" required />
			  		<div class="error" id="rePwdMsg"></div>
			  		<br>
			  		<br>
			  		<label class="input_label" for="text">재설정 비밀번호 확인</label><span class="title_des">한번 더 입력해 주세요.</span>
			  		<br>
			  		<input class="inputBox" id="rePwdCheckInput" name="id" type="text" required />
			  		<div class="error" id="rePwdCheckMsg"></div>
				 	<div class="findPwdNext_btn_div">
				 		<input type="submit" id="rePwdOk_btn" class="rePwdOk_btn" value="비밀번호 재설정" disabled="disabled">			
				 	</div>
		 		</form>
		 	</div>	
		</article>
	</div>
	
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>