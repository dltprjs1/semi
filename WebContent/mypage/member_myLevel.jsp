<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린저스 : 나의 레벨</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style type="text/css">
		

		/* 참가중인 챌린지 페이지 전체 CSS */
		.ongoingChall_container{
			display: grid;
			place-items: center;
			grid-template-columns: 1fr 3fr 1fr;
			grid-template-rows: 100px 400px 100px;	
			text-align: center;
		}
		
		.ongoingChall_title {
			grid-column: 2/3;
			grid-row: 1/2;	
			font-size: 24px;
			font-weight: bold;	
		}
		
		.ongoingChal_content{
			width: 800px;
			border-top: solid 3px #ff4d54;
			grid-column: 2/3;
			grid-row: 2/3;		
		}
		
		/* 레벨 업 조건 부트스트랩 모달창 CSS */
				
		.modal_btn{
			grid-column: 3/4;
			grid-row: 1/2;	
			
		}
		
		.btn-danger {
		    --bs-btn-color: #fff;
		    --bs-btn-bg: #ff4d54;
		    
		    }		
		
		.btn{
		    --bs-btn-font-size:	18px;
		}
		
		.fs-5 {
		    font-size: 1.25rem!important;
		    font-weight: bold;
		}	
		
		.modal-body h3{
			margin: 10px 10px 30px 10px;
			text-align: center;
			font-size: 18px;
			font-weight: bold;
		}	
		
		.charging_ul{
			list-style: none;
			font-size: 16px;
		}
		
		.charging_ul li {
			margin: 20px;
			text-align: left;
		}
		
		.charging_ul span{
			padding: 5px;
			border-radius: 10px;
			font-weight: bold;
		}
		
		.charging1{
			background-color: #FFC6C6;
			border: solid 1px #FF0000;
			color: #FF0000;
		}

		.charging2{
			background-color: #FAE0D4;
			border: solid 1px #FF5E00;
			color: #FF5E00;
		}

		.charging3{
			background-color: #FAECC5;
			border: solid 1px #FFBB00;
			color: #FFBB00;
		}

		.charging4{
			background-color: #E4F7BA;
			border: solid 1px #ABF200;
			color: #ABF200;
		}

		.charging5{
			background-color: #CEFBC9;
			border: solid 1px #1DDB16;
			color: #1DDB16;
		}

		.charging6{
			background-color: #D4F4FA;
			border: solid 1px #00D8FF;
			color: #00D8FF;
		}

		.charging7{
			background-color: #D9E5FF;
			border: solid 1px #0054FF;
			color: #0054FF;
		}

		.charging8{
			background-color: #DAD9FF;
			border: solid 1px #0100FF;
			color: #0100FF;
		}

		.charging9{
			background-color: #E8D9FF;
			border: solid 1px #5F00FF;
			color: #5F00FF;
		}

		.charging10{
			background-color: #FFD9EC;
			border: solid 1px #FF007F;
			color: #FF007F;
		}
		
		
/* 부트스트랩 적용 후 바뀌는 부분 조절(include) */		
	.container{
    margin-right: 0px;
    margin-left: 0px;	
    max-width: 100%;
    padding: 0px;
    box-sizing: content-box;
		}
	
    .search_text{
	box-sizing:content-box;
    }
    
    .rogoImg{
	box-sizing: content-box;
    }
    
    .top{
	margin: 16px 0px 16px 0px; 
    }
    
    .menu li{
    box-sizing: content-box;
    }
    
/* 부트스트랩 적용 후 바뀌는 부분(include) end */		
		
		
		/* 레벨 바 CSS */
		.progressBar_Box{
			display: grid;
			width: 100%;
			height: 100%;
			grid-template-columns: 1fr 3fr 1fr;
			grid-template-rows: 1fr 1fr 1fr;
			margin: 10px;	
		}
		
		.progressBar_Box h3{
   			grid-column: 1/3;
   			font-size: 20px;
   			font-weight: bold;
			grid-row: 1/2;		
			text-align: left;
			margin: 10px;
		}
		
		.levelBar {
			float:left;
		    appearance: none;
   			grid-column: 1/2;
			grid-row: 2/3;	
		}		
		.levelBar::-webkit-progress-bar {
  			background-color: #f0f0f0;
  			box-shadow: inset 3px 3px 10px #ccc;
  			border-radius: 20px;
  			width: 500px;
  			height: 30px;
		}
		
		.levelBar::-webkit-progress-value {
		  	border-radius: 20px;
		  	background: linear-gradient(to right, #FFB4B4, #ff4d54);
		}	
		
		.toGoal{
   			grid-column: 2/3;
			grid-row: 3/4;
			float: right;
		}	
	
</style>

</head>
<body>
	<jsp:include page="../include/chall_top.jsp" />

		<div class="ongoingChall_container" >

	
		
			<h2 class="ongoingChall_title" >나의 레벨</h2>
				<c:set var="dto" value="${dto }" />
				<article class="ongoingChal_content">
					<div class = progressBar_Box>
						<div class= modal_btn>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
						  레벨 업 조건
						</button>
						</div>
						
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h2 class="modal-title fs-5" id="exampleModalLabel">레벨업 조건</h2>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
								  <h3>경험치별 레벨</h3>
								  <ul class="charging_ul">
								  	<li><span class="charging1">♥ 충전도 10%</span> 누적 경험치 0~ </li>
								  	<li><span class="charging2">♥ 충전도 20%</span> 누적 경험치 100~ </li>
								  	<li><span class="charging3">♥ 충전도 30%</span> 누적 경험치 300~ </li>
								  	<li><span class="charging4">♥ 충전도 40%</span> 누적 경험치 1,000~ </li>
								  	<li><span class="charging5">♥ 충전도 50%</span> 누적 경험치 3,000~ </li>
								  	<li><span class="charging6">♥ 충전도 60%</span> 누적 경험치 10,000~ </li>
								  	<li><span class="charging7">♥ 충전도 70%</span> 누적 경험치 30,000~ </li>
								  	<li><span class="charging8">♥ 충전도 80%</span> 누적 경험치 100,000~ </li>
								  	<li><span class="charging9">♥ 충전도 90%</span> 누적 경험치 300,000~ </li>
								  	<li><span class="charging10">♥ 충전도 100%</span> 누적 경험치 1,000,000~ </li>
								  	
								  </ul>
						      </div>
						    </div>
						  </div>
						</div>				
						
						<h3>현재 레벨 - </h3>
						
						<progress class="levelBar" value="20" max="100"></progress>
						<br>
						<br>
						<div class="toGoal">
						<font>현재 경험치 : ${dto.getMem_xp() }XP</font>
						<br>
						<font>레벨업까지 남았습니다!</font>
						</div>
						
					</div>
					
				</article>
				
		
		</div>
	
	<jsp:include page="../include/chall_bottom.jsp" />
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>	
</body>
</html>