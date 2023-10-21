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
  
  $('#inpNickname').on('input', function() {
  var chName = $(this).val(); // 현재 입력된 채널명 가져오기

  var chnum = $('#categorychnum').val();

  var url = '/itda/channels/' + chnum + '/checkChannelName';

  $.ajax({
    url: url,
    type: 'POST',
    data: JSON.stringify({
      chnum: chnum,
      chName: chName
    }),
    contentType: "application/json;charset=UTF-8",
    beforeSend: function(xhr) {
      // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
      xhr.setRequestHeader(header, token);
    },
   success: function(data) {
        // 기존에 추가된 경고 메시지가 있다면 제거
        $('#duplicateWarning').remove();

        var warningMsg;

        if(data > 0) { 
		          // 채널명이 중복되는 경우, input 필드 아래에 경고 메시지 추가
		          warningMsg = $('<div id="duplicateWarning" style="color: #00c6be; margin-top: 6px; display: flex; width: 200px; height: 14px; padding-left: 6px;">동일한 채널명이 있습니다.</div>');
		          $('#inpNickname').after(warningMsg);   // 경고 메시지 추가 위치 변경
		          //alert('채널명을 변경해주세요.');   // 사용자 알림창 추가 (AJAX 성공 후)
		          $('#btnApplyCategory').prop('disabled', true);   // '적용' 버튼 비활성화 (AJAX 성공 후)
		        } else {
		          // 채널명이 중복되지 않는 경우, input 필드 아래에 가능한 채널명임을 알리는 메시지 추가
		          warningMsg = $('<div id="duplicateWarning" style="color: #00c6be; margin-top: 6px; display: flex; width:150px; height:14px; padding-left: 6px;">가능한 채널명입니다.</div>');
		           $('#btnApplyCategory').prop('disabled', false);   // '적용' 버튼 활성화 (중복되지 않은 이름일 때)
		        }
		
		       $('#inpNickname').after(warningMsg);
		     },
		     error:function(jqXHR,textStatus,errorThrown){
		       console.error('Error:',textStatus);// 에러 발생 시 로그 출력
		     }
		 });
	});

  // 카테고리 추가 관련 코드
  $("#btnAddCategory").click(function(e) {
    e.preventDefault(); // submit 동작 방지
    var newInput = '<li class="channel_category_item">' +
      '<input class="channel_category_name" type="text" name="categoryName" id="categoryName" style="width: 254px; border: 1px solid #ccc;">' +
      '<div class="channel_category_num"><button class="btn_model btnApply categorybtn"><b id="btnSaveCategory" class="btn3">적용</b></button>' +
      '<button class="categorybtn btn_model btnDelete"><b id="btnDeleteCategory" class="btn3">삭제</b></button></div>' +
      '</li>';
    $(".channel_category_list").append(newInput);
  });

  $(document).on('click', '.btnDelete', function(e) {
    e.preventDefault();
    $(this).closest('.channel_category_item').remove();
  });
 

  $(document).on('click', '.btnApply', function(e) {
    e.preventDefault();
    console.log("Add");

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
 

         $(document).on('click', '.tdcell .btn_model .input', function(e) {
             e.preventDefault();
             $(this).removeClass('input').addClass('update');
         
             // updatenum 가져오기
             var updatenum = $(this).attr('updatenum');
             console.log(updatenum);
         
             // 해당 카테고리 이름 텍스트(실제로는 값)를 가져옵니다.
             var categoryName = $(this).closest('.channel_category_num').find('.channel_category_name').val();
             console.log(categoryName); 
         
              // 텍스트(값)를 변경할 수 있는 input 필드로 변경합니다.
              var newElement = $('<input type="text" class="editCategory" style="width: 254px; border: 1px solid #ccc; margin-left: 10px; margin-top: 6px;" value="' + categoryName + '"/>');
              newElement.attr('data-updatenum', updatenum);   // HTML 속성으로 데이터 저장
              $(this).closest('.channel_category_num').find('.channel_category_name')
                .replaceWith(newElement);
         });
         
         $(document).on('click', '.tdcell .btn_model .update', function() {
                 
         		 
         		 var input = $(this).parent().parent().parent().find('.editCategory');
         		 var newCategoryName = input.val();
                 // 여기서 AJAX 호출을 만들어서 서버에 새 카테고리 이름을 업데이트합니다.
                 var chnum = $('#categorychnum').val();
                 
                 // updatenum 가져오기
                 var categoryId = $(this).attr('updatenum');   // attr() 사용하여 속성 값 가져오기
         
                 //alert(categoryId);   // 확인용 alert
                 
                 var url = '/itda/channels/' + chnum + '/categoryupdate';
                 
                  $(this).removeClass('update').addClass('input');
             
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
                     input.removeClass('editCategory').addClass('channel_category_name').css({
					    'width': '254px',
					    'border': 'none',
					    'color': '#8e8e8e'
					  });
					                     
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                      console.error('카테고리 수정 에러:', textStatus);
                    }
                  });
         });

          
          $(document).on('click', '#btnDeleteCategory', function(e) {
          
             e.preventDefault();
             //alert('카테고리를 삭제합니다');
             
             // updatenum 가져오기
             var categoryId = $(this).attr('updatenum');
             //alert(categoryId);
         
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