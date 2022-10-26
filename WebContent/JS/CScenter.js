// 슬라이딩 토글 기능 
$(document).ready(function(){
	$(".question").click(function(){
		if ($(this).hasClass('show')){
			$(this).next(".answer").slideUp(200);
			$(this).removeClass('show');
		}else {
			$(this).next(".answer").stop().slideDown(200);
			$(this).addClass('show');
		}
	});
});