<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>5/5 : 챌린지 개설</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
   
		<div align="center">
			<br>
			<h3><b>챌린지 개설 미리보기 페이지</b></h3>
			<hr class="join_hr" width="50%" color="red">
			<br>
			
			<img id="image" height="300" width="300" border="2" src="<%=request.getContextPath()%>/uploadFile/run.png" class="rounded mx-auto d-block">
			<br>
			<!-- 개설자 회원번호에 해당하는 아이디와 프로필사진 불러오기. 그 전까지 우선 회원번호만 띄움 -->
			회원 번호 : ${memberNum}<br>
			
			<br>
			<h2>${title }</h2>
			
			<br>
			<br>
			현재 0명
			
			<br>
			인증빈도 : ${cycle } / 챌린지 기간 : ${duration }<br>
			${startDate } ~ (오늘 날짜+챌린지 기간)
			
			<br>
			<!-- 최대 참여 인원 설정 시에만 나타내기 -->
			모집현황 : 0명 신청중 / ${maxPeople }명 모집<br>
			
			<hr class="join_hr" width="50%" color="red">
			
			<h4>챌린지 리더</h4>
			회원 번호 : ${memberNum}<br><!-- 개설자 회원번호에 해당하는 아이디와 프로필사진 불러오기. 그 전까지 우선 회원번호만 띄움 -->
			(챌린지개설 : -개) / (평점 : -)<br><!-- 챌린지개설 수와 평점도 불어와야 함 -->
			<hr class="join_hr" width="50%" color="red">
			<h4>저의 챌린지를 소개해요!</h4>
			<br>
			${cont }<br>
			${discript_imgs }<br>
			<br>
			<hr class="join_hr" width="50%" color="red">
			<h4>이렇게 인증 해주세요</h4>
			<br>
			${guide }<br><!-- 아래 인증샷 유의사항 버튼을 눌러야 전체 텍스트가 보임 -->
			<br>
			<table>
			  <tr>
			    <td><img id="image1" height="300" width="300" border="2" src="<%=request.getContextPath()%>/uploadFile/regi_shot_success.jpg" class="rounded mx-auto d-block"></td>
			    <td><img id="image2" height="300" width="300" border="2" src="<%=request.getContextPath()%>/uploadFile/regi_shot_fail.jpg" class="rounded mx-auto d-block"></td>
			  <tr>
			  <tr align="center">
			  	<td>O</td>
			  	<td>X</td>
			  </tr>
			</table>
			
			<br>
			인증샷 유의사항 : ${guide }<!-- 버튼만들어서 전체 텍스트 보이게 해야함 -->
			<hr class="join_hr" width="50%" color="red">
			<h4>챌린지 진행 시 꼭 알아주세요!</h4>
			${startTime } ~ ${endTime }분 사이에 인증 하셔야 합니다.<br>
			${duration }주 동안 ${cycle } 인증샷을 촬영하셔야 합니다.<br>
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
			<%-- [session값]<br>
			개설자(회원번호) : ${memberNum}<br>
			공개여부 : ${open }<br>
			제목 : ${title }<br>
			인증빈도 : ${cycle }<br>
			챌린지 기간 : ${duration }<br>
			시작일 : ${startDate }<br>
			인증방법 : ${guide }<br>
			인증샷 성공 예시 이미지 : ${success_img }<br>
			인증샷 실패 예시 이미지 : ${fail_img }<br>
			인증 가능 시간_시작 : ${startTime }<br>
			인증 가능 시간_종료 : ${endTime }<br>
			챌린지 소개 : ${cont }<br>
			소개 이미지 : ${discript_imgs } <br>
			예치금(기본) : ${depositDefault }<br>
			예치금(최대) : ${depositMax }<br>
			비공개 코드 : ${privateCode }<br>
			최대 참여 인원 : ${maxPeople }<br>
			카테고리 : ${categoryName}<br>
			메인 이미지 : ${mainImgFile }<br>
			키워드 : ${keyword }<br><br><br> --%>