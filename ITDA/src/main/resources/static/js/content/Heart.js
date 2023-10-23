$(function(){
	let token = $("meta[name='_csrf']").attr("content");
  	let header = $("meta[name='_csrf_header']").attr("content");
	
	let heartstate = 0;
	let clickCK = 0;

	$(document).on('click',".heart_butt",function(e) {
		e.preventDefault();
		
		var userId = $('#LoginId').val();
        
        // userId가 없다면 (즉, 로그인하지 않은 상태라면) 함수 실행을 중지
		if (!userId) {
		        alert("로그인이 필요합니다.");
		        return; 
		 }
		
        if (clickCK === 0) {
			$('.content_comment_img').attr('src', contextPath + '/image/content/heart2.png');
        	heartstate = 1;
        	clickCK = 1;
        }else if(clickCK === 1){
			$('.content_comment_img').attr('src', contextPath + '/image/content/heart.png');
			heartstate = 0;
			clickCK = 0;
		}
		
       
	        
		var boardNum = $(this).data('id');
		
		console.log(boardNum);
		
		$.ajax({
			type : "post",
			url : "/itda/contents" + "/heartUpdate",
            data : { 
                boardNum: boardNum,
                heartstate: heartstate,
                userId: userId // 서버에 현재 로그인한 사용자의 ID도 함께 전달
            },
            beforeSend: function(xhr) {
		      // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
		      xhr.setRequestHeader(header, token);
			},
			dataType : "json",
			
            success : function(rdata){
				if (rdata.success) {
					var updatedValue = rdata.updatedValue;
                    $(".u_heart_count").text(updatedValue).val(updatedValue);
					$(this).data('heartstate', heartstate === 0 ? 1 : 0);
				}
			},
			
            error : function() {
				console.error("콘솔 메세지 : heart 실패");
			}
		
	    })//ajax end
	
    })//click end
})
