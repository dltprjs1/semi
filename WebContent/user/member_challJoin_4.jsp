<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			
			<h5>예치금</h5>
			<a>고정 예치금은 최소 1천원부터 가능합니다.(천원 단위 가능)</a><label>&nbsp;&nbsp;<input type="checkbox" name="color" value="red">고정 예치금</label>
			<br>
			<textarea rows="1" cols="30">1000</textarea>원
			
  			
  			<br><br>
			<h5>비공개 참여 코드</h5>
			<a>프라이빗한 챌린지를 위해, 우리만의 코드를 정해보세요.</a><br>
			<textarea cols="25" rows="1" id="title" placeholder="예) 1234, 우리는챌린저스"></textarea>
			
			
			<br><br>
			<h5>최대 모집 인원 설정하기</h5>
			<a>참가자 모집 인원을 제한하고 싶은 경우 설정할 수 있어요.</a>
			<!-- <a>참가자 모집 인원을 제한하고 싶은 경우 설정할 수 있어요. (최소 2명 ~ 최대 1,000명)</a> -->
			<div class="form-check form-switch">
			  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
			</div>
			<textarea rows="1" cols="4">50</textarea>명
			
			
			
			
			<br><br>
			<button type="button" class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/member_challJoin3.do'">이전</button>
			<button type="button" class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/어디로갈까요??'">챌린지 개설하기</button>
		</div>
		<br>
   		<div class="progress">
  			<div class="progress-bar" role="progressbar" aria-label="Example with label" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">50 %</div>
		</div>
		<br>
   <jsp:include page="/include/chall_bottom.jsp" />
</body>
</html>