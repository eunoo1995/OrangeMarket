$(function() {
	$('#header .gnb-tit').click(function() {
		var list = $('#header .gnb-list');
		if (!list.is(':visible')) {
			list.slideDown('300');
			$('.gnb-tit').css('display', 'none');
		}
	});
	$('#header .gnb-titUp').click(function() {
		var list = $('#header .gnb-list');
		if (list.is(':visible')) {
			list.hide();
			$('#header .gnb-tit').css('display', 'block');
		}
	});

	/* 검색어 불러오기 */
	$('#headerSearchText').on('click', function() {
		$.ajax({
			type: 'POST',
			url: '/search-list',
			data: '',
			dataType: 'json',
			success: function(data) {
				console.log(data);
				setJsonList(data);
			},
			error: function() {
			}
		})
	});
	
	function setJsonList($data) {
		var popSearchJson = $data.popkeyword;
		var recSearchJson = $data.reckeyword;

		// 인기 검색어 삽입		
		var popListEl = '';
		for(var i=0; i < popSearchJson.length; i++) {
			popListEl += '<li><span>'+ popSearchJson[i].rn +'</span><span>'+ popSearchJson[i].keyword +'</span></li>';
		}
		$('#keywordPopList').html(popListEl);
		
		// 최근 검색어 삽입		
		var recListEl = '';
		for(var i=0; i < recSearchJson.length; i++) {
			recListEl += '<li><span>'+ recSearchJson[i].keyword +'</span></li>';
		}
		$('#keywordRecList').html(recListEl);
		
		// 관심 키워드로 등록된 검색어 삽입
		if($data.mykeyword) {
			var mySearchJson = $data.mykeyword;
			var myListEl = '';
			
			for(var i=0; i < mySearchJson.length; i++) {
				myListEl += '<li>'+ mySearchJson[i].keyword +'</span></li>';
			}
			$('#keywordMyList').html(myListEl);
		}
		
		

	}
	
	

	/* 검색 */
	$('#headerSearchBtn').on('click', function() {

		var formData = {
			'keyword': $('#headerSearchText').val().trim()
		}

		console.log(formData);

		$.ajax({
			type: 'POST',
			url: 'search-confirm',
			data: formData,
			dataType: 'text',
			success: function(data) {
				if (data == 'ok') {
					console.log(data);
				} else if (data == 'err') {
					alert('다시 시도해주세요')
				}
			},
			error: function() {
			}
		});
	});

});
