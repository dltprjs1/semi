<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
		int mem_num = (int)session.getAttribute("memberNum");
	%>
	
	<jsp:include page="../include/chall_top.jsp" />
	<jsp:include page="../include/CS_top.jsp" />

			<table class="full_table" id="PQ_table">
				<tr>
					<td colspan="2">
						<h1>일대일문의</h1>
					</td>
				</tr>
				<tr>
					<td>접수번호</td>
					<td>문의</td>
					<td>등록일</td>
					<td>상태</td>
				</tr>
				
				<%-- <c:set value="${p_q_list}" var="list" />
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>접수번호</td>
							<td>문의</td>
							<td>날짜</td>
							<td>상태</td>
						</tr>
						<tr>
							<td>${dto.getP_q_num() }</td>
							<td class="question">
								<a href="<%=request.getContextPath() %>/CS_p_q_a.do?no=${dto.getP_q_num()}">
									${dto.getP_q_title() }
								</a>
							</td>
							
							<td>${dto.getP_q_regdate().substring(0,10) }</td>
							<c:if test="${empty dto.getP_q_answer_cont() }">
								<td>접수중</td>
							</c:if>
							<c:if test="${!empty dto.getP_q_answer_cont() }">
								<td>답변완료</td>
							</c:if> 
						</tr>
						<tr class="answer">
							<td>답변 내용</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty list }">
					<tr>
						<td>문의 내용이 없습니다.</td>
					</tr>
				</c:if> --%>
				
			</table>
			
				
			<script type="text/javascript">
							
				$(document).ready(function(){
					$.ajaxSetup({
						ContentType: "application/x-www-form-urlencoded; charset=UTF-8",
						type : "post"								
					});

					function getPraviteQList() {
						$.ajax({
							url : "<%= request.getContextPath()%>/CS_privateQ_list.do",
							data : {
								pq_user_no : <%= mem_num%>,
							},
							datatype: "xml",
							success : function(data){
								$("#PQ_table tr:gt(1)").remove();
								let table = "";
								let answerStatus = "";
								$(data).find("PQNA").each(function(){
									table += "<tr>";
									table += "<td>"+$(this).find("num").text()+"</td>";				
									table += "<td><div class='question'><span class='q_title'>"+$(this).find("title").text()+"</span></div></td>";				
									table += "<td>"+$(this).find("regdate").text().substring(0,10)+"</td>";				
										if($(this).find("answerCont").text() != "null") {
											answerStatus = "답변완료";
										}else{
											answerStatus = "접수중";
										}
									table += "<td>"+ answerStatus + "</td>";
									table += "</tr>";
									table += "<tr>";
									table += "<td colspan='4'><div class='answer'>"+$(this).find("answerCont").text()+"</div></td>"
									table += "</tr>"
										
								});
								$("#PQ_table tr:eq(1)").after(table);
							},
							error : function(){
								alert('데이터 통신 에러');
							}
							
						});
					}  
					
					getPraviteQList();
					
				});
							
				</script>
			
			
	<jsp:include page="../include/CS_bottom.jsp" />
	<jsp:include page="../include/chall_bottom.jsp" />