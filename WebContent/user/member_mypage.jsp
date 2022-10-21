<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
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
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
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
</script>

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
	}
	
	.my_article{
		grid-column: 2/3;
		grid-row: 4/5;	
	}
	
	table{
		border: 1px solid lightgray;
		border-spacing: 0 15px;
		text-align: left;
		tr{
			td{
				border: 1px solid lightgray;
			}
		}
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
	
	.update_btn{
		cursor: pointer;
		width: 100px;
		height: 40px;
		background-color: #ff4d54;
		color : white;
		font-weight : bold;
		font-size: 16px;
		border-radius: 5px;		
	}
	
	
</style>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp" />
	
	<div align="center">
		
		<article class="my_container">
			<c:set var="dto" value="${dto }" />
		
			<div class="mypage">
					<h1>마이페이지</h1>
			</div>
			
			<nav class="my_navi">
					<ul>
						<li><a href="<%=request.getContextPath() %>/member_mypage.do?no=${dto.mem_num}">회원 정보 조회/수정</a></li>
						<li><a>나의 챌린지 현황</a></li>
						<li><a>나의 예치금.상금</a></li>
						<li><a>나의 레벨.배지</a></li>
					</ul>
			</nav>
			
			<div class="my_title">
				<h2>회원 정보 조회/수정</h2>
			</div>
				
			<section class="my_article">
				<form method="post" action="">
					<table width="900" >
						<tr>
							<th>이름</th>
							<td>
								<input type="text" value="${dto.mem_name }" readonly>
							</td> 
						<tr>
						
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" value="${dto.mem_id }" readonly>
							</td>
						</tr>
						
						<tr>
							<th>현재 비밀번호</th>
							<td>
								<input type="password" name="pwd">
							</td>
						</tr>
						
						<tr>
							<th>변경할 비밀번호</th>
							<td>
								<input type="password" name="pwd">
							</td>
						</tr>
						
						<tr>
							<th>변경할 비밀번호 확인</th>
							<td>
								<input type="password" name="pwd_check">
							</td>
						</tr>
						
						<tr>
							<th>나이</th>
							<td>
								<input type="text" value="${dto.mem_age }" readonly>
							</td>
						</tr>
						
						<tr>
							<th>연락처</th>
							<td>
								<input type="text" value="${dto.mem_phone }">
							</td>
						</tr>
						
						<tr>
							<th>주소</th>
							<td>
								<input type="text" id="sample4_postcode" placeholder="우편번호">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
								<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
								<span id="guide" style="color:#999;display:none"></span><br>
								<input type="text" id="sample4_detailAddress" placeholder="상세주소">
								<input type="text" id="sample4_extraAddress" placeholder="참고항목">
							</td>
						</tr>
						
						<tr>
							<td colspan="2" align="center">
								<input class="update_btn" type="submit" value="수정">
							</td>						
						<tr>
					</table>
				</form>	
			</section >	
		</article>		
	</div>

	<jsp:include page="../include/chall_bottom.jsp" />	
</body>
</html>