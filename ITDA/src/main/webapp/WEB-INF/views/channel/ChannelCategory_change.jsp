<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- header 연결 -->
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/ChannelCategory_change.css" />
<title>ChannelCategory_change.jsp</title>
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
					<li id="nid" role="presentation" class="" aria-current="true"><a
						href="/user2/help/myInfoV2?m=viewProfile&amp;lang=ko_KR"
						role="menuitem" onclick="clickcr(this,'lnb.info','','',event);">프로필수정<em></em></a></li>
					<li id="security" role="presentation" class="on"><a
						href="/user2/help/myInfoV2?m=viewSecurity&amp;lang=ko_KR"
						role="menuitem" onclick="clickcr(this,'lnb.protect','','',event);">카테고리수정<em></em></a></li>
				</ul>
			</div>
		</div>

		<!-- 카테고리 변경 -->
		<div id="content" style="background-color: #fff;">
	    <div class="c_header">
	        <h2>카테고리 수정</h2>
	        <p class="contxt">채널 카테고리를 수정 하실 수 있습니다.</p>
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
	                        <div class="thcell">카테고리</div>
	                    </th>
	                    <td>
	                        <div class="tdcell">
	                        		<div class="category_box">
		                       	 		<li class="channel_category_item">
											<a href="/hsacademy/hsacademy1/contents" class="channel_category_link" data-clk="chlh_category.listall">
												<strong class="channel_category_name">전체</strong>
												<div class="channel_category_num">
												 	<a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">수정</b></a>
		                            			 	<a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>	             
												</div>
											</a>
										</li>
									</div>  
									
									
									  <ul class="channel_category_list">
									  		<div class="category_box">
												<li class="channel_category_item">
													<a href="/hsacademy/hsacademy1/contents" class="channel_category_link" data-clk="chlh_category.listall">
														<strong class="channel_category_name">카테고리</strong>
														<div class="channel_category_num">
														 <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">수정</b></a>
				                            			 <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>	             
														</div>
													</a>
												</li> 
										
										  
											<li class="channel_category_item">
												<a href="/hsacademy/hsacademy1/contents" class="channel_category_link" data-clk="chlh_category.listall">
													<strong class="channel_category_name">카테고리</strong>
													<div class="channel_category_num">
													 <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">수정</b></a>
			                            			 <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>	             
													</div>
												</a>
											</li>
											
											<li class="channel_category_item">
												<a href="/hsacademy/hsacademy1/contents" class="channel_category_link" data-clk="chlh_category.listall">
													<strong class="channel_category_name">카테고리</strong>
													<div class="channel_category_num">
													 <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">수정</b></a>
			                            			 <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>	             
													</div>
												</a>
											</li>    
											
											<li class="channel_category_item">
												<a href="/hsacademy/hsacademy1/contents" class="channel_category_link" data-clk="chlh_category.listall">
													<strong class="channel_category_name">카테고리</strong>
													<div class="channel_category_num">
													 <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">수정</b></a>
			                            			 <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2 btn_disable" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>	             
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
	                <a href="javascript:;" class="btn_model"><b id="btnConfirm" class="btn2 txt_disable" onclick="clickcr(this,'prf.apply','','',event);">적용</b></a>
	                <a href="javascript:;" class="btn_model"><b id="btnCancel" class="btn2" onclick="clickcr(this,'prf.cancel','','',event);">취소</b></a>
	            </div>
	        </fieldset>
	    </form>
			<div class="resize-triggers"><div class="expand-trigger"><div style="width: 955px; height: 597px;"></div></div><div class="contract-trigger"></div></div></div>
	</div>
</body>
</html>