$(document).ready(function() {
    // 탭 관련 코드
    $(".tab_content").hide(); // 모든 탭 콘텐츠를 숨김
    $(".tab_content:first").show(); // 첫 번째 탭 콘텐츠만 보이도록 설정
    $(".lnb ul li:first").addClass("on"); // 첫 번째 탭에 'on' 클래스 추가

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

    // 프로필 이미지 관련 코드
    let deletecheck = false;

    // submit 버튼 클릭할 때 이벤트 부분
    $("#profileForm").submit(function() {
        // 파일 첨부를 변경하지 않으면 $('#filevalue').text()의 파일명을
        // 파라미터 'check'라는 이름으로 form에 추가하여 전송합니다.
        if (deletecheck == true) {
            // 사진 삭제하는 경우
            $("input[name=chProfile]").val('');
            console.log("업로드된 파일명:", $("input[name=chProfile]").val());
        }
    });

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
            };
            
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

    // 카테고리 추가 관련 코드
    $("#btnAddCategory").click(function(e){
        e.preventDefault(); // submit 동작 방지
        var newInput = '<li class="channel_category_item">' +
                        '<input class="channel_category_name" type="text" name="" id="" style="width: 254px; border: 1px solid #ccc;">' +
                        '<div class="channel_category_num"><button class="btn_model btnApply"><b id="btnSaveCategory" class="btn3">적용</b></button>' +
                        '<button class="btn_model btnDelete"><b id="btnDeleteCategory" class="btn3">삭제</b></button></div>' +
                        '</li>';
        $(".channel_category_list").append(newInput);
    });

    $(document).on('click', '.btnDelete', function(e){
        e.preventDefault();
        $(this).closest('.channel_category_item').remove();
    });

    // "적용" 버튼 클릭 시
	$(document).on('click', '.btnApply', function(e) {
	    e.preventDefault();
	
	    var categoryItem = $(this).closest('.channel_category_item');
	    var categoryName = categoryItem.find('.channel_category_name').val();
	
	    $.ajax({
	        url: '/path/to/your/server/api', // 서버 API 경로
	        type: 'POST',
	        data: {
	            categoryName: categoryName
	            // 필요한 추가 데이터들...
	        },
	        success: function(response) {
	            // 요청이 성공적으로 완료되었을 때 실행할 코드...
	            console.log('Category saved successfully!');
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            // 요청이 실패했을 때 실행할 코드...
	            console.error('Error saving category:', textStatus);
	        }
	    });
	});
});
