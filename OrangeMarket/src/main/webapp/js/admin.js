$(function(){
	$('.detail-btn').click(function(){
		
		var currentRow = $(this).closest('tr');
		var detail = currentRow.next('tr');
		if(!detail.is(':visible')) {
			detail.show();
			$(this).attr('src', '../images/icon_up.png');
		} else {
			detail.hide();
			$(this).attr('src', '../images/icon_down.png');
		}
	});
	
	$('.QnA-title').click(function(){
		var detail = $(this).next('div');
		 if(!detail.is(':visible')) {
				detail.slideDown('300');
			} else {
				detail.slideUp('300');
			}
    });
	
	
	
	
	
});

function inquiry_detail() {
	window.open('inquiryDetail.jsp','','width=450, height=400, left=540, top=150');		
}
function report_detail() {
	window.open('reportDetail.jsp','','width=450, height=400, left=540, top=150');		
}