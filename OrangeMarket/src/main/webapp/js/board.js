$(function(){
	
	$('.QnA-title').click(function(){
		var detail = $(this).next('div');
		 if(!detail.is(':visible')) {
				detail.slideDown('300');
			} else {
				detail.slideUp('300');
			}
    });
	
});