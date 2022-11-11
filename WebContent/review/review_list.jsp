<%@page import="com.review.model.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%
    	List<ReviewDTO> reviewList = (List<ReviewDTO>)request.getAttribute("reviewList"); 
    
    int currentPage = (int)request.getAttribute("currentPage");
    int rowsize = (int)request.getAttribute("rowsize");
    int block = (int)request.getAttribute("block");
    int totalRecord = (int)request.getAttribute("totalRecord");
    int allPage = (int)request.getAttribute("allPage");
    int startNo = (int)request.getAttribute("startNo");
    int endNo = (int)request.getAttribute("endNo");
    int startBlock = (int)request.getAttribute("startBlock");
    int endBlock = (int)request.getAttribute("endBlock");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(function(){
	
	$(".review-wrap").click(function(){
		$(this).next("#modalBox").modal('show');
	});
});

</script>

</head>
<body>

<c:set var="list" value="<%=reviewList %>" />

<c:set var="page_num" value="<%= currentPage%>"/>

<c:set var="rowsize" value="<%=rowsize %>" />
<c:set var="block" value="<%=block %>" />
<c:set var="totalRecord" value="<%=totalRecord %>" />
<c:set var="allPage" value="<%=allPage %>" />
<c:set var="startNo" value="<%= startNo %>" />
<c:set var="endNo" value="<%= endNo %>" />
<c:set var="startBlock" value="<%=startBlock %>" />
<c:set var="endBlock" value="<%= endBlock %>" />

<div id="reviewList">

	<c:forEach var="dto" items="${list }" varStatus="status">
		<div class="review-wrap">
			<input type="hidden" value="${dto.getReview_mem_num() }">
			<div><span>${dto.getReview_mem_name() }</span>님의 리뷰입니다.</div>
			<div class="wrap-star">별점 : ${dto.getReview_star() }</div>
			<div class="review-content-wrap">
				<c:if test="${dto.getReview_content().length() > 60 }">
					<div class="content">${dto.getReview_content().substring(0, 60) } …</div>
					<div class="more">자세히보기</div>
				</c:if>
				<c:if test="${dto.getReview_content().length() <= 60 }">
					<div class="content">${dto.getReview_content() } </div>
				</c:if>
			</div>
		</div>
		<!-- 모달 -->
		<div class="modal fade" id="modalBox">
		  <div class="modal-dialog modal-dialog-centered" >
		    <div class="modal-content">
		      <div class="modal-body">
		        <p>${dto.getReview_content()}</p>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		<!-- 모달 끝 -->
	</c:forEach>
	
	<%-- <c:forEach begin="${startNo }" end="${endNo }" step="1" var="a">
		<div class="review-wrap">
			<input type="hidden" value="${list[a].getReview_mem_num() }">
			<div><span>${list[a].getReview_mem_name() }</span>님의 리뷰입니다.</div>
			<div class="wrap-star">별점 : ${list[a].getReview_star() }</div>
			<div class="review-content-wrap">
				<c:if test="${list[a].getReview_content().length() > 60 }">
					<div class="content">${list[a].getReview_content().substring(0, 60) } …</div>
					<div class="more">자세히보기</div>
				</c:if>
				<c:if test="${list[a].getReview_content().length() <= 60 }">
					<div class="content">${list[a].getReview_content() } </div>
				</c:if>
			</div>
		</div>
		<!-- 모달 -->
		<div class="modal fade" id="modalBox">
		  <div class="modal-dialog modal-dialog-centered" >
		    <div class="modal-content">
		      <div class="modal-body">
		        <p>${list[a].getReview_content()}</p>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		<!-- 모달 끝 -->
	</c:forEach> --%>
	
</div>

<script>

function goReviewPage(page){
	
	$.ajax({
		url : "<%= request.getContextPath() %>/review_list.do?page="+page,
		datatype : "html",
		success : function(data){
			$("#reviewContent").html(data);
		},
		error : function(){
			toastr.warning('데이터 통신 에러');
		}		
	});
	
} // goReviewPage() 끝


</script>

<div>
	<ul class="pagination">
	  	<c:if test="${page_num > block }">
		    <li><a class='page-link' href="#" onclick="goReviewPage(1)"><i class="bi bi-chevron-double-left"></i></a></li>
		    <li><a class='page-link' href="#" onclick="goReviewPage(${startBlock}-1)"><i class="bi bi-chevron-left"></i></a></li>
	    </c:if>
	    <c:forEach begin="${startBlock }" end="${endBlock }" var="i">
			<c:if test="${i == page_num}">
				<li class='page-item active' aria-current="page"><a class='page-link' href="#" onclick="goReviewPage(${i})">${i }</a>
			</c:if>
			<c:if test="${i != page_num  }">
				<li class='page-item' aria-current="page"><a class='page-link' href="#" onclick="goReviewPage(${i})">${i }</a>
			</c:if>
		</c:forEach>
		
	    <c:if test="${endBlock < allPage}">
			 <li><a class='page-link' href="#" onclick="goReviewPage(${endBlock}+1)"><i class="bi bi-chevron-right"></i></a>
			 <li><a class='page-link' href="#" onclick="goReviewPage(${allPage})"><i class="bi bi-chevron-double-right"></i></a></li>
		</c:if>
	    
	  </ul>
</div>

</body>
</html>