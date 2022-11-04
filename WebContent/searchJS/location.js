/**
 * 
 */
$(document).ready(function(){
	
	$.ajaxSetup({
		ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type : "post"		
	});
	
	
	// 해시코드 변경 함수
	function getHash(keyword){
		
		document.location.hash = "search/keyword=" +keyword;
		
	}// getHash() end
	
	
	// 검색 버튼 클릭 시 리스트 출력 함수
	function getSearchData(key){
		
		let cycle = "";
		let duration = "";
		let category = "";		
		$.ajax({
			
			url : "/Semi_Challengers/search/search.jsp",
			datatype : "html",
			data : {keyword : key,
					optionCy :cycle,
					optionDu : duration,
					optionCa : category
					},
			async : false,
			success : function(data){
				
				console.log('함수 keyword >>> ' +key);
				
				$("#art").children().remove();
				$("#art").html(data);
				document.title = "챌린지 검색";
				
			
				
			},
			erroe : function(){
				alert('실패');
			}
			
		});
		
	} // getSearchData() end
	 
/*	// 검색 옵션 설정 시 리스트 출력 함수
	function getSearchListOption(keyword, cycle, duration, category){
	
	
		$.ajax({
			url : "/Semi_Challengers/search_list_option.do",
			data : {
				optionCy : cycle,
				optionDu : duration,
				optionCa : category,
				keyword : keyword
				},
			datatype : "xml",
			success : function(data){
				
				console.log('optionCy >>> ' +cycle);
				console.log('optionDu >>> ' +duration);
				console.log('optionCa >>> ' +category);
				console.log('에이젝스 성공 >>> ' +data);
			
				let table = "";
				
				$(data).find("chall_list").each(function() {
					table += "<tr>";
					table += "<td>" +$(this).find("chall_title").text()+ "</td>";
					table += "<td>" +$(this).find("chall_cont").text()+ "</td>";
					table += "</tr>";
					
				});
			
				$(".search_list tr:eq(0)").after(table);
				
				$("#load").children().remove();
				$("#load").html($(".search_list"));
				
			},
			error : function(){
				alert('옵션 선택 불러오기 실패');
			}		
		});
		
		
	} //getSearchListOption() end*/

				
	function locationSearchOption(keyword, cycle, duration, category){
		
		console.log('=====locationSearchOption실행=====');
		
		$.ajax({
			
			url : "/Semi_Challengers/search/search.jsp",
			data : {
				optionCy : cycle,
				optionDu : duration,
				optionCa : category,
				keyword : keyword
				},
			datatype : "html",
			async : false,
			success : function(data){
				
				console.log('옵션리스트 성공');
				$("#load").children().remove();
				$("#load").html(data);
			},
			error : function(){
				alert('옵션리스트 통신 에러');
			},
		});
	}
	
	
	// Ajax 페이지 이동 구현
	$(window).on("hashchange", function(){
		
		let hash = document.location.hash;
		
		console.log('해쉬 변경 이벤트 시작 main hash >>>' +hash);
		
		let decodeHashURI = decodeURI(hash);
		
		console.log('decode >>> ' +decodeHashURI);
		
		let regEx = /#([a-zA-z]+)/;	
		
		// /#([a-zA-z]+)\/([ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+)_([ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+)=([ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+)/i;
		
		let match = decodeHashURI.match(regEx);
		
		if(hash!=""){
			if(match){
				let category = match[1];
				
				if(category == "search"){
					
					let regEx = /#([a-zA-z]+)\/keyword=([ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+)/i;
					let match = decodeHashURI.match(regEx);
					let keyword = match[2];
					
					console.log('=====search 해쉬변경=====')
					console.log('match >>> ' +match);
					console.log('category >>> ' +category);	
					console.log('keyword >>>' +keyword);
					
					getSearchData(keyword);
					
				}
			}
		}else{
			//locationMain();
		}
			
		
	}); // hashchange end
	

	
	// Enter 클릭
	$("#search_text").on("keydown", function(key){
		if(key.keyCode == 13){
			$("#search_btn").click();	
		}
	});
	
	
	// 검색 버튼 클릭 이벤트
	$("#search_btn").on("click", function(){
		
		var keyword = $("#search_text").val();
		
		if(keyword == ""){
			alert('검색어를 입력해주세요');
		}else{
			getHash(keyword);			
		}
		

	}); // 검색클릭 이벤트 end
	


}); // 본문 end




/*//새로고침 이벤트 
$(window).bind('pageshow', function(e){
	
	function locationMain(){
		$.ajax({
			url : "/Semi_Challengers/main.jsp",
			datatype : "html",
			success : function(data){
				
				
				$("body").children().remove();
				$("body").html(data);
				document.title ="메인 페이지";
				document.location.hash = "";
			}
		});
	}// locationMain() end
	
		// 검색 버튼 클릭 시 리스트 출력 함수
	function getSearchData(key){
		
		let cycle = "";
		let duration = "";
		let category = "";		
		$.ajax({
			
			url : "/Semi_Challengers/search/search.jsp",
			datatype : "html",
			data : {keyword : key,
					optionCy :cycle,
					optionDu : duration,
					optionCa : category
					},
			async : false,
			success : function(data){
				
				console.log('함수 keyword >>> ' +key);
				
				$("#art").children().remove();
				$("#art").html(data);
				document.title = "챌린지 검색";
			},
			erroe : function(){
				alert('실패');
			}
			
		});
		
	} // getSearchData() end
	
	if(e.originalEvent.persisted){
		alert('pageshow 실행');
	}else{
		
		alert('pageshw else 실행');
		let hash = document.location.hash;
		
		console.log('해쉬 변경 이벤트 시작 main hash >>>' +hash);
		
		let decodeHashURI = decodeURI(hash);
		
		console.log('decode >>> ' +decodeHashURI);
		
		let regEx = /#([a-zA-z]+)/;	
		
		// /#([a-zA-z]+)\/([ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+)_([ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+)=([ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+)/i;
		
		let match = decodeHashURI.match(regEx);
		
		if(hash!=""){
			if(match){
				
				let category = match[1];
				
				if(category == "search"){
					alert('새로 열린 페이지 : search');
					let regEx = /#([a-zA-z]+)\/keyword=([ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+)/i;
					let match = decodeHashURI.match(regEx);
					let keyword = match[2];
					
					console.log('=====search 해쉬변경=====')
					console.log('match >>> ' +match);
					console.log('category >>> ' +category);	
					console.log('keyword >>>' +keyword);
					
					getSearchData(keyword);
					
				}
			}
		}else{
			alert('새로 열린 페이지 : 메인');
			document.location.hash = "";
			locationMain();
		}
	}
});
*/
