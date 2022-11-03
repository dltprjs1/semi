<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린저스 : 회원가입</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

// 주소 폼
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();

}

	// 선택한 이메일 도메인 셀렉트 박스의 value를 input 창의 value로 넣어주는 함수.
	function chageDomainSelect(){
		
	    $("#email_domain").val($("#input_domain").val());
	    
	} // chageDomainSelect() 함수 end
	
	
	// id 속성값이 reqInfo인 span 영역에 "필수 정보입니다." 라는 문자열을 출력하는 메소드
	// 각  인풋 창들 넘ㄴ어갈 때 값이 없으면 필수정보입니다 출력. 인풋창 아이디를 인자로 받기...
	// 인풋창 아이디 변수 선언
	
	
	
	// 문서의 body 부분 읽고 제이쿼리 실행.
	$(function(){
		
		function reqInfoMsg(inputID){
			let msg = '<font color="red">필수 정보입니다.</font>';
		$('#id').append(msg);
		}	
		
		// 마우스가 입력창을 벗어났을 때 입력값이 없으면 필수 입력 문자열 출력
		$(#id).blur(function(){
			if($(#id).val() ==''){
				let msg = '<font color="red">필수 정보입니다.</font>';
					$('#id').append(msg);
			}
		});
	
	});
	
	// 회원정보 유효성 검사
	$. ajax({
		url : ,	// 요청이 전송될 URL 주소
		type: "get",	// http 요청 방식	
	
	});
	
	
</script>
<style type="text/css">

	body {
	 width: 100vw;
	 height: 100vh;
	 margin : 0;
	}
	
	/* 회원가입 페이지 위치 잡기 */	
	.join_container{
		display: grid;
		place-items: center;
		grid-template-columns: 20% 60% 20%;
		grid-template-rows: 50px 50px 1400px 100px;
	}

	h2 {
		margin: 0px;
		grid-column: 2/3;
		grid-row: 2/3;	
	}
	
	.join_form{
		grid-column: 2/3;
		grid-row: 3/4;	
		width: 460px;
		border-top: 4px solid #ff4d54;
	}
	
	/* 회원가입 페이지 CSS */	
	.join_title{
		font-size: 17px;
		font-weight: bolder;
		text-align: left;
		margin-top: 25px;
		margin-bottom: 5px;
		border-radius: 5px;
	}
	
	.input_box {
		width: 442.778px;
		height: 50px;
		border: 1px solid lightgray;
		padding: 0px 0px 0px 15px;
		border-radius: 5px;
	} 
	
	.input_select {
		width: 460px;
		height: 50px;
		border: 1px solid lightgray;
		padding: 0px 0px 0px 15px;
		border-radius: 5px;	
	}
	
	.input_box_email1 {
		width: 130.9px;
		height: 50px;
		border: 1px solid lightgray;
		padding: 0px 0px 0px 15px;
		border-radius: 5px;
	}
	
	.input_box_1 {
		margin-top: 10px;
		margin-bottom: 10px;
		width: 322px;
		height: 50px;
		border: 1px solid lightgray;
		padding: 0px 0px 0px 15px;
		border-radius: 5px;
	}
	
	
	.btn_mini {
		width: 115px;
		height: 50px;
		border: 0;
		color: white;
		border-radius: 5px;
		background-color: #ff4d54;
		cursor: pointer;
	}
	
	.input_box_addr {
		margin: 0px 0px 10px 0px;
		width: 209.97px;
		height: 50px;
		border: 1px solid lightgray;
		padding: 0px 0px 0px 15px;
		border-radius: 5px;
	}
	
	.btn_join {
		width: 460px;
		height: 50px;	
		border: 0;
		color: white;
		font-size: 20px;
		font-weight: bold;
		background-color: #ff4d54;
		border-radius: 5px;
		cursor: pointer;
	}
		
