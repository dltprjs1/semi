<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/chall_top.jsp" />
	<jsp:include page="../include/CS_top.jsp" />
			<table>  
				<tr>
					<td colspan="2">
						<h1>공지사항</h1>
					</td>
				</tr>

				<c:set value="${NoticeList}" var="list" /> 
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<tr>
								<c:if test="${dto.getNotice_category().equals('notice')}">
									<td>
										<span>[공지]</span>
										&nbsp;
										<a href="<%=request.getContextPath()%>/CS_notice_content.do?no=${dto.getNotice_num()}">
										${dto.getNotice_title() }
										</a>
									</td>
								</c:if>
								<c:if test="${dto.getNotice_category().equals('event')}">
										<span>[이벤트]</span>
										&nbsp;
										<a href="<%=request.getContextPath()%>/CS_notice_content.do?no=${dto.getNotice_num()}">
										${dto.getNotice_title() }
										</a>
								</c:if>
							<td>
								${dto.getNotice_regdate().substring(0, 10) }
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list }">
					<tr>
						<td>조회할 공지사항이 없습니다.</td>
					</tr>
				</c:if>

			</table>
	<jsp:include page="../include/CS_bottom.jsp" />
	<jsp:include page="../include/chall_bottom.jsp" />

</body>
</html>