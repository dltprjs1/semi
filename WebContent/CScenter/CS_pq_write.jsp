<%@page import="java.util.List"%>
<%@page import="com.cs.model.CScenterDAO"%>
<%@page import="com.cs.model.Q_categoryDTO"%>
<%@page import="com.user.model.UserDTO"%>
<%@page import="com.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	int userNum = Integer.parseInt(request.getParameter("pq_user_no").trim());
	UserDAO dao = UserDAO.getinstance();
	UserDTO dto = dao.getMemberInfo(userNum);
	
	CScenterDAO csdao = CScenterDAO.getinstance();
	List<Q_categoryDTO> qcatelist = csdao.getQ_categoryList();

%>
    
<div>
	<c:set value="<%=dto %>" var="userInfo"/>
	<c:set value="<%=qcatelist %>" var="qcatelist" />
	
	<form>
		<div><span>${userInfo.getMem_name() }님의 문의입니다.</span></div>
		<input type="hidden" id="pq_user_no" value="${userInfo.getMem_num() }">
		<br>
		
		<div>
		<span>문의유형</span>
			<select id="pq_cate">
				<c:forEach var="qcate" items="${qcatelist }">
					<option value="${qcate.getQ_category_num()}">${qcate.getQ_category_type()}</option>
				</c:forEach>
			</select>
		</div>
		
		<br>
		
		<div>
		<span>제목</span>
		<input type="text" id="pq_title" required>
		</div>
		
		<div id="pq_regdate">
		<span>등록일</span>
		<span></span>
		</div>
		
		<div>
		<textarea id="pq_content" required></textarea>
		</div>
		
		<div>
		<input type="button" value="등록" onclick="insertPQ()">
		<input type="button" value="취소" onclick="if(confirm('정말 취소하시겠습니까? 작성한 내용이 모두 사라집니다.')){ location.href='CS_privateQ.do' } else { return; }">
		</div>
	</form>
</div>

<script>
	let today = new Date();
	console.log("오늘 날짜 >>> "+today.toISOString().substring(0, 10));
	document.querySelector("#pq_regdate span:nth-child(2)").innerHTML = today.toISOString().substring(0, 10);
	
	function getPraviteQList() {
		$.ajax({
			url : "<%= request.getContextPath()%>/CS_privateQ_list.do",
			data : {
				pq_user_no : ${userInfo.getMem_num() }
			},
			datatype: "xml",
			success : function(data){
				
				let result = "";
				let table = "";
				let answerStatus = "";
				let answer = "";
				
				table = "<div id = 'PQ_content'><div id='PQ_table_th'>"
					+"<span>접수번호</span>"
					+"<span>문의</span>"
					+"<span>등록일</span>"
					+"<span>상태</span>"
					+"</div><div id='PQ_Accordian_wrap'>"
					+"<div align ='center'>"
					+"<p><span>아직 일대일 문의를 등록하지 않으셨네요!</span></p>"
					+"<p><span>오른쪽 하단의 문의하기 버튼을 이용해주세요.</span></p>"
					+"</div></div></div>"
					+"<div id='PQ_write_button'>"
					+"<button onclick='pqWrite()'>문의하기</button></div>"
				
				$("#PQ_content").empty();
				$("#PQ_content").append(table);
				
				if ($(data).find("regdate").text() != null){
					$("#PQ_Accordian_wrap").empty();
				}

				$(data).find("PQNA").each(function(){
					
					if($(this).find("answerCont").text() == "null") {
							answerStatus = "<font color='#bd3232'>접수중</font>";
							answer = "<p>안녕하세요, 챌린저스입니다.</p>"
							+ "<p>고객님의 일대일 문의가 접수되었습니다.</p>"
							+ "<p>담당자가 확인하여 답변을 작성 중에 있습니다.</p>"
							+ "<p>빠르게 답변드릴 수 있도록 노력하겠습니다.</p>"
							+ "<p>감사합니다.</p>";
							
						}else if($(this).find("answerCont").text() != "null") {
							answerStatus = "<font color='#324bbd'>답변완료</font>";
							answer = "답변 등록일 : "+$(this).find("answerRegdate").text().substring(0, 10)+"<br><br>"+$(this).find("answerCont").text();
						}
					
					result +=  "<div class='question'><span>"+$(this).find("num").text()+"</span>"				
					result +=  "<span>"+$(this).find("title").text()+"</span>"
					result +=  "<span>"+$(this).find("regdate").text().substring(0,10)+"</span>"
					result +=  "<span>"+answerStatus + "</span></div>"
					result += "<div class='answer'>"+"<span>"+$(this).find("content").text()+"</span>"+"<br><br>"+
								"<div style='background-color : lightgray;'><span>"+answer+"</span></div>"+"</div>";
					
				});
				
				$("#PQ_Accordian_wrap").append(result);
				
				$(".question").click(function(){
					if ($(this).hasClass('show')){
						$(this).next(".answer").slideUp(200);
						$(this).removeClass('show');
					}else {
						$(this).next(".answer").stop().slideDown(200);
						$(this).addClass('show');
					}
				});
				
				
			},
			error : function(){
				alert('데이터 통신 에러');
			}
		}); // ajax 끝

	} // function getPraviteQList(); 끝 

	function insertPQ(){
		
		$.ajax({
			url : "/Semi_Challengers/CS_privateQ_insert.do",
			data : {
				pq_user_num : $("#pq_user_no").val(),
				pq_title : $("#pq_title").val(),
				pq_content : $("#pq_content").val(),
				pq_cate_no : $("#pq_cate").val()
			},
			datatype : "text",
			success : function(data){
				if (data > 0) {
					alert('일대일문의 등록 성공');
					getPraviteQList();
				}else {
					alert('문의 등록 실패')
				}
			},
			error : function(){
				alert('데이터통신에러');
			}
			
		});
	}
	
</script>
