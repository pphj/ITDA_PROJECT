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

	let deletecheck = false;

	//submit 버튼 클릭할 때 이벤트 부분
	$("#profileForm").submit(function() {
	
		//파일 첨부를 변경하지 않으면 $('#filevalue').text()의 파일명을
		//파라미터 'check'라는 이름으로 from에 추가하여 전송합니다.
		if (deletecheck == true) {
		//사진  삭제하는 경우
			$("input[name=chProfile]").val('')
			console.log("업로드된 파일명 :",$("input[name=chProfile]").val())
		}
	})
	
	
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
		
		   
		});
		
		
		$('#btnDelete').click(function() {
		
	    // 파일 선택 필드와 파일 이름 표시 필드 초기화
	    $('#filevalue').text('');
	    $('#upfile').val('');
	    
		deletecheck = true;
	    // 프로필 사진을 기본 이미지로 변경
	    $('#imgThumb').attr('src', '../../resources/image/main/login.png');
});
		

});