<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 시작일 버튼 생성 코드
	String pattern1 = "MM.dd (E)"; SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat(pattern1);
	Calendar cal1 = Calendar.getInstance(); String day1 = simpleDateFormat1.format(cal1.getTime());
	
	String pattern2 = "MM.dd (E)"; SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat(pattern2);
	Calendar cal2 = Calendar.getInstance(); cal2.add(Calendar.DAY_OF_MONTH, 1); String day2 = simpleDateFormat2.format(cal2.getTime());
	
	String pattern3 = "MM.dd (E)"; SimpleDateFormat simpleDateFormat3 = new SimpleDateFormat(pattern3);
	Calendar cal3 = Calendar.getInstance(); cal3.add(Calendar.DAY_OF_MONTH, 2); String day3 = simpleDateFormat3.format(cal3.getTime());
	
	String pattern4 = "MM.dd (E)"; SimpleDateFormat simpleDateFormat4 = new SimpleDateFormat(pattern4);
	Calendar cal4 = Calendar.getInstance(); cal4.add(Calendar.DAY_OF_MONTH, 3); String day4 = simpleDateFormat4.format(cal4.getTime());
	
	String pattern5 = "MM.dd (E)"; SimpleDateFormat simpleDateFormat5 = new SimpleDateFormat(pattern5);
	Calendar cal5 = Calendar.getInstance(); cal5.add(Calendar.DAY_OF_MONTH, 4); String day5 = simpleDateFormat5.format(cal5.getTime());
	
	String pattern6 = "MM.dd (E)"; SimpleDateFormat simpleDateFormat6 = new SimpleDateFormat(pattern6);
	Calendar cal6 = Calendar.getInstance(); cal6.add(Calendar.DAY_OF_MONTH, 5); String day6 = simpleDateFormat6.format(cal6.getTime());
	
	String pattern7 = "MM.dd (E)"; SimpleDateFormat simpleDateFormat7 = new SimpleDateFormat(pattern7);
	Calendar cal7 = Calendar.getInstance(); cal7.add(Calendar.DAY_OF_MONTH, 6); String day7 = simpleDateFormat7.format(cal7.getTime());
	// 시작일 버튼 생성 코드 end
	
	// 인증 가능 시간 코드
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style type="text/css">

	.join3hr {
		border: 0;
    	height: 3px;
    	background: #ff4d54;
    	opacity: 100;
	}
	
