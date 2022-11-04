$(function(){

	$.ajaxSetup({
		ContentType: "application/x-www-form-urlencoded; charset=UTF-8",
		type : "post"								
	}); // ajaxSetup 끝
	
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

});