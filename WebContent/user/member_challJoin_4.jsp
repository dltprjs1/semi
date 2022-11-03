<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>4/5 : 챌린지 개설</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
	onload = function() { 	
	    var depositMaxTextArea = document.getElementById("depositMaxTextArea"); 	
		var depositMaxCont = document.getElementById("depositMaxCont");
		depositMaxTextArea.style.display = 'none';
		depositMaxCont.style.display = 'none';
		$('#depositDefault').on('change', function() {	// 고정 예치금일 경우(default)
			 var n = $(this).val();
		     n = Math.floor(n/1000) * 1000;
		     $(this).val(n);
		     if(Number($(this).val()) > 200000) { // 최대 200,000원 제한
		    	 $(this).val(200000);
		     }
		});
		
		let checkBox = document.getElementById("deposit");
		checkBox.onclick = function() {
			if (checkBox.checked == true){	// 고정 예치금 설정으로 변경했을 때
				depositMaxTextArea.style.display = 'none';
				depositDefaultCont.style.display = 'block';
				depositMaxCont.style.display = 'none';
				var n = $('#depositDefault').val();  // 1,000원 단위로 입력되게 하기(체크박스 다시 체크 시)
			    n = Math.floor(n/1000) * 1000;
			    $('#depositDefault').val(n);
				$('#depositDefault').on('change', function() { // 1,000원 단위로 입력되게 하기
					 var n = $(this).val();
				     n = Math.floor(n/1000) * 1000;
				     $(this).val(n);
				     if(Number($(this).val()) > 200000) { // 최대 200,000원 제한
				    	 $(this).val(200000);
				     }
				});
			} else {	// 최대 예치금 설정으로 변경했을 때
				depositMaxTextArea.style.display = 'block';
				depositDefaultCont.style.display = 'none';
				depositMaxCont.style.display = 'block';
				var n = $('#depositDefault').val();
			    n = Math.floor(n/10000) * 10000;
			    $('#depositDefault').val(n);
				$('#depositDefault').on('change', function() { // 10,000원 단위로 입력되게 하기
					 var n = $(this).val();
				     n = Math.floor(n/10000) * 10000;
				     $(this).val(n);
				     if(Number($(this).val()) > 200000) { // 최대 200,000원 제한
				    	 $(this).val(200000);
				     }
				});
				$('#depositMax').on('change', function() { // 10,000원 단위로 입력되게 하기
					 var n = $(this).val();
				     n = Math.floor(n/10000) * 10000;
				     $(this).val(n);
				     // depositDefault보다 작으면 depositDefault + 10,000원
				     if(Number($('#depositDefault').val()) > Number($(this).val())) {
				    	 $(this).val(Number($('#depositDefault').val())+10000);
				     }
				     if(Number($(this).val()) > 200000) { // 최대 200,000원 제한
				    	 $(this).val(200000);
				     }
				});
			}
		}
		
		var maxPeopleCont = document.getElementById("maxPeopleCont");
		var maxPeopleTextArea = document.getElementById("maxPeopleTextArea");
		let maxPeople = document.getElementById("flexSwitchCheckDefault");
		maxPeopleCont.style.display = 'none';
		maxPeopleTextArea.style.display = 'none';
		maxPeople.onclick = function() {
			$('#maxPeopleInput').on('change', function() {
			     if(Number($(this).val()) > 1000) { // 최대 예치금 제한
			    	 $(this).val(1000);
			     }
			     if(Number($(this).val()) < 2) { // 최소 예치금 제한
			    	 $(this).val(2);
			     }
			});
			if (maxPeople.checked == true){
				maxPeopleCont.style.display = 'block';
				maxPeopleTextArea.style.display = 'block';
			} else {
				maxPeopleCont.style.display = 'none';
				maxPeopleTextArea.style.display = 'none';
			}
		}
		
	    var code = document.getElementById("private_code"); 	
	    if(${open }=='private'){ 		
	    	code.style.display = 'block'; 	
	    }else{ 		
	    	code.style.display = 'none'; 	
	    }
	}
</script>
<style type="text/css">

	.join_hr {
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
			<br>
			<h3><b>이 챌린지에 참여하기 위한 조건은 무엇인가요?</b></h3>
			<hr class="join_hr" width="50%" color="red">
			
			
			<form id="form" method="post" action="member_challJoin_5.do">
			<h5><b>예치금</b></h5><!-- 필수항목 -->
			<div id="depositDefaultCont"><a>고정 예치금은 최소 1천원부터 가능합니다.(천원 단위 가능)</a></div>
			<div id="depositMaxCont"><a>최소 1만원 ~ 최대 20만원 (만원 단위 가능)</a></div>
			<input type="checkbox" id="deposit" checked>고정 예치금
			<br>
			<input id="depositDefault" name="depositDefault" width="30" placeholder="예) 1000">원
			<div id="depositMaxTextArea">~
			<input id="depositMax" name="depositMax" width="30" placeholder="예) 200000">원</div>
			
  			
  			<div id="private_code">
  			<br><br><!-- 비공개 챌린지에만 나타나는 항목 -->
			<h5><b>비공개 참여 코드</b></h5><!-- 필수항목 -->
			<a>프라이빗한 챌린지를 위해, 우리만의 코드를 정해보세요.</a><br>
			<textarea name="privateCode" cols="25" rows="1" id="title" placeholder="예) 1234, 우리는챌린저스"></textarea>
			</div>
			
			
			<br><br>
			<h5><b>최대 모집 인원 설정하기</b></h5>
			참가자 모집 인원을 제한하고 싶은 경우 설정할 수 있어요. <div id="maxPeopleCont">(최소 2명 ~ 최대 1,000명)</div>
			<!-- 체크박스 가운데 위치하게 하기 -->
			<div class="form-check form-switch">
			  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
			</div>
			<div id="maxPeopleTextArea"><input id="maxPeopleInput" name="maxPeople" width="10">명 </div>
			
			
			<br><br>
			<button type="button" class="btn btn-dark" onclick="history.back()">이전</button>
			<button type="submit" class="btn btn-dark">다음</button>
			<!-- 버튼은 비활성화되어있다가 필수항목 모두 선택하면 활성화되게 -->
			</form>
		</div>
		<br>
   		<div class="progress">
  			<div class="progress-bar" role="progressbar" aria-label="Example with label" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">50 %</div>
		</div>
		<br>
   <jsp:include page="/include/chall_bottom.jsp" />
</body>
</html>