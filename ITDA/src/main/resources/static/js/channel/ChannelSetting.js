$(document).ready(function() {
		// 모든 탭 콘텐츠를 숨김
		$(".tab_content").hide();

		// 첫 번째 탭 콘텐츠만 보이도록 설정
		$(".tab_content:first").show();

		// 첫 번째 탭에 'on' 클래스 추가
		$(".lnb ul li:first").addClass("on");

		// 각 탭에 클릭 이벤트 핸들러 추가
		$(".lnb ul li").click(function() {
			var index = $(this).index(); // 클릭된 탭의 인덱스 가져오기

			// 모든 탭에서 'on' 클래스 제거 후, 클릭된 탭에만 'on' 클래스 추가
			$(".lnb ul li").removeClass("on");
			$(this).addClass("on");

			// 모든 콘텐츠 숨기기 후, 선택된 콘텐츠만 보이게 하기 
			$(".tab_content").hide();
			$(".tab_content:eq(" + index + ")").show();
		});
});//탭 선택
	
$(document).ready(function() {
	let check = 0;
	
	   function show() {
		//파일 이름이 있는 경우 remove 이미지를 보이게 하고, 파일 이름이 없는 경우 remove 이미지를 보이지 않게 함.
		if ($('#filevalue').text() == '') {
			$(".remove").css('display', 'none');
		} else {
			$(".remove").css({
				'display': 'inline-block',
				'position': 'relative', 
				'top': '-5px'
			});
	   }
   }

		show();	
	
	  $('#btnChangeProfile').click(function(){
	     $('#upfile').trigger('click');
	  });
	
	  $('#upfile').change(function() {
		    const inputfile = $(this).val().split('\\');
		    $('#filevalue').text(inputfile[inputfile.length - 1]);
		
		    if (this.files && this.files[0]) {
		        var reader = new FileReader();
		        
		        reader.onload = function(e) {
		            $('#imgThumb').attr('src', e.target.result);
		        }
		        
		        reader.readAsDataURL(this.files[0]); // convert to base64 string
		    }
		
		    show();
		});
		
		$('#btnDelete').click(function() {
		
	    // 파일 선택 필드와 파일 이름 표시 필드 초기화
	    $('#filevalue').text('');
	    $('#upfile').val('');
	
	    // 프로필 사진을 기본 이미지로 변경
	    $('#imgThumb').attr('src', '../image/main/login.png');
});
		

});