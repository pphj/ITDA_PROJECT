$(document).ready(function() {
  let token = $("meta[name='_csrf']").attr("content");
  let header = $("meta[name='_csrf_header']").attr("content");

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

  $('#btnChangeProfile').click(function() {
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
  $("#btnAddCategory").click(function(e) {
    e.preventDefault(); // submit 동작 방지
    var newInput = '<li class="channel_category_item">' +
      '<input class="channel_category_name" type="text" name="categoryName" id="categoryName" style="width: 254px; border: 1px solid #ccc;">' +
      '<div class="channel_category_num"><button class="btn_model btnApply"><b id="btnSaveCategory" class="btn3">적용</b></button>' +
      '<button class="btn_model btnDelete"><b id="btnDeleteCategory" class="btn3">삭제</b></button></div>' +
      '</li>';
    $(".channel_category_list").append(newInput);
  });

  $(document).on('click', '.btnDelete', function(e) {
    e.preventDefault();
    $(this).closest('.channel_category_item').remove();
  });

  $(document).on('click', '.btnApply', function(e) {
    e.preventDefault();

    var chnum = $('#categorychnum').val();
    var chcatename = $(this).closest('.channel_category_item').find('.channel_category_name').val();
    var url = '/itda/channels/' + chnum + '/categorychange';
    if (chcatename.trim() !== "") {
      $.ajax({
        url: url,
        type: 'POST',
        data: JSON.stringify({ chcatename: chcatename }),
        contentType: "application/json;charset=UTF-8",
        beforeSend: function(xhr) {
          // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
          xhr.setRequestHeader(header, token);
        },
        success: function(response) {
          console.log('카테고리 추가 완료');
          alert('카테고리 추가 성공'); // 카테고리 추가 성공 알림창
          location.reload(); // 페이지 새로고침
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.error('카테고리 추가 에러:', textStatus);
        }
      });
    }
  });
 

	$(document).on('click', '.btn_model', function(e) {
	    e.preventDefault();
	
	    // 해당 카테고리 이름 텍스트(실제로는 값)를 가져옵니다.
	    var categoryName = $(this).closest('.channel_category_num').find('.channel_category_name').val();
	    console.log(categoryName); 
	
	     // 텍스트(값)를 변경할 수 있는 input 필드로 변경합니다.
	    $(this).closest('.channel_category_num').find('.channel_category_name')
	      .replaceWith('<input type="text" class="editCategory" style="width: 254px; border: 1px solid #ccc; margin-left: 10px; margin-top: 6px;" value="' + categoryName + '"/>');
	});

	$(document).on('blur', '.editCategory', function() {
	    var newCategoryName = $(this).val();
	
	     // 새 카테고리 이름으로 <strong> 태그를 생성하고 기존 <input> 요소와 교체합니다.
	    $(this).replaceWith('<strong class="channel_category_name">' + newCategoryName + '</strong>');
	    //alert(newCategoryName)
		
	    // 여기서 AJAX 호출을 만들어서 서버에 새 카테고리 이름을 업데이트합니다.
	    var chnum = $('#categorychnum').val();
	    
	  
	    // categoryId 가져오기
	   	var categoryId = $('.channel_category_id').val();
	    //var categoryId = $(this).closest('.channel_category_item').find('.channel_category_id').val(); 
		alert(categoryId)
	    //var categoryId = $('.channel_category_id').val();
    	//var categoryId = $('#categoryId').val();
    	
	    var url = '/itda/channels/' + chnum + '/categoryupdate';
	
	    $.ajax({
	      url: url,
	      type: 'PUT', 
	      data: JSON.stringify({ 
	       chCate_Name: newCategoryName, 
	       chCate_Id: categoryId   // 여기에서 categoryId 추가
	      }),
	      contentType: "application/json;charset=UTF-8",
	      beforeSend: function(xhr) {
	        xhr.setRequestHeader(header, token);
	      },
	      success: function(response) {
	        console.log('카테고리 수정 완료');
	        alert('카테고리 수정 성공');
	        location.reload();
	       },
	       error: function(jqXHR, textStatus, errorThrown) {
	         console.error('카테고리 수정 에러:', textStatus);
	       }
	     });
	 });
	 
		 $(document).on('click', '#btnDeleteCategory', function(e) {
		    e.preventDefault();
		    alert('카테고리를 삭제합니다');
		    
		    // categoryId 가져오기
		    //var categoryId = $(this).data('category-id');
		    var categoryId = $('#categoryId').val();
		    alert(categoryId);
		
		    var chnum = $('#categorychnum').val();
		    
		    	
		    var url = '/itda/channels/' + chnum + '/categorydelete';
		    
		    // 현재의 'this' 값 (삭제 버튼)을 캐시하여 AJAX 콜백 내부에서 사용
   			var $this = $(this);
		
		    $.ajax({
		      url: url,
		      type: 'DELETE',
		      data: JSON.stringify({ 
		       chCate_Id: categoryId   // 여기에서 categoryId 추가
		      }),
		      contentType: "application/json;charset=UTF-8",
		      beforeSend: function(xhr) {
		        xhr.setRequestHeader(header, token);
		      },
		      success: function(response) {
		        console.log('카테고리 삭제 완료');
		        alert('카테고리 삭제되었습니다');
		        
		        $this.closest('.channel_category_item').remove();  // HTML에서 해당 카테고리 아이템 제거

		        location.reload();
		       },
		       error: function(jqXHR, textStatus, errorThrown) {
		         console.error('카테고리 삭제 에러:', textStatus);
		       }
		     });
		
		     $(this).closest('.channel_category_item').remove();  // HTML에서 해당 카테고리 아이템 제거
		});
	 
 });