</style>
</head>
<body>

	<jsp:include page="../include/chall_top.jsp" />
			<article class="join_container" align="center">
				<h2>회원가입</h2>
				
				<form class="join_form" method="post" action="<%=request.getContextPath() %>/member_join_ok.do">
						
						<!-- 아이디 입력 -->
						<div class="join_id">		
							<h3 class="join_title">아이디</h3>
							<input class="input_box" type="text" name="id" id="id">
							<span id="idReqMsg"></span>
						</div>
						
						<!-- 비밀번호 입력 -->
						<div class="join_pwd">						
							<h3 class="join_title">비밀번호</h3>
							<input class="input_box" type="password" name="pwd" id="pwd">
							<span id="idCheck"></span>
							<h3 class="join_title">비밀번호 확인</h3>
							<input class="input_box" type="password" id="pwd2">
							<span id="idCheck"></span>
						</div>	
						
						<!-- 이름 입력 -->
						<div class="join_name">
							<h3 class="join_title">이름</h3>
							<input class="input_box" type="text" name="name" id="name">
						</div>
						
						<!-- 생년월일 입력 -->
						<div class="join_birth">
							<h3 class="join_title">생년월일</h3>
							<input class="input_box" type="text" name="birth" id="birth" placeholder="  8자리로 입력해주세요.  ex)19960319">
						</div>
						
						<!-- 성별 입력 -->
						<div class="join_gender">
							<h3 class="join_title">성별</h3>
							<select class="input_select" name="gender" id="gender">
								<option value="none">--성별--</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
						</div>
						
					
						<!-- 이메일 입력 -->
						<div class="join_email">
							<h3 class="join_title">이메일</h3>
							<input class="input_box_email1" type="text" id="email_id" name="email_id"> @ 								
							<input class="input_box_email1" type="text" id="email_domain" name="email_domain" value="${dto.emailDomain }">
							<select class="input_box_email1" id="input_domain" onchange="chageDomainSelect()" >
									<option >--선택--</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="yahoo.com">yahoo.com</option>
									<option value="nate.com">nate.com</option>
									<option value="">직접입력</option>
							</select>
						</div>
						
		                <!-- 휴대전화 번호, 인증번호 입력 -->
		                <div class="join_mobile">
	                    	<h3 class="join_title">휴대전화</h3>
	                        <select class="input_select" id="nationNo" name="nationNo">
		                                        <option value="233" >
		                                            가나 +233
		                                        </option>
		                                        <option value="241" >
		                                            가봉 +241
		                                        </option>
		                                        <option value="592" >
		                                            가이아나 +592
		                                        </option>
		                                        <option value="220" >
		                                            감비아 +220
		                                        </option>
		                                        <option value="502" >
		                                            과테말라 +502
		                                        </option>
		                                        <option value="1671" >
		                                            괌 +1 671
		                                        </option>
		                                        <option value="1473" >
		                                            그레나다 +1 473
		                                        </option>
		                                        <option value="30" >
		                                            그리스 +30
		                                        </option>
		                                        <option value="224" >
		                                            기니 +224
		                                        </option>
		                                        <option value="245" >
		                                            기니비사우 +245
		                                        </option>
		                                        <option value="264" >
		                                            나미비아 +264
		                                        </option>
		                                        <option value="674" >
		                                            나우루 +674
		                                        </option>
		                                        <option value="234" >
		                                            나이지리아 +234
		                                        </option>
		                                        <option value="672" >
		                                            남극,오스트레일리아의외 +672
		                                        </option>
		                                        <option value="27" >
		                                            남아프리카공화국 +27
		                                        </option>
		                                        <option value="31" >
		                                            네덜란드 +31
		                                        </option>
		                                        <option value="599" >
		                                            네덜란드령보네르 +599
		                                        </option>
		                                        <option value="297" >
		                                            네덜란드령아루바 +297
		                                        </option>
		                                        <option value="977" >
		                                            네팔 +977
		                                        </option>
		                                        <option value="47" >
		                                            노르웨이 +47
		                                        </option>
		                                        <option value="64" >
		                                            뉴질랜드 +64
		                                        </option>
		                                        <option value="683" >
		                                            뉴질랜드령니우에 +683
		                                        </option>
		                                        <option value="690" >
		                                            뉴질랜드령토켈라우제도 +690
		                                        </option>
		                                        <option value="227" >
		                                            니제르 +227
		                                        </option>
		                                        <option value="505" >
		                                            니카라과 +505
		                                        </option>
		                                        <option value="82" selected>
		                                            대한민국 +82
		                                        </option>
		                                        <option value="45" >
		                                            덴마크 +45
		                                        </option>
		                                        <option value="299" >
		                                            덴마크령그린란드 +299
		                                        </option>
		                                        <option value="298" >
		                                            덴마크령페로제도 +298
		                                        </option>
		                                        <option value="1809" >
		                                            도미니카공화국 +1 809
		                                        </option>
		                                        <option value="1829" >
		                                            도미니카공화국 2 +1 829
		                                        </option>
		                                        <option value="1849" >
		                                            도미니카공화국 3 +1 849
		                                        </option>
		                                        <option value="49" >
		                                            독일 +49
		                                        </option>
		                                        <option value="670" >
		                                            동티모르 +670
		                                        </option>
		                                        <option value="856" >
		                                            라오스 +856
		                                        </option>
		                                        <option value="231" >
		                                            라이베리아 +231
		                                        </option>
		                                        <option value="371" >
		                                            라트비아 +371
		                                        </option>
		                                        <option value="7" >
		                                            러시아/카자흐스탄 +7
		                                        </option>
		                                        <option value="961" >
		                                            레바논 +961
		                                        </option>
		                                        <option value="266" >
		                                            레소토 +266
		                                        </option>
		                                        <option value="40" >
		                                            루마니아 +40
		                                        </option>
		                                        <option value="352" >
		                                            룩셈부르크 +352
		                                        </option>
		                                        <option value="250" >
		                                            르완다 +250
		                                        </option>
		                                        <option value="218" >
		                                            리비아 +218
		                                        </option>
		                                        <option value="370" >
		                                            리투아니아 +370
		                                        </option>
		                                        <option value="423" >
		                                            리히텐슈타인 +423
		                                        </option>
		                                        <option value="261" >
		                                            마다가스카르 +261
		                                        </option>
		                                        <option value="692" >
		                                            마셜제도공화국 +692
		                                        </option>
		                                        <option value="691" >
		                                            마이크로네시아연방 +691
		                                        </option>
		                                        <option value="853" >
		                                            마카오 +853
		                                        </option>
		                                        <option value="389" >
		                                            마케도니아공화국 +389
		                                        </option>
		                                        <option value="265" >
		                                            말라위 +265
		                                        </option>
		                                        <option value="60" >
		                                            말레이시아 +60
		                                        </option>
		                                        <option value="223" >
		                                            말리 +223
		                                        </option>
		                                        <option value="52" >
		                                            멕시코 +52
		                                        </option>
		                                        <option value="377" >
		                                            모나코 +377
		                                        </option>
		                                        <option value="212" >
		                                            모로코 +212
		                                        </option>
		                                        <option value="230" >
		                                            모리셔스 +230
		                                        </option>
		                                        <option value="222" >
		                                            모리타니아 +222
		                                        </option>
		                                        <option value="258" >
		                                            모잠비크 +258
		                                        </option>
		                                        <option value="382" >
		                                            몬테네그로 +382
		                                        </option>
		                                        <option value="373" >
		                                            몰도바 +373
		                                        </option>
		                                        <option value="960" >
		                                            몰디브 +960
		                                        </option>
		                                        <option value="356" >
		                                            몰타 +356
		                                        </option>
		                                        <option value="976" >
		                                            몽골 +976
		                                        </option>
		                                        <option value="1" >
		                                            미국/캐나다 +1
		                                        </option>
		                                        <option value="1670" >
		                                            미국령북마리아나제도 +1 670
		                                        </option>
		                                        <option value="95" >
		                                            미얀마 +95
		                                        </option>
		                                        <option value="678" >
		                                            바누아투 +678
		                                        </option>
		                                        <option value="973" >
		                                            바레인 +973
		                                        </option>
		                                        <option value="1246" >
		                                            바베이도스 +1 246
		                                        </option>
		                                        <option value="1242" >
		                                            바하마 +1 242
		                                        </option>
		                                        <option value="880" >
		                                            방글라데시 +880
		                                        </option>
		                                        <option value="229" >
		                                            베냉 +229
		                                        </option>
		                                        <option value="58" >
		                                            베네수엘라 +58
		                                        </option>
		                                        <option value="84" >
		                                            베트남 +84
		                                        </option>
		                                        <option value="32" >
		                                            벨기에 +32
		                                        </option>
		                                        <option value="375" >
		                                            벨라루스 +375
		                                        </option>
		                                        <option value="501" >
		                                            벨리즈 +501
		                                        </option>
		                                        <option value="387" >
		                                            보스니아헤르체고비나 +387
		                                        </option>
		                                        <option value="267" >
		                                            보츠와나 +267
		                                        </option>
		                                        <option value="591" >
		                                            볼리비아 +591
		                                        </option>
		                                        <option value="257" >
		                                            부룬디 +257
		                                        </option>
		                                        <option value="226" >
		                                            부르키나파소 +226
		                                        </option>
		                                        <option value="975" >
		                                            부탄 +975
		                                        </option>
		                                        <option value="359" >
		                                            불가리아 +359
		                                        </option>
		                                        <option value="55" >
		                                            브라질 +55
		                                        </option>
		                                        <option value="673" >
		                                            브루나이 +673
		                                        </option>
		                                        <option value="685" >
		                                            사모아 +685
		                                        </option>
		                                        <option value="966" >
		                                            사우디아라비아 +966
		                                        </option>
		                                        <option value="378" >
		                                            산마리노 +378
		                                        </option>
		                                        <option value="239" >
		                                            상투메프린시페 +239
		                                        </option>
		                                        <option value="221" >
		                                            세네갈 +221
		                                        </option>
		                                        <option value="381" >
		                                            세르비아 +381
		                                        </option>
		                                        <option value="248" >
		                                            세이셀 +248
		                                        </option>
		                                        <option value="1784" >
		                                            세인트빈센트그레나딘 +1 784
		                                        </option>
		                                        <option value="252" >
		                                            소말리아 +252
		                                        </option>
		                                        <option value="677" >
		                                            솔로몬제도 +677
		                                        </option>
		                                        <option value="249" >
		                                            수단 +249
		                                        </option>
		                                        <option value="597" >
		                                            수리남 +597
		                                        </option>
		                                        <option value="94" >
		                                            스리랑카 +94
		                                        </option>
		                                        <option value="268" >
		                                            스와질랜드 +268
		                                        </option>
		                                        <option value="46" >
		                                            스웨덴 +46
		                                        </option>
		                                        <option value="41" >
		                                            스위스 +41
		                                        </option>
		                                        <option value="34" >
		                                            스페인 +34
		                                        </option>
		                                        <option value="421" >
		                                            슬로바키아 +421
		                                        </option>
		                                        <option value="386" >
		                                            슬로베니아 +386
		                                        </option>
		                                        <option value="963" >
		                                            시리아 +963
		                                        </option>
		                                        <option value="232" >
		                                            시에라리온 +232
		                                        </option>
		                                        <option value="65" >
		                                            싱가포르 +65
		                                        </option>
		                                        <option value="971" >
		                                            아랍에미리트 +971
		                                        </option>
		                                        <option value="374" >
		                                            아르메니아 +374
		                                        </option>
		                                        <option value="54" >
		                                            아르헨티나 +54
		                                        </option>
		                                        <option value="1684" >
		                                            아메리칸사모아 +1 684
		                                        </option>
		                                        <option value="354" >
		                                            아이슬란드 +354
		                                        </option>
		                                        <option value="509" >
		                                            아이티 +509
		                                        </option>
		                                        <option value="353" >
		                                            아일랜드 +353
		                                        </option>
		                                        <option value="994" >
		                                            아제르바이잔 +994
		                                        </option>
		                                        <option value="93" >
		                                            아프가니스탄 +93
		                                        </option>
		                                        <option value="376" >
		                                            안도라 +376
		                                        </option>
		                                        <option value="355" >
		                                            알바니아 +355
		                                        </option>
		                                        <option value="213" >
		                                            알제리 +213
		                                        </option>
		                                        <option value="244" >
		                                            앙골라 +244
		                                        </option>
		                                        <option value="251" >
		                                            에디오피아 +251
		                                        </option>
		                                        <option value="291" >
		                                            에리트레아 +291
		                                        </option>
		                                        <option value="372" >
		                                            에스토니아 +372
		                                        </option>
		                                        <option value="593" >
		                                            에콰도르 +593
		                                        </option>
		                                        <option value="503" >
		                                            엘살바도르 +503
		                                        </option>
		                                        <option value="44" >
		                                            영국 +44
		                                        </option>
		                                        <option value="290" >
		                                            영국령세인트헬레나 +290
		                                        </option>
		                                        <option value="246" >
		                                            영국령인도양지역 +246
		                                        </option>
		                                        <option value="350" >
		                                            영국령지브롤터 +350
		                                        </option>
		                                        <option value="500" >
		                                            영국령포클랜드제도 +500
		                                        </option>
		                                        <option value="967" >
		                                            예멘 +967
		                                        </option>
		                                        <option value="968" >
		                                            오만 +968
		                                        </option>
		                                        <option value="43" >
		                                            오스트리아 +43
		                                        </option>
		                                        <option value="504" >
		                                            온두라스 +504
		                                        </option>
		                                        <option value="962" >
		                                            요르단 +962
		                                        </option>
		                                        <option value="256" >
		                                            우간다 +256
		                                        </option>
		                                        <option value="598" >
		                                            우루과이 +598
		                                        </option>
		                                        <option value="998" >
		                                            우즈베키스탄 +998
		                                        </option>
		                                        <option value="380" >
		                                            우크라이나 +380
		                                        </option>
		                                        <option value="964" >
		                                            이라크 +964
		                                        </option>
		                                        <option value="98" >
		                                            이란 +98
		                                        </option>
		                                        <option value="972" >
		                                            이스라엘 +972
		                                        </option>
		                                        <option value="20" >
		                                            이집트 +20
		                                        </option>
		                                        <option value="39" >
		                                            이탈리아 +39
		                                        </option>
		                                        <option value="91" >
		                                            인도 +91
		                                        </option>
		                                        <option value="62" >
		                                            인도네시아 +62
		                                        </option>
		                                        <option value="81" >
		                                            일본 +81
		                                        </option>
		                                        <option value="1876" >
		                                            자메이카 +1 876
		                                        </option>
		                                        <option value="260" >
		                                            잠비아 +260
		                                        </option>
		                                        <option value="240" >
		                                            적도기니 +240
		                                        </option>
		                                        <option value="995" >
		                                            조지아 +995
		                                        </option>
		                                        <option value="86" >
		                                            중국 +86
		                                        </option>
		                                        <option value="236" >
		                                            중앙아프리카공화국 +236
		                                        </option>
		                                        <option value="253" >
		                                            지부티 +253
		                                        </option>
		                                        <option value="263" >
		                                            짐바브웨 +263
		                                        </option>
		                                        <option value="235" >
		                                            차드 +235
		                                        </option>
		                                        <option value="420" >
		                                            체코 +420
		                                        </option>
		                                        <option value="56" >
		                                            칠레 +56
		                                        </option>
		                                        <option value="237" >
		                                            카메룬 +237
		                                        </option>
		                                        <option value="238" >
		                                            카보베르데 +238
		                                        </option>
		                                        <option value="974" >
		                                            카타르 +974
		                                        </option>
		                                        <option value="855" >
		                                            캄보디아왕국 +855
		                                        </option>
		                                        <option value="254" >
		                                            케냐 +254
		                                        </option>
		                                        <option value="269" >
		                                            코모로,마요트 +269
		                                        </option>
		                                        <option value="506" >
		                                            코스타리카 +506
		                                        </option>
		                                        <option value="225" >
		                                            코트디부아르 +225
		                                        </option>
		                                        <option value="57" >
		                                            콜롬비아 +57
		                                        </option>
		                                        <option value="242" >
		                                            콩고 +242
		                                        </option>
		                                        <option value="243" >
		                                            콩고민주공화국 +243
		                                        </option>
		                                        <option value="53" >
		                                            쿠바 +53
		                                        </option>
		                                        <option value="965" >
		                                            쿠웨이트 +965
		                                        </option>
		                                        <option value="682" >
		                                            쿡제도 +682
		                                        </option>
		                                        <option value="385" >
		                                            크로아티아 +385
		                                        </option>
		                                        <option value="996" >
		                                            키르기스스탄 +996
		                                        </option>
		                                        <option value="686" >
		                                            키리바시 +686
		                                        </option>
		                                        <option value="357" >
		                                            키프로스 +357
		                                        </option>
		                                        <option value="886" >
		                                            타이완 +886
		                                        </option>
		                                        <option value="992" >
		                                            타지키스탄 +992
		                                        </option>
		                                        <option value="255" >
		                                            탄자니아 +255
		                                        </option>
		                                        <option value="66" >
		                                            태국 +66
		                                        </option>
		                                        <option value="90" >
		                                            터키 +90
		                                        </option>
		                                        <option value="228" >
		                                            토고 +228
		                                        </option>
		                                        <option value="676" >
		                                            통가 +676
		                                        </option>
		                                        <option value="993" >
		                                            투르크메니스탄 +993
		                                        </option>
		                                        <option value="216" >
		                                            튀니지 +216
		                                        </option>
		                                        <option value="1868" >
		                                            트리니다드토바고 +1 868
		                                        </option>
		                                        <option value="507" >
		                                            파나마 +507
		                                        </option>
		                                        <option value="595" >
		                                            파라과이 +595
		                                        </option>
		                                        <option value="92" >
		                                            파키스탄 +92
		                                        </option>
		                                        <option value="675" >
		                                            파푸아뉴기니 +675
		                                        </option>
		                                        <option value="680" >
		                                            팔라우 +680
		                                        </option>
		                                        <option value="970" >
		                                            팔레스타인 +970
		                                        </option>
		                                        <option value="51" >
		                                            페루 +51
		                                        </option>
		                                        <option value="351" >
		                                            포르투갈 +351
		                                        </option>
		                                        <option value="48" >
		                                            폴란드 +48
		                                        </option>
		                                        <option value="1787" >
		                                            푸에르토리코 +1 787
		                                        </option>
		                                        <option value="33" >
		                                            프랑스 +33
		                                        </option>
		                                        <option value="590" >
		                                            프랑스령과들루프 +590
		                                        </option>
		                                        <option value="594" >
		                                            프랑스령기아나 +594
		                                        </option>
		                                        <option value="687" >
		                                            프랑스령뉴칼레도니아 +687
		                                        </option>
		                                        <option value="262" >
		                                            프랑스령레위니옹 +262
		                                        </option>
		                                        <option value="596" >
		                                            프랑스령마르티니크 +596
		                                        </option>
		                                        <option value="508" >
		                                            프랑스령생피에르미클롱 +508
		                                        </option>
		                                        <option value="681" >
		                                            프랑스령월리스푸투나제 +681
		                                        </option>
		                                        <option value="689" >
		                                            프랑스령폴리네시아 +689
		                                        </option>
		                                        <option value="679" >
		                                            피지 +679
		                                        </option>
		                                        <option value="358" >
		                                            핀란드 +358
		                                        </option>
		                                        <option value="63" >
		                                            필리핀 +63
		                                        </option>
		                                        <option value="36" >
		                                            헝가리 +36
		                                        </option>
		                                        <option value="61" >
		                                            호주 +61
		                                        </option>
		                                        <option value="852" >
		                                            홍콩 +852
		                                        </option>
		                        </select>

							<input class="input_box_1" type="tel" id="phoneNo" name="phoneNo" placeholder="전화번호 입력" maxlength="16">
	                        <button class="btn_mini">인증번호 받기</button>
	                        <input class="input_box" type="text" id="authNo" name="authNo" placeholder="인증번호 입력하세요" disabled maxlength="4">												
		                </div>
	                    
	                    <!-- 주소 입력 -->
	                    <div class="join_addr">
	                    	<h3 class="join_title">주소</h3>
								<input class="input_box_1" type="text" id="postcode" name="postcode" placeholder="우편번호">
								<input class="btn_mini" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
								<input class="input_box_addr" type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
								<input class="input_box_addr" type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소">
								<input class="input_box_addr" type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
								<input class="input_box_addr" type="text" id="extraAddress"name="extraAddress" placeholder="참고항목">	                    
	                    </div>
	                    <br>
	                    <br>
	                    	<input type="submit" class="btn_join" value="가입하기">
				<!--아이디 중복 확인 해야함. 비밀번호 일치 확인 해야함. -->
				</form>
		
			</article>

	
	<jsp:include page="../include/chall_bottom.jsp" />
			
</body>
</html>