$(function(){
	let token = $("meta[name='_csrf']").attr("content");
  	let header = $("meta[name='_csrf_header']").attr("content");
	
	let heartstate = 0;
	let clickCK = 0;
	
	var userId = $('#LoginId').val();
    var boardNum = $(".heart_butt").data('id'); // 게시글 번호 가져오기
    
    
    
	    // 페이지 로드 시 '좋아요' 상태 및 갯수 조회
	    $.ajax({
	        type: "get",
	        url: "/itda/contents" + "/getHeartStateAndCount",
	        data: {
	            boardNum: boardNum,
	            userId: userId
	         },
	         dataType : "json",
	         success : function(rdata) {
	             if (rdata.heartState === 1) { 
	                 $('.content_comment_img').attr('src', contextPath + '/image/content/heart2.png');
	                 heartstate = 1;
	                 clickCK = 1;
	             } else { 
	                 $('.content_comment_img').attr('src', contextPath + '/image/content/heart.png');
	                 heartstate = 0;
	                 clickCK = 0;
	             }
	             
	             $(".u_heart_count").text(rdata.heartCount); // 좋아요 수 업데이트
	
	          },
	     });

	$(document).on('click',".heart_butt",function(e) {
		e.preventDefault();
		
		var userId = $('#LoginId').val();
        
        // userId가 없다면 (즉, 로그인하지 않은 상태라면) 함수 실행을 중지
		if (!userId) {
		        alert("로그인이 필요합니다.");
		        return; 
		 }
		
		var heartButton = $(this); // '좋아요' 버튼 저장
		
        if (clickCK === 0) {
			$('.content_comment_img').attr('src', contextPath + '/image/content/heart2.png');
        	heartstate = 1;
        	clickCK = 1;
        }else if(clickCK === 1){
			$('.content_comment_img').attr('src', contextPath + '/image/content/heart.png');
			heartstate = 0;
			clickCK = 0;
		}
		
       
	        
		 var boardNumAgain= $(this).data('id');
		
		console.log(boardNumAgain);
		
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
		    
		   success : function(rdata) {
			    if (rdata.success) {
			        var updatedValue = rdata.updatedValue;
			        $(".u_heart_count").text(updatedValue);
			        heartButton.data('heartstate', heartstate === 0 ? 1 : 0);
			
			        // '좋아요' 상태에 따라 이미지 변경
			        if (heartstate === 1) {
			            heartButton.find('.content_comment_img').attr('src', contextPath + '/image/content/heart2.png');
			        } else {
			            heartButton.find('.content_comment_img').attr('src', contextPath + '/image/content/heart.png');
			        }
			    }
			},
		    
		     error: function(jqXHR, textStatus, errorThrown) {
		         if (jqXHR.status == 400) {   // 예외 상황에 따라 적절한 HTTP 상태 코드를 반환한다고 가정합니다.
		             alert("이미 좋아요를 누른 게시물입니다.");   // 사용자에게 알림 메시지 표시
		         } else {
		             console.error("콘솔 메세지 : heart 실패");
		         }
		     }
		
		})//ajax end
    })//click end
})
