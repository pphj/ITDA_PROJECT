<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- header 연결 -->
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/ChannelProfile_change.css" />
<title>ChannelProfile_change.jsp</title>
</head>
<body>
	<!--  header  -->
	<div class="header">
		<img class="logo" src="../image/common/logo.png">
		<div class="icon">
			<p class="login">로그인</p>
			<img class="search" src="../image/common/search.png">
		</div>
	</div>
	<hr class="hr">
	
	<!-- 수정 선택바 -->
	<div id="wrap">
		<div id="lnb_area">
			<div class="lnb">
				<ul role="menu">
					<li id="nid" role="presentation" class="on" aria-current="true"><a
						href="/user2/help/myInfoV2?m=viewProfile&amp;lang=ko_KR"
						role="menuitem" onclick="clickcr(this,'lnb.info','','',event);">프로필수정<em></em></a></li>
					<li id="security" role="presentation" class=""><a
						href="/user2/help/myInfoV2?m=viewSecurity&amp;lang=ko_KR"
						role="menuitem" onclick="clickcr(this,'lnb.protect','','',event);">카테고리수정<em></em></a></li>
				</ul>
			</div>
		</div>
		<div id="wrap">
		<!-- CONTENTS -->
		<div id="content" style="background-color: #fff;">
	    <div class="c_header">
	        <h2>프로필 수정</h2>
	        <p class="contxt">채널 대표 프로필과 채널명을 수정 하실 수 있습니다.</p>
	    </div>
	    <form id="profileForm" method="post" enctype="multipart/form-data">
	        <input type="hidden" id="helpToken" name="token_help" value="dRlhbO0SeMUZ9v80">
	        <input type="hidden" id="deleteYn" name="deleteYn" value="N">
	        <input type="hidden" id="ieLessThan9Yn" name="ieLessThan9Yn" value="N">
	        <fieldset>
	            <legend>프로필 수정</legend>
	            <table border="0" class="tbl_model">
	                <caption><span class="blind">채널프로필 수정</span></caption>
	                <colgroup>
	                    <col style="width:22%"><col>
	                </colgroup>
	                <tbody>
	                <tr>
	                    <th scope="row">
	                        <div class="thcell">채널 사진</div>
	                    </th>
	                    <td>
	                        <div class="tdcell">
	                            <div class="profile_photo">
	                                <img id="imgThumb" src="https://static.nid.naver.com/images/web/user/default.png?type=s160" width="100" height="100">
	                                <span class="mask"></span>
	                            </div>
	                            <div class="btn_area_btm">
	                                <span class="btn_file">
	                                    <label for="inputImage" class="btn_model"><b id="btnChangeProfile" class="btn2" onclick="clickcr(this,'prf.upimg','','',event);">사진변경</b></label>
	                                    <input type="file" id="inputImage" name="profileImage" accept="image/*">
	                                </span>
	                             
	                                <div id="coach_tooltip" class="coach_tooltip" style="display: none;">
	                                    <span class="tooltip_img" aria-hidden="true"></span>
	                                    <a href="#" class="txt_tooltip" onclick="clickcr(this,'prf.avtind','','',event);"><span class="txt">
									<em>캐릭터</em>를 만들어 <em>프로필</em> 이미지로 등록해 보세요.
								</span></a>
	                                    <button type="button" class="btn_tooltip_close_area" aria-label="닫기" onclick="closeToolTip();clickcr(this,'prf.avtindx','','',event);"><span class="btn_tooltip_close"></span></button>
	                                </div>
	                                <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>
	                            </div>
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row">
	                        <div class="thcell"><label for="inpNickname">채널명</label></div>
	                    </th>
	                    <td>
	                        <div class="tdcell">
	                            <p class="contxt_webctrl nickname">
	                                <input type="text" name="nickname" id="inpNickname" value="채널이름" style="width:254px" onclick="clickcr(this,'prf.nick','','',event);">
	                                <!-- Enter 입력으로 submit이 되는걸 방지하기 위한 Input -->
	                                <input type="text" style="display: none;">
	                            </p>
	                        </div>
	                    </td>
	                </tr>
	                </tbody>
	            </table>
	            <div class="btn_wrap">
	                <a href="javascript:;" class="btn_model"><b id="btnConfirm" class="btn2 txt_disable" onclick="clickcr(this,'prf.apply','','',event);">적용</b></a>
	                <a href="javascript:;" class="btn_model"><b id="btnCancel" class="btn2" onclick="clickcr(this,'prf.cancel','','',event);">취소</b></a>
	            </div>
	        </fieldset>
	    </form>
			<div class="resize-triggers"><div class="expand-trigger"><div style="width: 955px; height: 597px;"></div></div><div class="contract-trigger"></div></div></div>
		</div>
	</div>
</body>
</html>