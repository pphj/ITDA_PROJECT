<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- header 연결 -->
<link href="${pageContext.request.contextPath}/resources/css/channel/ChanelMain.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/channel/ChannelCategory_change.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/channel/ChannelProfile_change.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/channel/ChannelSetting.js"></script>
<jsp:include page="../include/header.jsp" />
</head>
<body>
	<!-- 수정 선택바 -->
	<div id="wrap">
		<div class="tab_contents">
			<div id="lnb_area">
				<div class="lnb">
					<ul role="menu">
						<li id="nid" role="presentation" class="on" aria-current="true">
							<a>채널프로필<em></em></a>
						</li>
						<li id="security" role="presentation" class="">
							<a>카테고리<em></em></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- <div class="tab_contents"> -->
		<main>
			<div class="wrap_contents">
				<div class="tab_content" id="content" style="background-color: #fff;">
					<!-- 프로필 수정 -->
					<div id="wrap">
						<div class="c_header">
							<h2>채널프로필 수정</h2>
							<p class="contxt">채널 대표 프로필과 채널명을 수정 하실 수 있습니다.</p>
						</div>
						<form id="profileForm" method="post" enctype="multipart/form-data">
							<input type="hidden" id="helpToken" name="token_help" value="dRlhbO0SeMUZ9v80"> <input type="hidden" id="deleteYn"
								name="deleteYn" value="N"> <input type="hidden" id="ieLessThan9Yn" name="ieLessThan9Yn" value="N">
							<fieldset>
								<legend>채널프로필 수정</legend>
								<table border="0" class="tbl_model">
									<caption>
										<span class="blind">채널프로필 수정</span>
									</caption>
									<colgroup>
										<col style="width: 22%">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">
												<div class="thcell">채널 사진</div>
											</th>
											<td>
												<div class="tdcell">
													<div class="profile_photo">
														    <label for="upfile">
														        <c:choose>
														            <c:when test="${empty SellerSetting.chProfile}">
														                <img id="imgThumb" src="../../image/main/login.png" width="100" height="100">
														            </c:when>
														            <c:otherwise>
														                <img id="imgThumb" src="../../image/channel/${SellerSetting.chNum}/${SellerSetting.chProfile}" width="100" height="100">
														            </c:otherwise>
														        </c:choose>
														       <span class="mask"></span>  
														    </label>    
													 </div>
													<div class="btn_area_btm">
															<span class="btn_file" >
																<label for="inputImage" class="btn_model"><b id="btnChangeProfile" class="btn2"
																	onclick="clickcr(this,'prf.upimg','','',event);">사진변경</b></label> 
																<input type="file" id="upfile" name="uploadfile">
															</span>
	
															 <a href="javascript:;" class="btn_model">
															 <b id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>
															
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">
												<div class="thcell">
													<label for="inpNickname">채널명</label>
													
												</div>
											</th>
											<td>
											    <div class="tdcell">
											        <input type="text" name="nickname" id="inpNickname" value="${SellerSetting.chName}" style="width: 254px">
											           <!-- Enter 입력으로 submit이 되는걸 방지하기 위한 Input -->
											           <input type="text" style="display: none;">
											    </div>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="btn_wrap">
									<a href="javascript:;" class="btn_model"><b id="btnConfirm" class="btn2 txt_disable"
										onclick="clickcr(this,'prf.apply','','',event);">적용</b></a> <a href="javascript:;" class="btn_model"><b id="btnCancel"
										class="btn2" onclick="clickcr(this,'prf.cancel','','',event);">취소</b></a>
								</div>
							</fieldset>
						</form>
					</div>
					<!-- class="tab_content" -->
				</div>

				<!-- 카테고리 변경 -->
				<div class="tab_content" id="content" style="background-color: #fff;">
					<div class="c_header">
						<h2>카테고리 수정</h2>
						<p class="contxt">채널 카테고리를 수정 하실 수 있습니다.</p>
					</div>
					<form id="profileForm" method="post" enctype="multipart/form-data">
						<input type="hidden" id="helpToken" name="token_help" value="dRlhbO0SeMUZ9v80"> <input type="hidden" id="deleteYn"
							name="deleteYn" value="N"> <input type="hidden" id="ieLessThan9Yn" name="ieLessThan9Yn" value="N">
						<fieldset>
							<legend>채널프로필 수정</legend>
							<table border="0" class="tbl_model">
								<caption>
									<span class="blind">채널프로필 수정</span>
								</caption>
								<colgroup>
									<col style="width: 22%">
									<col>
								</colgroup>
								<tbody>

									<tr>
										<th scope="row">
											<div class="thcell">카테고리</div>
										</th>
										<td>
											<div class="tdcell">
												<div class="category_box">
													<li class="channel_category_item">
														<a href="/hsacademy/hsacademy1/contents" class="channel_category_link" data-clk="chlh_category.listall"> <strong
															class="channel_category_name">전체</strong>
															<div class="channel_category_num">
																<a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable"
																	onclick="clickcr(this,'prf.delimg','','',event);">수정</b></a> <a href="javascript:;" class="btn_model"><b
																	id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>
															</div>
														</a>
													</li>
												</div>


												<ul class="channel_category_list">
													<div class="category_box">
														<li class="channel_category_item">
															<a href="/hsacademy/hsacademy1/contents" class="channel_category_link" data-clk="chlh_category.listall"> <strong
																class="channel_category_name">카테고리</strong>
																<div class="channel_category_num">
																	<a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable"
																		onclick="clickcr(this,'prf.delimg','','',event);">수정</b></a> <a href="javascript:;" class="btn_model"><b
																		id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>
																</div>
															</a>
														</li>


														<li class="channel_category_item">
															<a href="/hsacademy/hsacademy1/contents" class="channel_category_link" data-clk="chlh_category.listall"> <strong
																class="channel_category_name">카테고리</strong>
																<div class="channel_category_num">
																	<a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable"
																		onclick="clickcr(this,'prf.delimg','','',event);">수정</b></a> <a href="javascript:;" class="btn_model"><b
																		id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>
																</div>
															</a>
														</li>

														<li class="channel_category_item">
															<a href="/hsacademy/hsacademy1/contents" class="channel_category_link" data-clk="chlh_category.listall"> <strong
																class="channel_category_name">카테고리</strong>
																<div class="channel_category_num">
																	<a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable"
																		onclick="clickcr(this,'prf.delimg','','',event);">수정</b></a> <a href="javascript:;" class="btn_model"><b
																		id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>
																</div>
															</a>
														</li>

														<li class="channel_category_item">
															<a href="/hsacademy/hsacademy1/contents" class="channel_category_link" data-clk="chlh_category.listall"> <strong
																class="channel_category_name">카테고리</strong>
																<div class="channel_category_num">
																	<a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable"
																		onclick="clickcr(this,'prf.delimg','','',event);">수정</b></a> <a href="javascript:;" class="btn_model"><b
																		id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>
																</div>
															</a>
														</li>
												</ul>
											</div>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
							<div class="btn_wrap">
								<a href="javascript:;" class="btn_model"><b id="btnConfirm" class="btn2 txt_disable"
									onclick="clickcr(this,'prf.apply','','',event);">적용</b></a> <a href="javascript:;" class="btn_model"><b id="btnCancel"
									class="btn2" onclick="clickcr(this,'prf.cancel','','',event);">취소</b></a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<!-- <div class="wrap_contents"> -->
		</main>
	</div>
	<!-- <div id="wrap"> -->
	<jsp:include page="../include/footer.jsp" />
</body>
</html>