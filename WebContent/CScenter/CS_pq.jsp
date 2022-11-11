<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
		int mem_num = (int)session.getAttribute("memberNum");
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- toastr -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="../searchJS/location.js"></script>
<script type="text/javascript" src="searchJS/location.js"></script>
<!-- bootstrp -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<!-- js & css -->
<link rel="stylesheet" href="CScenter/CScenter.css?a">
</head>
<body>

	<jsp:include page="../include/chall_top.jsp" />
	<jsp:include page="../include/CS_top.jsp" />
	
	<script type="text/javascript">
						
		$(function(){
			
			$.ajaxSetup({
				ContentType: "application/x-www-form-urlencoded; charset=UTF-8",
				type : "post"								
			}); // ajaxSetup 끝
			
			$.ajax({
				url : "<%=request.getContextPath()%>/CScenter/CS_pq_list.jsp",
				data : {
					pq_user_no : <%= mem_num %>
				},
				datatype : "html",
				success : function(data){
					$(function(){
						$("#pq_div").html(data);
					});
				},
				error : function(){
					toastr.warning('데이터 통신 에러');
				}
			});			
			
		});
			
	</script>
	
	<div id = "pq_div">
	</div>		
	<jsp:include page="../include/CS_bottom.jsp" />
	<jsp:include page="../include/chall_bottom.jsp" />
</body>
</html>
