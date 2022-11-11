<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	<%-- function getReviewList(){
		$.ajax({
			url : "<%=request.getContextPath() %>/review_list.do",
			datatype : "json",
			success : function(data){
				
				const obj = JSON.parse(data);
				
				$.each(obj, function(index, item){
					/* let content = "<span> json 인덱스 : "+index+"<span>"
								+ "<div><li> 리뷰 등록 번호 : "+item.review_num+"</li>"
								+ "<li> 챌린지 번호 : "+item.review_chall_num+"</li>"
								+ "<li> 글쓴이 : "+item.review_mem_num+"</li>"
								+ "<li> 내용 : "+item.review_content+"</li>"
								+ "<li> 별점 : "+item.review_star+"</li>"
								+ "<li> 등록일 : "+item.review_regdate+"</li>"; */
					
					$(".review-wrap:nth-child(1) span").html(item.review_mem_num);
				});
				
			},
			error : function(){
				toastr.warning('데이터 통신 오류');
			}
		});	
	}
	
	$(function(){
		getReviewList();
	}); --%>
	
</script>

</head>
<body>

<div id="reviewList" style="display : grid; width : 60%; grid-template-columns: 1fr 1fr 1fr; ">
	<div class="review-wrap">
		<div><span></span>님의 리뷰입니다.</div>
		<div class="wrap-star"></div>
		<div class="review-content-wrap">
			<div class="more">더보기</div>
			<div class="content"></div>
		</div>
	</div>
</div>
</body>
</html>