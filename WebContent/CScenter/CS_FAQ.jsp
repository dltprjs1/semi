<%@page import="com.cs.model.FAQDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <% pageContext.setAttribute("replaceEnter", "\n"); %>
	
	<jsp:include page="../include/chall_top.jsp" />
	<jsp:include page="../include/CS_top.jsp" />

				
			<table class="full_table" id="FAQ_table">
				<tr>
					<td colspan="2">
						<h1>FAQ</h1>
					</td>
				</tr>

				<c:set value="${FAQList}" var="list" />
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<tr>
						<td>
						<div id="FAQ_Accordian_wrap">  
							<div class="question">
								<span class="q_cate">
									<c:if test="${dto.getFAQ_category_num() == 1}">
										[인증]
									</c:if>
									<c:if test="${dto.getFAQ_category_num() == 2}">
										[결제]
									</c:if>
									<c:if test="${dto.getFAQ_category_num() == 3}">
										[상금]
									</c:if>
								</span>
								
								<span class="q_title">
									${dto.getFAQ_title() }
								</span>
								<div class="q_arrow-wrap">
									<div class="q_arrow-top">
										<i class="bi bi-arrow-up"></i>
									</div>
									<div class="q_arrow-bottom">
										<i class="bi bi-arrow-down"></i>
									</div>
								</div>
							</div>
							
							<div class="answer">
								<span>
									${fn:replace(dto.getFAQ_content(), replaceEnter, "<br/>") }
								</span>
							</div>
						</div>
						</td>
						</tr>
						</c:forEach>
				</c:if>
				<c:if test="${empty list }">
					<tr>
						<td>조회할 FAQ가 없습니다.</td>
					</tr>
				</c:if>

			</table>
	<jsp:include page="../include/CS_bottom.jsp" />
	<jsp:include page="../include/chall_bottom.jsp" />