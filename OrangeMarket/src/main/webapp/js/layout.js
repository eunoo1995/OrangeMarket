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
			type: 'GET',
			url: '/search-list',
			dataType: 'json',
			success: function(data) {
				console.log(data.popkeyword);
			},

			error: function() {
			}
		})
			/*.done(function(result) {
			});*/
	});

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
