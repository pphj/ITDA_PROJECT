<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>아이디 비밀번호 찾기</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header/login_modal.css">
	
<script src="https://vendor-cdn.imweb.me/js/jquery.js?1627517460"></script> 

<!-- <script src="https://vendor-cdn.imweb.me/js/jquery-ui.design.js?1627517437"></script> -->
<!-- <script src="https://vendor-cdn.imweb.me/js/jquery.fileupload.js?1577682292"></script> -->
<!-- <script src="https://vendor-cdn.imweb.me/js/jquery.lazyload.min.js?1577682292"></script> -->
<!-- <script src="https://vendor-cdn.imweb.me/js/jquery.smooth-scroll.min.js?1577682292"></script> -->
<!-- <script src="https://vendor-cdn.imweb.me/js/jquery-scrolltofixed.js?1669067096"></script> -->
<!-- <script src="https://vendor-cdn.imweb.me/js/jquery.trackpad-scroll-emulator.js?1577682292"></script> -->
<!-- <script src="https://vendor-cdn.imweb.me/js/jquery.exif.js?1577682292"></script> -->
<!-- <script src="https://vendor-cdn.imweb.me/js/jquery.canvasResize.js?1577682292"></script> -->
<!-- <script src="https://vendor-cdn.imweb.me/js/jquery.number.min.js?1577682292"></script> -->
<!-- <script src="https://vendor-cdn.imweb.me/js/jquery.timepicker.min.js?1577682292"></script> -->
<!-- <script src="https://vendor-cdn.imweb.me/js/jquery.chosen.js?1619084781"></script> -->
	


<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
</head>


