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
		<br>
		
		<div>
		<span>문의유형</span>
			<select>
				<c:forEach var="qcate" items="${qcatelist }">
					<option value="${qcate.getQ_category_num()}">${qcate.getQ_category_type()}</option>
				</c:forEach>
			</select>
		</div>
		
		<br>
		
		<div>
		<span>제목</span>
		<input type="text">
		</div>
		
		<div id="pq_regdate">
		<span>등록일</span>
		<span></span>
		</div>
		
		<div>
		<textarea></textarea>
		</div>
		
		<div>
		<input type="submit" value="등록" onclick="insertPQ()">
		<input type="button" value="취소" onclick="if(confirm('정말 취소하시겠습니까? 작성한 내용이 모두 사라집니다.')){ location.href='CS_privateQ.do' } else { return; }">
		</div>
	</form>
</div>

<script>
	let today = new Date();
	console.log("오늘 날짜 >>> "+today.toISOString().substring(0, 10));
	document.querySelector("#pq_regdate span:nth-child(2)").innerHTML = today.toISOString().substring(0, 10);
</script>

<script>

	function insertPQ(){
	
		$.ajax({
			
			
		});
	}
	
</script>