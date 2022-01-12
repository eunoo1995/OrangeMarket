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
				setJsonList(data);
			},
			error: function() {
			}
		})
	});

	function setJsonList($data) {
		var popSearchJson = $data.popkeyword;
		var recSearchJson = $data.reckeyword;
		var nonData = '<li>등록된 키워드가 없습니다.</li>';

		// 인기 검색어 삽입		
		var popListEl = '';
		if (popSearchJson.length == 0) {
			popListEl = nonData;
		} else {
			for (var i = 0; i < popSearchJson.length; i++) {
				popListEl += '<li><span class="num">' + popSearchJson[i].rn + '.</span>'
					+ '<a  href="product-list?keyword='+ popSearchJson[i].keyword +'"><span>' + popSearchJson[i].keyword + '</span></a></li>';
			}
		}
		$('#keywordPopList').html(popListEl);

		// 최근 검색어 삽입		
		var recListEl = '';
		if (recSearchJson.length == 0) {
			recListEl = nonData;
		} else {
			for (var i = 0; i < recSearchJson.length; i++) {
				recListEl += '<li><a href="product-list?keyword='+ recSearchJson[i].keyword +'">' + recSearchJson[i].keyword + '</a></li>';
			}
		}
		$('#keywordRecList').html(recListEl);

		// 관심 키워드로 등록된 검색어 삽입
		if ($data.myKeyword) {
			var mySearchJson = $data.myKeyword;
			var myListEl = '';
			
			if (mySearchJson.length == 0) {
				myListEl = nonData;
				
			} else {
				for (var i = 0; i < mySearchJson.length; i++) {
					myListEl += '<li><a href="product-list?keyword='+ mySearchJson[i].keyword +'">' + mySearchJson[i].mykeyword + '</a></li>';
				}
			}
			$('#keywordMyList').html(myListEl);
		}
	
		$('.header-search__keywords').addClass('on');
	}

	$('body, html').click(function(e) {
		if($('.header-search').has(e.target).length === 0) {
			$('.header-search__keywords').removeClass('on');
		}
	})


	/* 검색 */
	$('#headerSearchText').on('keydown', function(e) {
		if (e.key == 'Enter'){
			$('#headerSearchBtn').click();

			return false;
    	}
	});
	
	$('#headerSearchBtn').click(function(e) {
		var pre_data = $('#headerSearchText').val().trim();
		
		if(pre_data == '') {
			alert('검색어를 입력해주세요');
			
			return false;			
		} else {
			var formData = {
				'keyword': pre_data
			}
			
			$.ajax({
				type: 'POST',
				url: '/search-confirm',
				data: formData,
				dataType: 'json',
				success: function(data) {
					if (data == 'ok') {
						location = 	"product-list?keyword=" + pre_data;
						
					} else if (data == 'err') {
						alert('다시 시도해주세요')
					}
				},
				error: function() {
					alert('전송실패');
				}
			});
		}

		
	});

});