<body>
	




	<div class="modal-dialog ui-draggable">
		<div class="modal-content">
			<input type="hidden" id="tokn" value=""> <input type="hidden"
				id="member_code_token" value=""> <input type="hidden"
				class="._is_use_only_id" value="">
			<article
				class="modal_article pop login p_lr_space no-padding bg-white"
				id="find_step_1" style="">
				<div class="tit_wrap">
					<button class="close" data-dismiss="modal" aria-label="Close"
						data-toggle="tooltip" data-placement="bottom"
						data-original-title="닫기">
						<i class="btl bt-times"></i>
					</button>
					<h2 class="find_tit _find_tit findId">아이디 찾기</h2>
					<h2 class="find_tit _find_tit findPassword hidden">비밀번호 찾기</h2>
				</div>
				<div class="force-padding">
					<div class="tab_wrap clearfix">
						<button type="button" class="btn btn_find active col-xs-6"
							data-tab="findId" tabindex="0">아이디 찾기</button>
						<button type="button" class="btn btn_find col-xs-6"
							data-tab="findPassword" tabindex="0">비밀번호 찾기</button>
					</div>
					<!-- 아이디 찾기 tab -->
					<div id="findId" class="_step">
						<div class="step04_select_wrap_id"
							style="padding-bottom: 0px; border-bottom: none;">
							<div class="mt8 mb8 _step01_find_id_email_input_wrap">
								<div class="input-group">
									<input class="form-control _find_id_only_input_email"
										title="이메일 또는 아이디" type="text" placeholder="이메일 또는 아이디">
								</div>
							</div>
						</div>
						<p class="txt_c mt8 mb0 _find_id_step_01_btn_wrap">
							<button class="btn btn-primary _update_status" data-tab="find_id"
								style="" onclick="SITE_MEMBER.findSubmit('find');">아이디
								찾기</button>
						</p>
					</div>
					<!-- 비밀번호 찾기 tab -->
					<div id="findPassword" class="_step hidden">
						<div class="select_wrap_pw padding-bottom-xl no-border">
							<div class="mt8 mb8">
								<div class="input-group">
									<input class="form-control _find_pw_input_email"
										title="가입한 이메일 또는 아이디" type="text" name="uid"
										placeholder="가입한 아이디">
								</div>
							</div>
							<button type="button" class="btn btn-primary _update_status"
								data-tab="find_password"
								onclick="SITE_MEMBER.findSubmit('find')">비밀번호 찾기</button>
						</div>
					</div>
				</div>
			</article>

			<article
				class="modal_article pop p_lr_space pb16 no-padding bg-white"
				id="find_step_2" style="display: none">
				<div class="tit_wrap">
					<!-- 4단계 정확한 아이디 찾기 -->
					<button class="close" data-dismiss="modal" aria-label="Close"
						data-toggle="tooltip" data-placement="bottom"
						data-original-title="닫기">
						<i class="btl bt-times"></i>
					</button>
					<h2 class="find_tit _find_id">아이디 찾기</h2>
					<h2 class="find_tit _find_password hidden">비밀번호 재설정</h2>
				</div>
				<div class="force-padding">
					<!-- 아이디 전체 찾기를 위한 물어보는 단계 -->
					<div id="find_step2_info_1" class="find_step2">
						<div class="pw_search">입력하신 정보와 일치하는 계정을 발견했습니다.</div>

						<div class="pw_search">
							<span class="text-ultra-bold mt16 _result_find_data_uid">sam***@email.com</span>
						</div>

						<p class="clearfix mt24 mb8">
							<button type="button"
								class="btn btn_find btn_standard btn_inline float_l _find_id_reset_password"
								style="margin-right: 10px;">비밀번호 재설정</button>
							<button type="button" class="btn btn-primary btn_inline float_l"
								onclick="SITE_MEMBER.openLogin('/', 'null', null, 'N');">로그인</button>
						</p>
						<a class="text-primary text-14 _find_id _find_id_detail"
							style="cursor: pointer;">정확한 아이디가 기억나지 않아요!</a>
					</div>
					<div id="find_step2_info_2" style="display: none;">
						<div class="pw_search">
							입력하신 정보와 일치하는 계정을 발견했습니다. <br>비밀번호는 사이트 운영자에게 문의해주세요.
						</div>
						<div class="pw_search mt8">
							<span class="text-ultra-bold mt16 _result_find_data_uid">sam***@email.com</span>
						</div>
						<p class="txt_c mt24 mb0">
							<button type="button" class="btn btn-primary"
								onclick="SITE_MEMBER.openLogin('/', 'null', null, 'N');">로그인</button>
						</p>
					</div>

				</div>
			</article>

			<article
				class="modal_article pop p_lr_space pb16 bg-white no-padding"
				id="find_step_3" style="display: none">
				<div class="tit_wrap">
					<!-- 가입정보로 인증 성공 후 이메일로 -->
					<button class="close" data-dismiss="modal" aria-label="Close"
						data-toggle="tooltip" data-placement="bottom"
						data-original-title="닫기">
						<i class="btl bt-times"></i>
					</button>
					<h2 class="find_tit _find_id">아이디 찾기</h2>
					<h2 class="find_tit _find_password hidden">비밀번호 재설정</h2>
				</div>
				<div class="force-padding">
					<p class="choice mt0 mb8 _find_id">아이디를 찾을 방법을 선택해주세요.</p>
					<p class="choice mt0 mb8 _find_password">
						입력하신 정보와 일치하는 계정을 발견했습니다.<br>비밀번호를 재설정할 방법을 선택해주세요.
					</p>

					<div class="step04_select_wrap_id _find_id_send_email_wrap">
						<!-- 이메일로 재설정 -->
						<div class="select_tit radio radio-styled mt0 mb0 clearfix">
							<label> <input type="radio" class="_radio_find_id_email"
								value="find_id_send_email" name="findIdStep03" checked="">
								<span class="_find_id">가입한 이메일로 찾기</span> <span
								class="_find_password">가입한 이메일로 재설정</span>
							</label>
						</div>
						<div class="_step04_select_input step04_select_input_id mb0">
							<p class="mb8 text-14 margin-top-xl">
								회원정보에 등록된 아래의 이메일 주소로 <br>정확한 계정 정보를 전송하시겠습니까?
							</p>
							<div class="pw_search mb8">
								<span class="text-ultra-bold _result_find_data_email">sam***@email.com</span>
							</div>
						</div>
					</div>

					<p class="txt_c mt8 mb0 _find_id_step_03_btn_wrap">
						<button class="btn btn-primary" style=""
							onclick="SITE_MEMBER.findSubmit('send');">계속</button>
					</p>
				</div>
			</article>

			<article
				class="modal_article pop p_lr_space pb16 bg-white no-padding"
				id="find_step_4" style="display: none">
				<div class="tit_wrap">
					<!-- 가입정보로 인증 성공 후 이메일로 -->
					<button class="close" data-dismiss="modal" aria-label="Close"
						data-toggle="tooltip" data-placement="bottom"
						data-original-title="닫기">
						<i class="btl bt-times"></i>
					</button>
					<h2 class="find_tit">비밀번호 변경</h2>
				</div>
				<div class="force-padding _result_sending_email_wrap">
					<p class="margin-bottom-xxl">이메일 주소로 계정 정보를 보내드렸으며, 이메일에 있는 링크를
						통해 비밀번호를 재설정할 수 있습니다.</p>
					<div class="pw_search margin-bottom-xxl mt0">
						<span class="text-ultra-bold _result_find_data_email">sam***@email.com</span>
					</div>
					<p>이메일이 보이지 않는 경우 휴지통 또는 스팸함 등을 확인해주세요.</p>
					<p class="txt_c mt24 mb0">
						<button type="button" class="btn btn-primary"
							onclick="SITE_MEMBER.openLogin('/', 'null', null, 'N');">로그인</button>
					</p>
				</div>
				<div class="force-padding _result_update_password_wrap"
					style="display: none;">
					<form id="find_password_form">
						<div class="_token_obj" data-type="change_password">
							<input type="hidden" name="write_token" class="_tk_obj"
								value="1yeiY3F//LmAj6JvRVRBe4GUBrB6hTM11AXJ7DpFHHyViqhQqP/TpOC4D03QRMWIM5kDmGg0X8/youKzNhfBstSaQdzVNrc9MBPs8H4k/PcfjWnEZAHKvbAQVufdmVl3">
							<input type="hidden" name="write_token_key" class="_tk_key_obj"
								value="2692">
						</div>

						<input type="hidden" name="c" value=""> <input
							type="hidden" name="r" value=""> <input type="hidden"
							name="s" value=""> <input type="hidden" name="type"
							value="">
						<div class="mb8">
							<div class="form-group input-group input-group-login">
								<input class="form-control" title="새 비밀번호" type="password"
									name="change_pass1" placeholder="새 비밀번호"> <input
									class="form-control" title="새 비밀번호 확인" type="password"
									name="change_pass2" placeholder="새 비밀번호 확인">
							</div>
						</div>
					</form>
					<p class="txt_c mb8">
						<button type="button" class="btn btn-primary"
							onclick="SITE_MEMBER.findSubmit('update_password')">변경하기</button>
					</p>
					<p class="text-12 margin-bottom-xxl tip_bold">
						<span class="text-brand">TIP</span> 비밀번호에 영문 대소문자, 숫자, 특수문자를 조합하시면
						안전도가 높아져 도용의 위험이 줄어듭니다.
					</p>
				</div>
			</article>



