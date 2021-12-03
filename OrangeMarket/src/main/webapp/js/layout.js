	$(function(){
		$('#header .gnb-tit').click(function(){
			var list = $('#header .gnb-list');
			if(!list.is(':visible')){
				list.slideDown('300');
				$('.gnb-tit').css('display','none');
			}
		});
		$('#header .gnb-titUp').click(function(){	
			var list = $('#header .gnb-list');
			if(list.is(':visible')){
				list.hide();
				$('#header .gnb-tit').css('display','block');
			}
		});
	});
	