</style>
</head>
<body>
   <jsp:include page="/include/chall_top.jsp" />
   
		<div align="center">
			<hr class="join3hr" width="50%" color="red">
			<h3><b>챌린지 개설하기</b></h3>
			<hr class="join3hr" width="50%">
			<br>
			
			
			<h5>챌린지 제목</h5>
  			<textarea cols="25" rows="1" id="title" placeholder="예) 1만보 걷기"></textarea>
			
			
			<br><br>
			<h5>인증 빈도</h5>
			<input type="radio" class="btn-check" name="cycle" id="option1" autocomplete="off" checked>
			<label class="btn btn-secondary" for="option1">매일</label>
			<input type="radio" class="btn-check" name="cycle" id="option2" autocomplete="off">
			<label class="btn btn-secondary" for="option2">평일 매일</label>
			<input type="radio" class="btn-check" name="cycle" id="option3" autocomplete="off">
			<label class="btn btn-secondary" for="option3">주말 매일</label>
			<input type="radio" class="btn-check" name="cycle" id="option4" autocomplete="off">
			<label class="btn btn-secondary" for="option4">주 1일</label>
			<input type="radio" class="btn-check" name="cycle" id="option5" autocomplete="off">
			<label class="btn btn-secondary" for="option5">주 2일</label>
			<input type="radio" class="btn-check" name="cycle" id="option6" autocomplete="off">
			<label class="btn btn-secondary" for="option6">주 3일</label>
			<input type="radio" class="btn-check" name="cycle" id="option7" autocomplete="off">
			<label class="btn btn-secondary" for="option7">주 4일</label>
			<input type="radio" class="btn-check" name="cycle" id="option8" autocomplete="off">
			<label class="btn btn-secondary" for="option8">주 5일</label>
			<input type="radio" class="btn-check" name="cycle" id="option9" autocomplete="off">
			<label class="btn btn-secondary" for="option9">주 6일</label>
			
			
			<br><br>
			<h5>챌린지 기간</h5>
			<input type="radio" class="btn-check" name="duration" id="option10" autocomplete="off">
			<label class="btn btn-secondary" for="option10">1주 동안</label>
			<input type="radio" class="btn-check" name="duration" id="option11" autocomplete="off">
			<label class="btn btn-secondary" for="option11">2주 동안</label>
			
			
			<br><br>
			<h5>시작일</h5>
			<input type="radio" class="btn-check" name="startDate" id="option12" autocomplete="off">
			<label class="btn btn-secondary" for="option12"><%=day1 %></label>
			<input type="radio" class="btn-check" name="startDate" id="option13" autocomplete="off">
			<label class="btn btn-secondary" for="option13"><%=day2 %></label>
			<input type="radio" class="btn-check" name="startDate" id="option14" autocomplete="off">
			<label class="btn btn-secondary" for="option14"><%=day3 %></label>
			<input type="radio" class="btn-check" name="startDate" id="option15" autocomplete="off">
			<label class="btn btn-secondary" for="option15"><%=day4 %></label>
			<input type="radio" class="btn-check" name="startDate" id="option16" autocomplete="off">
			<label class="btn btn-secondary" for="option16"><%=day5 %></label>
			<input type="radio" class="btn-check" name="startDate" id="option17" autocomplete="off">
			<label class="btn btn-secondary" for="option17"><%=day6 %></label>
			<input type="radio" class="btn-check" name="startDate" id="option18" autocomplete="off">
			<label class="btn btn-secondary" for="option18"><%=day7 %></label>
			
			
			<br><br>
			<h5>인증 방법</h5>
  			<textarea cols="55" rows="3" id="guide" placeholder="예) 오늘 날짜와 걸음 수가 적힌 만보기 캡쳐 화면 업로드"></textarea>
  			<br>
  			<a>* 챌린지가 시작되면 인증 방법을 수정할 수 없습니다. 신중히 작성해주세요. <br>
  			* 참가자들이 혼란을 겪지 않도록 정확한 기준과 구체적인 인증방법을 적어주세요. <br>
  			* 유저 챌린지에서 발생한 분쟁에는 챌린저스가 관여하지 않습니다.</a>
  			
  			
  			<br><br>
			<h5>인증샷 예시</h5>
			<table>
			  <tr>
			    <td><img alt="인증 성공 예시 사진" height="300" width="300" border="2" src="<%=request.getContextPath()%>/uploadFile/regi_shot_success.jpg" class="rounded mx-auto d-block"></td>
			    <td><img alt="인증 실패 예시 사진" height="300" width="300" border="2" src="<%=request.getContextPath()%>/uploadFile/regi_shot_fail.jpg" class="rounded mx-auto d-block"></td>
			  <tr>
			  <tr align="center">
			  	<td>O</td>
			  	<td>X</td>
			  </tr>
			</table>
			
			
			<br><br>
			<h5>인증 가능 시간</h5>
			<table>
				<tr align="center">
					<td>시작 시간</td>
					<td>종료 시간</td>
				</tr>
				<tr>
					<td><input type="time" value="00:00"></td>
					<td><input type="time" value="23:59"></td>
				</tr>
			</table>
			
			
			<br><br>
			<h5>챌린지 소개</h5>
			<a>사진과 글을 추가해 챌린지를 소개해보세요. <br>
  			혹시 알아요 리더님의 글에 반해서 의지가 불타오를지!</a><br>
  			<textarea cols="55" rows="3" id="guide" placeholder="예) 매일 1만보 걷고 건강해지기! 오늘부터 같이 해봐요 :)"></textarea>
  			<br>
			
			<a>소개 사진 올리기</a><br>
			<input type="file">
			
			
			
			
			
			
			
			
			
			
			<br><br>
			<button type="button" class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/member_challJoin2.do'">이전</button>
			<button type="button" class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/member_challJoin4.do'">다음</button>
		</div>
		<br>
   		<div class="progress">
  			<div class="progress-bar" role="progressbar" aria-label="Example with label" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25 %</div>
		</div>
		<br>
   <jsp:include page="/include/chall_bottom.jsp" />
</body>
</html>