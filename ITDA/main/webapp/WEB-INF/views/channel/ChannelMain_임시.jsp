<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- header 연결 -->
<link href="${pageContext.request.contextPath}/resources/css/channel/ChanelMain.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/channel/ChanelMain_info.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/channel/ChanelMain_category.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/channel/ChanelMain_Seller.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/channel/ChanelMain_Sellercategory.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/channel/ChanelMain_Sellerinfo.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/channel/B.Home.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/channel/ChannelMain.js"></script>
<jsp:include page="../include/header.jsp" />
</head>
<body>
	<!--  채널바  -->
	<div class="wrap_profile">
		<div class="bloger_thumb">
			<img class="profileUserImage img_thumb" src="../image/channel/${ChannelList.chNum}/${ChannelList.chProfile}" width="100"
				height="100" alt="이미지정보"> <input class="profileUserImageUrl" type="hidden"
				value="http://t1.daumcdn.net/brunch/service/user/xTI/image/CGONwj7UEwl7YWVC2V6i2IeoLxY.JPG">
		</div>
		<div class="wrap_profile_desc">
			<strong class="profileUserName tit_bloger">${ChannelList.chName}</strong>
			<dl class="blog_count ">
				<dd>
					<a href="/@garangbimaker/follower" class="link_count #follower">
						<em class="txt_g">구독자</em>
						<span class="num_count">4,460</span>
					</a>
				</dd>
			</dl>
		</div>
		<div class="wrap_profile_btn">
			<input type="hidden" name="myWriter" value="false">
			<span class="#my_follow follow_button_wrapper">
			
					<sec:authorize access="isAuthenticated()">
	               	<sec:authentication property="principal" var="pinfo"/>
			               	<c:if test="${sellerinfo.userId == pinfo.userId}">
								<button type="button" class="btn_type btn_new_type btn_default btn_profile btnFollow #p_follow">
									<span class="txt_default">
										<img class="ico_plus" src="${pageContext.request.contextPath}/resources/image/channel/ico-plus.png">글작성
									</span>
								</button>
							</c:if>
					</sec:authorize>
					
					<button type="button" class="btn_type btn_new_type btn_default btn_profile btnFollow #p_follow">
						<span class="txt_default">
							<img class="ico_plus" src="../image/channel/ico-plus.png" alt="알림 버튼 아이콘">알림
						</span>
					</button>
					<button type="button" class="btn_type btn_new_type btn_default btn_profile btnFollow #p_follow">
						<span class="txt_default">
							<img class="ico_plus" src="../image/channel/ico-plus.png" alt="구독 버튼 아이콘">구독
						</span>
					</button>
			</span>
		</div><!-- <div class="wrap_profile_btn"> -->
		
		<div class="moe_control">
			<!-- 메뉴더보기 클릭시 ctrl_on 클래스 추가 -->
			<sec:authorize access="isAuthenticated()">
            <sec:authentication property="principal" var="pinfo"/>
            		<c:if test="${ChannelList.ownerId == pinfo.username || pinfo.username =='admin' }">
						<button type="button" class="setting_button" style="background-color: white; border: none;">
							<span class="txt_default2">
								<img class="setting_img" src="${pageContext.request.contextPath}/resources/image/channel/setting.png"
									style="width: 30px; height: 30px; padding-left: 660px; opacity: 0.6;" alt="메뉴 더보기">
							</span>
						</button>
						<!-- <div class="layer_action_ctrl">
						                <div class="inner_action_ctrl">
						                       <button type="button" class="btnBlockProfile btn_ctrl requireLogin">차단하기</button>
						                       <button type="button" class="btnReportProfile btn_ctrl requireLogin">신고하기</button>
						                </div>
						      </div>
						 -->
					</c:if>
			</sec:authorize>
		</div><!-- <div class="moe_control"> -->
	</div>
	<!-- <div class="wrap_profile"> 채널바 -->

	<!-- 탭 메뉴 -->
	<div class="tab_contents">
		<!-- <ul id="contentsTab" class="list_tab">
			<li><a href="#info" class="infoTab link_tab #info_open"> <span
					class="txt_tab">채널소개</span>
			</a></li>

			<li class="on"><a href="#articles" class="articleTab link_tab">
					<span class="txt_tab">게시글</span>
			</a></li>

			<li><a href="#works" class="magazineTab link_tab"> <span
					class="txt_tab">카테고리</span>
			</a></li>
		</ul> -->
		
		<ul id="contentsTab" class="list_tab">
			<li>
				<a href="javascript:void(0);" class="infoTab link_tab #info_open" id="info_tab" onclick="onTabClick('info')">
					<span class="txt_tab">채널소개</span>
				</a>
			</li>
			<li>
				<a href="javascript:void(0);" class="articleTab link_tab" id="articles_tab" onclick="onTabClick('articles')">
					<span class="txt_tab">게시글</span>
				</a>
			</li>
			<li>
				<a href="javascript:void(0);" class="magazineTab link_tab" id="works_tab" onclick="onTabClick('works')">
					<span class="txt_tab">카테고리</span>
				</a>
			</li>
		</ul>
	</div><!-- <div class="tab_contents"> 탭 메뉴-->
	
	<main>
		<div class="wrap_contents">
			<!-- 게시글(글) -->
			<div class="tab_content" id="articles">
				<div class="article_wrap_contents">
					<div id="wrapInfo" class="wrap_authorinfo #my_profile_info" style="display: none;">
						<h3 class="screen_out">작가소개</h3>
						<div id="infoLoadSpinner" class="layer-more-loading" style="display: none">
							<div class="loader">
								<div class="dot dot1"></div>
								<div class="dot dot2"></div>
								<div class="dot dot3"></div>
							</div>
						</div>
					</div>

					<div id="wrapArticle" class="wrap_article #my_post">
						<div class="wrap_article_list">
							<c:forEach var="c" items="${ChannelBoardList}">
								<ul class="list_article list_post1 #post_list">
									<li data-articleuid="xTI_303" class="animation_up" data-tiara-action-name="작가 프로필 > 글탭 > 리스트 클릭"
										data-tiara-action-kind="ClickContent" data-tiara-layer="articles" data-tiara-id="@@xTI">
										<a href="/magazine/whatwetalkabout" class="link_category">
											<em class="tit_category">${c.chCate_Name}</em>
										</a>
										<a href="${pageContext.request.contextPath}/contents/${ChannelList.chNum}/${c.boardNum}"
											class="link_post has_image #post_listview">
											<strong class="tit_subject"> <%-- 글자 수 제한 적용 --%> <c:set var="limitedTitle" value="${c.boardTitle}" /> <c:choose>
													<c:when test="${fn:length(c.boardTitle) > 35}">
														<c:set var="limitedTitle" value="${fn:substring(c.boardTitle, 0, 35)}..." />
													</c:when>
												</c:choose> ${limitedTitle}
											</strong>

											<div class="post_thumb">
												<img class="img_thumb" src="../image/contents/${ChannelList.chNum}/a/${c.thumbNail}"
													style="width: 120px; height: 120px;" alt="이미지정보">
												<!-- src="../image/channel/channel1.jpeg" -->
											</div>

											<div class="post_desc">

												<div class="wrap_sub_content">
													<span class="ico_bar"></span>
													<span class="article_content"> ${c.intro} </span>
												</div>
											</div>

											<!-- 
											<span class="post_append" style="white-space: nowrap">
												<span class="ico_dot"></span>
												<span class="publish_time">8시간전</span>
											</span> -->
										</a>
									</li>
								</ul>
							</c:forEach>
						</div><!-- <div class="wrap_article_list"> -->
					</div><!-- 	<div id="wrapArticle" class="wrap_article #my_post"> -->
				</div><!-- <div class="wrap_contents"> 게시글 -->
			</div><!--<div class="tab_content">-->

			<!-- 작가소개 -->
			<div class="tab_content" id="info">
				<div class="author_intro animation_up">
					<strong class="tit_intro">채널소개</strong>
					<p class="desc_intro">${ChannelList.chInfo}</p>
					<!-- 태그 -->
					<!-- <ul class="list_tag">
						<li>
							<a href="/keyword/profile/에세이" class="link_tag #profilekeyword">에세이</a>
						</li>
						<li>
							<a href="/keyword/profile/가족" class="link_tag #profilekeyword">가족</a>
						</li>
						<li>
							<a href="/keyword/profile/육아" class="link_tag #profilekeyword">육아</a>
						</li>
						<li>
							<a href="/keyword/profile/의사" class="link_tag #profilekeyword">의사</a>
						</li>
						<li>
							<a href="/keyword/profile/출간작가" class="link_tag #profilekeyword">출간작가</a>
						</li>
						<li>
							<a href="/keyword/profile/교수" class="link_tag #profilekeyword">교수</a>
						</li>
					</ul> -->
				</div><!-- <div class="author_intro animation_up"> 작가소개 -->
				
				<!-- 통계 -->
				<div class="author_intro animation_up">
					<strong class="tit_intro">구독자 통계</strong>
					<div class="slide_book slide_basic">
						<div class="inner_slide">
							<ul class="list_book" data-page="1" style="width: 221px; transition-duration: 0.3s;">
								<li>
									<div class="channel_stats">
										<div class="channel_stats_both">
											<div class="channel_stats_left">
												<ul class="channel_stats_graph">
													<li class="channel_stats_item">
														<div class="channel_stats_bar">
															<div class="channel_stats_bar_value" style="height: 2%;">
																<span class="channel_stats_bar_percent">1%</span>
															</div>
														</div>
														<!-- <div class="channel_stats_legend">10<span class="channel_stats_legend_unit">대</span></div> -->
													</li>
													<li class="channel_stats_item">
														<div class="channel_stats_bar">
															<div class="channel_stats_bar_value is_2" style="height: 64%;">
																<span class="channel_stats_bar_percent">24%</span>
																<span class="channel_stats_bar_text">
																	2
																	<span class="blind">위</span>
																</span>
															</div>
														</div>
													</li>
													<li class="channel_stats_item">
														<div class="channel_stats_bar">
															<div class="channel_stats_bar_value is_1" style="height: 100%;">
																<span class="channel_stats_bar_percent">38%</span>
																<span class="channel_stats_bar_text">
																	1
																	<span class="blind">위</span>
																</span>
															</div>
														</div>
													</li>
													<li class="channel_stats_item">
														<div class="channel_stats_bar">
															<div class="channel_stats_bar_value" style="height: 63%;">
																<span class="channel_stats_bar_percent">24%</span>
															</div>
														</div>
													</li>
													<li class="channel_stats_item">
														<div class="channel_stats_bar">
															<div class="channel_stats_bar_value" style="height: 29%;">
																<span class="channel_stats_bar_percent">11%</span>
															</div>
														</div>
													</li>
													<li class="channel_stats_item">
														<div class="channel_stats_bar">
															<div class="channel_stats_bar_value" style="height: 7%;">
																<span class="channel_stats_bar_percent">3%</span>
															</div>
														</div>
													</li>
												</ul>
											</div>
											<!-- 원 통계 -->
											<div class="channel_stats_right">
												<div class="channel_stats_donut">
													<div id="_CHANNEL_HOME_PROFILE_SUBSCRIBER_GENDER" class="pie_chart _gender_chart bb" style="position: relative;">
														<svg width="130" height="130" style="overflow: hidden; display: block;">
														<g class="bb-main" transform="translate(0.5, 0.5)">
														
														<g class="bb-chart" clip-path="">
														<g class="bb-chart-arcs" transform="translate(65, 60)">
														<g class="bb-chart-arc bb-target bb-target-female">
														
														<g class="bb-shapes bb-shapes-female bb-arcs bb-arcs-female">
														<path class="bb-shape bb-shape bb-arc bb-arc-female" transform="scale(1,1)" style="fill: rgb(232, 147, 147);"
																d="M-53.286345393897996,-20.237722069496993A57,57,0,0,1,-1.726449813346965,-56.97384813264762L-1.726449813346935,-38.961768068736234A39,39,0,0,0,-36.26181095760991,-14.355523887150968Z"></path>
														</g>
														
														<text dy=".35em" transform="translate(-11.141215697917236,-15.636921460840131)"
																style="text-anchor: middle; pointer-events: none;">19%</text>
														</g>
														
														<g class="bb-chart-arc bb-target bb-target-male">
														<g class="bb-shapes bb-shapes-male bb-arcs bb-arcs-male">
														<path class="bb-shape bb-shape bb-arc bb-arc-male" transform="scale(1,1)" style="fill: rgb(102, 135, 187);"
																d="M1.7264498133468948,-56.97384813264762A57,57,0,1,1,-54.41395752064261,-16.974134055724363L-37.38942308435453,-11.09193587337831A39,39,0,1,0,1.726449813346887,-38.961768068736234Z"></path>
														</g>
														
														<text dy=".35em" transform="translate(11.141215697917218,15.63692146084014)"
																style="text-anchor: middle; pointer-events: none;">81%</text>
														</g>
														</g></g></g>
														</svg>
														<div class="bb-tooltip-container" style="position: absolute; pointer-events: none; display: none;"></div>
													</div>
													<div class="channel_stats_donutlegend">
														<span class="channel_stats_donutlegend_item _GENDER is_female" data-id="female" data-percent="0.1921540991308433">여자</span>
														<span class="channel_stats_donutlegend_item _GENDER is_male" data-id="male" data-percent="0.8078459008691566">남자</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 	<div class="author_intro animation_up"> 통계 -->
			</div>
			<!-- <div class="tab_content" -->
			
			<!-- 카테고리 내용 -->
			<div class="tab_content" id="works">
				<div class="category_wrap_contents">
					<ul class="channel_category_list">
						<li class="channel_category_item">
							<a href="${pageContext.request.contextPath}/channels/contentlist.co?chnum=${ChannelList.chNum}&chcate_id=0&chname=${ChannelList.chName}" class="channel_category_link">
								<strong class="channel_category_name">전체</strong>
										<!-- <div class="channel_category_num">493</div>  -->
							</a>
						</li>
						<c:forEach var="c" items="${ChannelCategory}">
							<li class="channel_category_item">	
								<a href="${pageContext.request.contextPath}/channels/contentlist.co?chnum=${ChannelList.chNum}&chcate_name=${c.chCate_Name}&chcate_id=${c.chCate_Id}&chname=${ChannelList.chName}" 
										class="channel_category_link">
 									<strong class="channel_category_name">${c.chCate_Name}</strong>
										<!-- <div class="channel_category_num">갯수</div> -->								
								</a>
							</li>
						</c:forEach>
					</ul>
				</div><!-- 	<div class="wrap_contents"> 카테고리 -->
			</div><!-- <div class="tab_content"> -->
		</div>
		<!-- <div class="wrap_contents"> -->
	</main>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>