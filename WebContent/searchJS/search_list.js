/**
 * 검색 목록을 가져오는 Ajax
 */
$(document).ready(function(){
	
	$.ajaxSetup({
		ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type : "post"		
	});
	console.log('========search_list.js 실행됨=======');
	let keyword = $("#text").val();
	
	
	function getHash(strCy, strDu, strCa, keyword){
		
		document.location.hash = "option/keyword=" +keyword+ "&cycle=" +strCy+ "&duration=" +strDu+ "&category=" +strCa;
		
	}
	
	function getHashKey(keyword){
		
		document.location.hash = "search/keyword=" +keyword;
		
	}
	
	function getContextPath(){
		let path = location.href.indexOf(location.host)+location.host.length;
		
		return location.href.substring(path, location.href.indexOf('/', path+1));
	}
	
	function check(str){
		
		if(typeof str == "undefined" || str == null || str == "")
			return true;
		else
			return false ;
	}
	
	function getSearchList(keyword){

		//var formData = $("#form_searchText, #from_searchOption").serialize();
		
		console.log("searchList 파라메터 >>>" +keyword);
		
		$.ajax({
			
			url : "/Semi_Challengers/search_list.do",
			data : {"keyword" : keyword},
			datatype : "xml",
			async : false,
			success : function(data){
				
				$(".search_item tr:gt(0)").remove();
			
				let table = "";
				let count = 0;
				table += "<tr>";
				$(data).find("chall_list").each(function() {
					count += 1;
					
					/*table += "<td><a href='" +getContextPath()+ "/search/search_content.jsp'><br><br>";*/
					table += "<td><a href='" +getContextPath()+ "/search_content.do?num=" +$(this).find("chall_num").text()+ "'><br><br>";	
					table += $(this).find("chall_title").text()+ "<br>";
					table += $(this).find("chall_cycle").text()+ "&nbsp;";
					table += $(this).find("chall_duration").text()+ "&nbsp;";
					
					if(count%3==0){
						table += "</tr>";
						table += "<tr>";
					}
				});
				
				table += "</tr>";
				$(".search_item").append(table);
			},
			error : function(){
				alert('검색 목록 불러오기 실패');
			}
			
			
		});
	} // getSearchList end
	
		// 검색 옵션 설정 시 리스트 출력 함수
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
			
				$(".search_item tr:gt(0)").remove();
			
				let table = "";
				let count = 0;
				table += "<tr>";
				$(data).find("chall_list").each(function() {
					count += 1;
					table += "<td><a href='" +getContextPath()+ "/search_content.do?num=" +$(this).find("chall_num").text()+ "'><br><br>";		
					table += $(this).find("chall_title").text()+ "<br>";
					table += $(this).find("chall_cycle").text()+ "&nbsp;";
					table += $(this).find("chall_duration").text()+ "&nbsp;";
					
					if(count%3==0){
						table += "</tr>";
						table += "<tr>";
					}
				});
				
				table += "</tr>";
				$(".search_item").append(table);
				
			},
			error : function(){
				alert('옵션 선택 불러오기 실패');
			}		
		});
		
		
	} //getSearchListOption() end
	
	
	function testOption(keyword){
	
		let arrCy = [];
		let arrDu = [];
		let arrCa = [];
		
		let sizeCy = $("input:checkbox[name='cycle']:checked").length;
		let sizeDu = $("input:checkbox[name='duration']:checked").length;
		let sizeCa = $("input:checkbox[name='category']:checked").length;
		if(sizeCy>=1){
			
			$("input:checkbox[name='cycle']:checked").each(function(){
			
			arrCy.push($(this).val());
			
			});
		}
		
		console.log('배열arrCy >>> ' +arrCy);	
		
		if(sizeDu>=1){
			
			$("input:checkbox[name='duration']:checked").each(function(){
			
			arrDu.push($(this).val());
			
			});
		}
		
		console.log('배열arrDu >>> ' +arrDu);
		
		if(sizeCa>=1){
			$("input:checkbox[name='category']:checked").each(function(){
			
			arrCa.push($(this).val());
			
			});
		}
		console.log('배열 arrCa >>> ' +arrCa);
		
		let strCy = arrCy.join(',');
		let strDu = arrDu.join(',');
		let strCa = arrCa.join(',');
		
		console.log('변환 strCy >>> ' +strCy);
		console.log('변환 strDu >>>' +strDu);
		console.log('변환 strCa >>>' +strCa)
		
		getHash(strCy, strDu, strCa, keyword);
			
		
	} // testOption() end
	
	
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
				
				if(category == "option"){
					let regEx = /#([a-zA-z]+)\/keyword=(.*)&cycle=(.*)&duration=(.*)&category=(.*)/i;
					let match = decodeHashURI.match(regEx);
					let key = match[2];
					let cycle = match[3];
					let duration = match[4];
					let category = match[5];
					
					console.log('=====option 해쉬변경=====')
					console.log('match >>> ' +match);
					console.log('cycle >>> ' +cycle);
					console.log('category >>> ' +category);	
					console.log('keyword >>>' +keyword);
					
					getSearchListOption(key, cycle, duration, category);
					
				}
			}
		}
			
		
	}); // hashchange end
	
	

	$("#test").on("click", function(){
		
		if($(".cycle").is(":checked") || $(".duration").is(":checked")){
			testOption(keyword);	
			
		}else if($(".category").is(":checked")){
			testOption(keyword);
		}else{
			getHashKey(keyword);
		}
		
		
	});	
	
	
		getSearchList(keyword);
	
	/*if(check(cycle) || check(category) || check(duration)){
		console.log('====getSearchListOption===== 실행');
		getSearchListOption(keyword, cycle, duration, category)			
	}*/
	
});

$('#search_list').on('ajaxComplete', function() {
	
	
	console.log('성공?');
	
	
});