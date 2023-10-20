<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>아이디 비밀번호 찾기</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header/login_modal.css">
	
<script src="https://vendor-cdn.imweb.me/js/jquery.js?1627517460"></script> 
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
							<button class="btn btn-primary _update_status findId" data-tab="find_id"
								style="">아이디
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
										placeholder="가입한 이메일">
								</div>
							</div>
							
							 <!-- 비밀번호 재설정 -->
					        <div id = "resetPasswordForm" style = "display: none;" class="mt8 mb8">
					            <div class="input-group">
					                <input class="form-control _find_pw_input_confirm_password"
					                    title="" type="text" name=""
					                    placeholder="새로운 비밀번호 확인">
					            </div>
					        </div>
					        
							<button type="button" class="btn btn-primary _update_status findPw"
								data-tab="find_password" 
								>비밀번호 찾기</button>
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


	//아이디 찾기, 비밀번호 찾기 탭 기능 end
	
	
	//아이디 찾기 ajax
		$(".findId").click(function() {

			find_Id_email = $("._find_id_only_input_email").val();
			if (find_Id_email == '') {
				alert('이메일을 입력하세요.');
				return;
			}

			$.ajax({
				url : "sendIdEmail",
				type : "GET",
				data : {
					userEmail : find_Id_email
				}, // 이메일 값을 전달
				success : function(response) {
					if (response == "success") {
						alert('ID를 포함한 이메일이 발송되었습니다.');
					} else {
						alert('해당 이메일로 등록된 계정이 없습니다.');
					}
				},
				error : function(error) {
					console.error(error);
					alert('오류가 발생했습니다.');
				}
			});//ajax end

		})//click
		

	//비밀번호 재설성  ajax
		$(".findPw").click(function() {

			find_Id_email = $("._find_pw_input_email").val();
			if (find_Id_email == '') {
				alert('이메일을 입력하세요.');
				return;
			}

			$.ajax({
				url : "checkingResettingEmails",
				type : "GET",
				data : {
					userEmail : find_Id_email
						
				}, // 이메일 값을 전달 성공시 비밀번호 재설정  
				success : function(response) {
					if (response == "success") {
						 // 이메일에 해당하는 계정이 있으면 폼을 보여줍니다.
		                $("#resetPasswordForm").show();
						 
		             // 첫 번째 입력 필드의 placeholder 값을 변경합니다.
		                $("._find_tit").text("비밀번호 재설정");
						 
		             	// 첫 번째 입력 필드의 placeholder 값을 변경합니다.
		                $("._find_pw_input_email").eq(0).attr("placeholder", "새로운 비밀번호"); 
						 
		                $(".btn.btn-primary._update_status.findPw").text("변경하기");
		                
		             	// 첫 번째 입력 필드의 클래스를 변경합니다.
		                $("._find_pw_input_email")
		                .removeClass("_find_pw_input_email")
		                .addClass("_find_pw_input_password");

		             // 버튼 텍스트 및 클래스를 변경합니다.
		        		$(".btn.btn-primary._update_status.findPw")
		        		  .removeClass("btn-primary _update_status findPw")
		        		  .addClass("btn btn-primary _update_status resetPw") // resetPw 클래스 추가
		        		  .text("변경하기");
		                
		                var inputValue = $("._find_pw_input_password").val();
						if (inputValue !== '') {
							inputValue = '';
							$("._find_pw_input_password").val(inputValue);
						}
						
						// 아이디 찾기와 비밀번호 찾기 버튼 히든 처리
						$(".btn.btn_find.col-xs-6, .btn.btn_find.col-xs-6.active").css("display", "none");
						
						// 가려진 영역에 메시지 표시
						var hiddenEmail = find_Id_email.substr(0, 3) + "****" + find_Id_email.substr(6);
						var messageHtml = '<p>입력하신 정보와 일치하는 계정을 찾았습니다. <strong>' + hiddenEmail + '</strong></p>';
						var tabWrap = $(".tab_wrap.clearfix");
						tabWrap.after('<div id="hiddenMessageArea">' + messageHtml + '</div>');
						
						// 중앙 정렬 스타일 추가
						$("#hiddenMessageArea").css({
						  "text-align": "center",
						  "margin-top": "20px"
						});
					} else {
						alert('오이');
						/*  $("#resetPasswordForm").hide(); */
					}
					
					 
					 
					 
				      // 컨트롤러와 연결되는 다른 버튼 클릭 이벤트 처리
					 $(".resetPw").one("click", function() {
					    var newPassword = $("input._find_pw_input_password").val();
					    var confirmPassword = $("input._find_pw_input_confirm_password").val();

					    if (newPassword === confirmPassword) {
					    	 $.ajax({
					             url: "changePassword",
					             type: "POST",
					             data: {
					                 newPassword: newPassword,
					                 confirmPassword: confirmPassword
					             },
					             success: function(response) {
					                 if (response === "success") {
					                     alert("비밀번호가 성공적으로 변경되었습니다.");
					                     // 비밀번호 변경 성공 시 필요한 동작 수행
					                 } else {
					                     alert("비밀번호 변경에 실패했습니다.");
					                     // 비밀번호 변경 실패 시 필요한 동작 수행
					                 }
					             },
					             error: function(error) {
					                 console.error(error);
					                 alert('오류가 발생했습니다.');
					             }
					         });
					     } else {
					         alert("비밀번호와 비밀번호 확인 값이 일치하지 않습니다.");
					     }
					 });
				},
				error : function(error) {
					console.error(error);
					alert('오류가 발생했습니다.');
				}
			});//ajax end

		})//click
		

	})
	
	
</script>

		</div>
	</div>

</body>