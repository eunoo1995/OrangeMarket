
    $(function(){
    	     
    	//클릭했을 때 잠시 보류
    	 /*    $('#sendbtn').click(function(){
			
			   
  		    });
    	   */  
    	   //엔터키를 눌렀을때 실행되는 함수
        $('input[type="text"]').keypress(function(e){  //엔터키를 눌렀을때 실행되는 함수
            if(e.keyCode == 13 && $(this).val().length){
                 var _val = $(this).val();
                 var _class = $(this).attr('class');
                 $(this).val('');                  
                 var _tar = $('.chat_wrap .inner').append('<div class="item '+_class+ '"><div class="box"><p class="msg">'+_val+'</p><span class="time">'+currentTime()+'</span></div></div>');

            }
            setTimeout(function(){
                $('.chat_wrap .inner').find('.item:last').addClass('on');
            },10)

            $('.chat_wrap .inner').stop().animate({scrollTop:$('.chat_wrap .inner').height()},500);

        })

   });
    
    
    
    /*현재시간 출력함수*/
     var currentTime = function(){
     var date = new Date();  //데이터 객체를 만들고 시간,분,오전오후를 하나의 변수에 담아 return
     var hh = date.getHours();
     var mm = date.getMinutes();
     var apm = hh > 12 ? '오후':'오전';
     var ct = apm + ' ' + hh + ':' + mm +'';
     return ct;

    };
        