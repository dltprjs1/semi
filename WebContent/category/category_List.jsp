<%@page import="com.category.medel.CategoryDTO"%>
<%@page import="com.category.medel.SubDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.list li {
		display : inline-block; 
		
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<jsp:include page="../include/admin_top.jsp"/>
	<div align="center">
	<c:set var="list" value="${list }"/>
		<h3>카테고리 리스트</h3>
		<img id="eco" src="<%=request.getContextPath() %>/uploadFile/eco.png" width="200" height="200">
		<span id="ecc"></span>
		<img id="eto" src="<%=request.getContextPath() %>/uploadFile/etc.png" width="200" height="200">
		<span id="etc"></span>
		<div id="3">
		<img id="food" src="<%=request.getContextPath() %>/uploadFile/food.png" width="200" height="200">
		<span id="foc"></span>
		<img id="hobby" src="<%=request.getContextPath() %>/uploadFile/hobby.png" width="200" height="200">
		<span id="hoc"></span>
		<img id="life" src="<%=request.getContextPath() %>/uploadFile/life.png" width="200" height="200">
		<span id="lic"></span>
		<div id="6">
		<img id="mind" src="<%=request.getContextPath() %>/uploadFile/mind.png" width="200" height="200"><br>
		<span id="mic"></span>
		<img id="run" src="<%=request.getContextPath() %>/uploadFile/run.png" width="200" height="200">
		<span id="ruc"></span>
		<img id="study" src="<%=request.getContextPath() %>/uploadFile/코딩-이모지.jpg" width="200" height="200">
		<span id="stc"></span>
	</div>
	<jsp:include page="../include/chall_bottom.jsp"/>
</body>
<script type="text/javascript">
	
			
	$(document).ready(function(){
		$.ajaxSetup({
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post"
		});
		
		function sub(s_c){
			$.ajax({
				
				url : "/Semi_Challengers/category/sub_category_ajax.jsp",
				data : {category_num : s_c},
				datatype : "xml",
				success : function(data){
					let li = "";
						li += "<ul class = 'list'>";
					$(data).find("sub").each(function(){
						li += "<li>"+$(this).find("sub_category_name").text()+"</li>&nbsp;";
					});
						li += "</ul>"
						if(s_c == 1){$("#ruc").append(li);}
						if(s_c == 2){$("#foc").append(li);}
						if(s_c == 3){$("#lic").append(li);}
						if(s_c == 4){$("#mic").append(li);}
						if(s_c == 5){$("#hoc").append(li);}
						if(s_c == 6){$("#ecc").append(li);}
						if(s_c == 7){$("#etc").append(li);}
						if(s_c == 8){$("#suc").append(li);}
						if(s_c == 9){$("#sec").append(li);}
				},
				error : function(){
					alert('데이터 통신 에러')
				}
			});
		}
		$("#eco").on("click",function(){
			var s_c = 6;
			sub(s_c);
		});
		$("#eto").on("click",function(){
			var s_c = 7;
			sub(s_c);
		});
		$("#run").on("click",function(){
			var s_c = 1;
			sub(s_c);
		});
		$("#food").on("click",function(){
			var s_c = 2;
			sub(s_c);
		});
		$("#life").on("click",function(){
			var s_c = 3;
			sub(s_c);
		});
		$("#mind").on("click",function(){
			var s_c = 4;
			sub(s_c);
		});
		$("#hobby").on("click",function(){
			var s_c = 5;
			sub(s_c);
		});
		$("#study").on("click",function(){
			var s_c = 8;
			sub(s_c);
		});
		$("#selfcare").on("click",function(){
			var s_c = 9;
			sub(s_c);
		});

	});
	
	
</script>
</html>