<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>챌린지 미리보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	.join_hr {
		border: 0;
    	height: 5px;
    	background: #ff4d54;
    	opacity: 80;
	}
</style>
</head>
<body>
   <jsp:include page="/include/chall_top.jsp" />
   
   		<!-- 로그인하면 넘어오는 세션 값
		session.setAttribute("memberId", dto.getMem_id());
		session.setAttribute("memberName", dto.getMem_name());
		session.setAttribute("memberNum", dto.getMem_num()); -->
		
		<div align="center">
			<br>
			<h3><b>챌린지 개설 미리보기 페이지</b></h3>
			<hr class="join_hr" width="50%" color="red">
			<br>
			
			
			<c:set var="dto" value="${challContent }"/>	<!-- 챌린지 정보 가져옴 -->
			<c:set var="user_dto" value="${userInfo }"/> <!-- 개설자 프사, 개설 챌린지 수, 평점 데이터 가져옴 -->
			<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
			<script type="text/javascript">
				onload = function() {
					moment.lang('ko', {
					    weekdaysShort: ["일","월","화","수","목","금","토"]
					});
					moment.locale("ko");    //한글 날짜 형식으로 지정
					var dto_startDate = ${dto.getChall_startDate()};
					var startDate = moment(dto_startDate,'YYYYMMDD').format("MM.DD (ddd)");
					var dto_duration = ${dto.getChall_duration()};
					var endDate = moment(dto_startDate,'YYYYMMDD').add(dto_duration,'w').format("MM.DD (ddd)");
					$("#startDate").text(startDate); 
					$("#endDate").text(endDate);
				}
			</script>
			<img id="image" height="300" width="300" border="2" src="<%=request.getContextPath()%>/memUpload/${dto.getChall_mainImage() }" class="rounded mx-auto d-block">
			<br>
			<!-- 프로필사진도 불러오기 -->
			${memberName} 님<br>
			
			<br>
			<h2>${dto.getChall_title() }</h2>
			
			<br>
			<br>
			현재 ${dto.getChall_ongoingPeople() }명
			
			<br>
			인증빈도 : ${dto.getChall_cycle() } / 챌린지 기간 : ${dto.getChall_duration() }주<br>
			<span id="startDate"></span> - <span id="endDate"></span>
			
			<br>
			<c:if test="${empty dto.getChall_maxPeople()}"> <!-- 최대 인원 설정 X -->
			현재 : ${dto.getChall_ongoingPeople() }명<br>
			</c:if>
			<c:if test="${!empty dto.getChall_maxPeople()}"> <!-- 최대 인원 설정 O -->
			모집현황 : ${dto.getChall_ongoingPeople() }명 신청중 / ${dto.getChall_maxPeople() }명 모집<br>
			</c:if>
			
			<hr class="join_hr" width="50%" color="red">
			
			<h4>챌린지 리더</h4>
			<img id="image" height="300" width="300" border="2" 
			src="<%=request.getContextPath()%>/memUpload/${user_dto.getMem_img()}" 
			class="rounded mx-auto d-block">
			${memberName} 님 <br>
			챌린지개설 : ${user_dto.getChallenge_made_count()}개 / 평점 : ${user_dto.getChallenge_rating()}<br><!-- 챌린지개설 수와 평점 불러오기 -->
			<hr class="join_hr" width="50%" color="red">
			<h4>저의 챌린지를 소개해요!</h4>
			<br>
			${dto.getChall_cont() }<br>
			<img src="<%=request.getContextPath()%>/memUpload/${dto.getChall_contImg() }" width="300" height="300"><br>
			<br>
			<hr class="join_hr" width="50%" color="red">
			<h4>이렇게 인증 해주세요</h4>
			<br>
			${dto.getChall_guide() }<br><!-- 색깔있는 박스 안에 넣어 돋보이게 해주기 -->
			<br>
			<table>
			  <tr>
			    <td><img id="image1" height="200" width="200" border="2" src="<%=request.getContextPath()%>/memUpload/${dto.getChall_successImage() }" class="rounded mx-auto d-block"></td>
			    <td><img id="image2" height="200" width="200" border="2" src="<%=request.getContextPath()%>/memUpload/${dto.getChall_failImage() }" class="rounded mx-auto d-block"></td>
			  <tr>
			  <tr align="center">
			  	<td>O</td>
			  	<td>X</td>
			  </tr>
			</table>
			
			<br>
			<hr class="join_hr" width="50%" color="red">
			<h4>챌린지 진행 시 꼭 알아주세요!</h4>
			${dto.getChall_regiTimeStart() } ~ ${dto.getChall_regiTimeEnd() } 사이에 인증 하셔야 합니다.<br>
			${dto.getChall_duration() }주 동안 ${dto.getChall_cycle() } 인증샷을 촬영하셔야 합니다.<br>
			<hr class="join_hr" width="50%" color="red">
			<br>
			<h4>왜 돈을 걸어야 하나요?</h4>
			확실한 동기 부여를 위해 돈을 걸어요<!-- 버튼 만들어 소개 페이지 따로 연결 -->
			
			<br><br>
			<button type="button" class="btn btn-dark" onclick="history.back()">다시 설정하기</button>
			<button class="btn btn-danger" onclick="location.href='member_challJoin_pay.do'">참가하기</button>
		</div>
		<br>
   		<div class="progress">
  			<div class="progress-bar" role="progressbar" aria-label="Example with label" style="width: 97%;" aria-valuenow="97" aria-valuemin="0" aria-valuemax="100">99 %</div>
		</div>
		<br>
   <jsp:include page="/include/chall_bottom.jsp" />
</body>
</html>