<script>

		//아이디 찾기, 비밀번호 찾기 탭 기능 

$(document).ready(function() {
  var current_find_tab = 'findId';

  function step() {
    $('.btn_find').off('click').on('click', function() {
      var tab_id = $(this).attr('data-tab');
      current_find_tab = tab_id;
      $('.btn_find').removeClass('active');
      $('._find_tit').addClass('hidden');
      $('._step').addClass('hidden');

      $(this).addClass('active');
      $('.' + tab_id).removeClass('hidden');
      $('#' + tab_id).removeClass('hidden');

      if (tab_id == 'findId') {
        $('._find_id').removeClass('hidden');
        $('._find_password').addClass('hidden');
      } else if (tab_id == 'findPassword') {
        $('._find_password').removeClass('hidden');
        $('._find_id').addClass('hidden');
      }
    });
  }

  function updateFindIdStatus() {
    $('._update_status').off('click').on('click', function() {
      var tab_name = $(this).attr("data-tab");

      if (tab_name == "find_id") {
        $("._find_id").removeClass("hidden");
        $("._find_password").addClass("hidden");
      } else if (tab_name == "find_password") {
        $("._find_password").removeClass("hidden");
        $("._find_id").addClass("hidden");
      }
    });
  }

  step();
  updateFindIdStatus();
});

		//아이디 찾기, 비밀번호 찾기 탭 기능 end


	
	
		//아이디, 비밀번호 찾기 버튼 
		
	var SITE_MEMBER = {
	findToken: '', // findToken 변수 초기화
	findSubmit: function(step) {
		var that = this;
		if(step=='find'){
			var status_find_id  	   = !($('._find_id').hasClass('hidden'));		   // 아이디 찾기 상태
			var status_find_password   = !($('._find_password').hasClass('hidden'));   // 비밀번호 찾기 상태

			var email_wrap = $('._find_id_email_wrap');			// 가입한 이메일로 찾기 영역
			var nick_wrap  = $('._find_id_nick_wrap');			// 가입한 휴대폰으로 찾기 영역

			var find_id_first_result_wrap   = $('#find_step2_info_1');
			var find_id_second_result_wrap  = $('#find_step2_info_2');
			
			var only_email	  	 = $('._find_id_only_input_email').val(); // 가입한 이메일로 찾기만 있을 경우 입력되는 값
			var is_find_id_only_email = false;
			
			var find_id_send_email_wrap = $('._find_id_send_email_wrap'); // 아이디, 비밀번호 재설정 메일 발송 영역
			
			var email 	 	  = $('._find_id_input_email').val();		// 아이디 찾기 이메일 입력값
			var nick  	 	  = $('._find_id_input_nick').val();		// 아이디 찾기 이름 입력값
			var	call_num 	  = $('._find_id_input_call_num').val();	// 아이디 찾기 전화번호 입력값

			var regex = /[^0-9]/g; // 숫자가 아닌 문자열을 선택하는 정규식
			if(call_num) call_num = call_num.replace(regex, "");

			var find_pw_email = $('._find_pw_input_email').val(); 		// 비밀번호 찾기 이메일 입력값
			
			var is_auth_input = false;
			var is_auth_dream_seucrity = $('._auth_dream_security_input').length;
			var is_auth_mobilians 	   = $('._auth_mobilians_input').length;
			var is_auth_inicis 		   = $('._auth_inicis_input').length;
			if(is_auth_dream_seucrity > 0 || is_auth_mobilians > 0 || is_auth_inicis > 0){ // 본인인증 수단 한개라도 사용하고 있을 경우
				is_auth_input = true;
			}

			
			
      
      if (status_find_id) { // 아이디 찾기 상태인 경우
        if (email_wrap.css('display') == 'block') { // 가입한 이메일로 찾기 입력 데이터 이외의 값 초기화
          nick_wrap.val('');
          call_num.val('');
        } else if (nick_wrap.css('display') == 'block') { // 가입한 휴대폰으로 찾기 입력 데이터 이외의 값 초기화
        	find_pw_email = '';
        }
      } else if (status_find_password) { // 비밀번호 찾기 상태인 경우
        nick.val('');
        call_num.val('');

        find_pw_email = $('._find_pw_input_email').val(); 	// 비밀번호 찾기 이메일 입력값을 가져옵니다.
      }

      if (!find_pw_email) {
				alert('입력하신 정보와 일치하는 계정이 없습니다. 다시 시도해주시거나 사이트 관리자에게 문의해주세요.'); 
				return;
		  }
      
      $.ajax({
    	   url: "/member/FindIdPasswordForm",
    	   type: "POST",
    	   data: { userEmail : find_pw_email }, // 이메일 값을 전달
    	   success: function(response) {
    	       if (response.success) {
    	           that.findToken = response.token; 
    	           alert('ID를 포함한 이메일이 발송되었습니다.'); 
    	       } else {
    	           alert('해당 이메일로 등록된 계정이 없습니다.'); 
    	       }
    	   },
    	   error: function(error) {
    	       console.error(error);
    	       alert('오류가 발생했습니다.');
    	   }
    	});

    }
    
  }
};


		//아이디, 비밀번호 찾기 버튼 end
		
			// step 1
		$('input:radio[name=findIdStep01]').change(function(){
			// 가입한 이메일로 찾기 비활성화
			$('._step01_find_id_email_input_wrap').hide();
			$('._find_id_input_email').val('');

			// 가입한 휴대폰으로 찾기 비활성화
			$('._step01_find_id_name_and_phone_input_wrap').hide();
			$('._find_id_input_nick').val('');
			$('._find_id_input_call_num').val('');

			var find_id_step_01_btn_wrap = $('._find_id_step_01_btn_wrap'); // 버튼 링크 설정
			var checked_radio_val = $('input:radio[name=findIdStep01]:checked').val();
			find_id_step_01_btn_wrap.children().remove();
			switch(checked_radio_val){
				case 'find_id_email':
					$('._step01_find_id_email_input_wrap').show(); // 가입한 이메일로 찾기 영역 활성화
					$('._find_id_input_nick').val('');			   // 가입한 이메일로 찾기 입력폼의 데이터만 입력되게 나머지 값 초기화
					$('._find_id_input_call_num').val('');		   // 가입한 이메일로 찾기 입력폼의 데이터만 입력되게 나머지 값 초기화

					find_id_step_01_btn_wrap.append("<button class='btn btn-primary _update_status' data-tab='find_id' onclick=SITE_MEMBER.findSubmit('find');>"+LOCALIZE.버튼_아이디찾기()+"</button>");
					break;
				case 'find_id_name_and_phone':
					$('._step01_find_id_name_and_phone_input_wrap').show(); // 가입한 휴대폰 찾기 영역 활성화
					$('._find_id_input_email').val('');						// 가입한 휴대폰 찾기 영역 입력폼의 데이터만 입력되게 나머지 값 초기화

					find_id_step_01_btn_wrap.append("<button class='btn btn-primary _update_status' data-tab='find_id' onclick=SITE_MEMBER.findSubmit('find');>"+LOCALIZE.버튼_아이디찾기()+"</button>");
					break;
				case 'find_id_dream_security':
					find_id_step_01_btn_wrap.append("<button class='btn btn-primary' "+obj.auth_anchor_list.dream_security+">"+LOCALIZE.버튼_아이디찾기()+"</button>");
					break;
				case 'find_id_mobilians':
					find_id_step_01_btn_wrap.append("<button class='btn btn-primary' "+obj.auth_anchor_list.mobilians+">"+LOCALIZE.버튼_아이디찾기()+"</button>");
					break;
				case 'find_id_inicis':
					find_id_step_01_btn_wrap.append("<button class='btn btn-primary' "+obj.auth_anchor_list.inicis+">"+LOCALIZE.버튼_아이디찾기()+"</button>");
					break;
				case 'find_id_combination':
					find_id_step_01_btn_wrap.append("<button class='btn btn-primary' "+obj.auth_anchor_list.combination+">"+LOCALIZE.버튼_아이디찾기()+"</button>");
					break;
			}
		});



</script>

		</div>
	</div>

</body>