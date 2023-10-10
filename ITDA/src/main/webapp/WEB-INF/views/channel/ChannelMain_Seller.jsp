<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- header 연결 -->
<link href="${pageContext.request.contextPath}/resources/css/channel/ChanelMain_Seller.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/channel/ChanelMain_Sellercategory.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/channel/ChanelMain_Sellerinfo.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/channel/B.Home.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/channel/ChannelSellerMain.js"></script>
<jsp:include page="../include/header.jsp" />
<title>ChannelMain_Seller.jsp</title>
</head>
<body>
	<!--  채널바  -->
	<div class="wrap_profile">
		<div class="bloger_thumb">
			<img class="profileUserImage img_thumb" src="${pageContext.request.contextPath}/resources/image/channel/channel.jpeg" width="100" height="100" alt="이미지정보"
				data-image="//img1.daumcdn.net/thumb/C500x500.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/xTI/image/CGONwj7UEwl7YWVC2V6i2IeoLxY.JPG">
			<input class="profileUserImageUrl" type="hidden"
				value="http://t1.daumcdn.net/brunch/service/user/xTI/image/CGONwj7UEwl7YWVC2V6i2IeoLxY.JPG">
		</div>
		<div class="wrap_profile_desc">
			<strong class="profileUserName tit_bloger">${ChSellerdetail.chName}</strong>

			<dl class="blog_count ">
				<dd>
					<a href="/@garangbimaker/follower" class="link_count #follower"> <em class="txt_g">구독자</em> <span class="num_count">4,460</span>
					</a>
				</dd>
			</dl>
		</div>
		<div class="wrap_profile_btn">
			<input type="hidden" name="myWriter" value="false">
			<span class="#my_follow follow_button_wrapper">
				<button type="button" class="btn_type btn_new_type btn_default btn_profile btnFollow #p_follow">
					<span class="txt_default">
						<img class="ico_plus" src="${pageContext.request.contextPath}/resources/image/channel/ico-plus.png">글작성
					</span>
				</button>
			</span>
		</div>

		<div class="moe_control">
			<!-- 메뉴더보기 클릭시 ctrl_on 클래스 추가 -->
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
		</div>

	</div>

	<div class="tab_contents">
		<ul id="contentsTab" class="list_tab">
			<li>
				<a href="javascript:void(0);" class="infoTab link_tab #info_open" id="info_tab" onclick="onTabClick('info')"> <span
						class="txt_tab">채널소개</span>
				</a>
			</li>
			<li>
				<a href="javascript:void(0);" class="articleTab link_tab" id="articles_tab" onclick="onTabClick('articles')"> <span
						class="txt_tab">게시글</span>
				</a>
			</li>
			<li>
				<a href="javascript:void(0);" class="magazineTab link_tab" id="works_tab" onclick="onTabClick('works')"> <span
						class="txt_tab">카테고리</span>
				</a>
			</li>
		</ul>
	</div>

	<!-- <div class="tab_contents"> 탭 메뉴-->
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
							<ul class="list_article list_post1 #post_list">
								<li data-articleuid="xTI_303" class="animation_up" data-tiara-action-name="작가 프로필 > 글탭 > 리스트 클릭"
									data-tiara-action-kind="ClickContent" data-tiara-layer="articles" data-tiara-id="@@xTI">
									<a href="/magazine/whatwetalkabout" class="link_category"> <em class="tit_category"> A에서 Z 사이에서 나눈 말 </em>
									</a> <a href="/@garangbimaker/303" class="link_post has_image #post_listview"> <strong class="tit_subject"> E의 말
											“아무것도 할 수 없어서 읽고 또 읽었어요.” </strong>

										<div class="post_thumb">
											<img class="img_thumb" src="../image/channel/channel1.jpeg" style="width: 120px; height: 120px;" alt="이미지정보">
										</div>

										<div class="post_desc">
											<div class="wrap_sub_content">
												<em class="tit_sub">부산에서 독자 E의 말</em>
												<span class="ico_bar"></span>
												<span class="article_content"> 신간 3종의 데이터를 검수하고 강의 자료를 준비하며 19일간 자정께 집에 집에 닿았다. 회계 정리와 업무 메일 발송, 번거로운 잡무를 정리하며
													허둥대다 보면 반나절이 허무하게 끝나버리는 하루하루를 보냈다. 구멍가게도 나름의 원리와 나름의 고충이 있다는 것은 출판사를 시작하며 알게 됐다. 새벽 일찍 밖을 나서서 늦은 저녁까지 깨어 있다고 해서 당장에
													읽어주는 </span>
											</div>
										</div> <span class="post_append" style="white-space: nowrap">
											<span class="ico_dot"></span>
											<span class="publish_time">8시간전</span>
										</span>
									</a>
								</li>


								<li data-articleuid="xTI_303" class="animation_up" data-tiara-action-name="작가 프로필 > 글탭 > 리스트 클릭"
									data-tiara-action-kind="ClickContent" data-tiara-layer="articles" data-tiara-id="@@xTI">
									<a href="/magazine/whatwetalkabout" class="link_category"> <em class="tit_category"> 아이라는 놀라운 세계 </em>
									</a> <a href="/@garangbimaker/303" class="link_post has_image #post_listview"> <strong class="tit_subject"> 엄마의
											소풍 도시락 </strong>

										<div class="post_thumb">
											<img class="img_thumb" src="../image/channel/channel2.jpeg" style="width: 120px; height: 120px;" alt="이미지정보">
										</div>

										<div class="post_desc">
											<div class="wrap_sub_content">
												<em class="tit_sub">부산에서 독자 E의 말</em>
												<span class="ico_bar"></span>
												<span class="article_content"> 올해 봄 둘째 아이가 유치원에서 동물원으로 소풍을 갔다. 알림장에는 '가정에서 직접 만든' 점심을 보내달라는 문구가 적혀 있었다. 구운 고기,
													밀키트 그리고 외식으로 아이들의 끼니를 이어나가고 있던 나는 난감해졌다. '가정에서 직접 만든' 음식이면 무얼 만들어야 하지. 고민 끝에 김밥을 도전해 볼 생각으로 마트에서 몇 가지 재료를 사 왔다. 막상 식탁
													위 </span>
											</div>
										</div> <span class="post_append" style="white-space: nowrap">
											<span class="ico_dot"></span>
											<span class="publish_time">8시간전</span>
										</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="tab_content" id="articles"> -->


			<!-- 작가소개 -->
			<div class="tab_content" id="info">
				<div class="author_intro animation_up">
					<div class="author_intro animation_up">
						<strong class="tit_intro">채널소개</strong>
						<p class="desc_intro">마음속에 담아둔 말이 많은 내과 의사. 마흔을 앞둔 지금, 의학 '드라마'가 아닌 진짜 이야기를 쓰고 싶습니다.</p>
						<ul class="list_tag">
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
						</ul>
					</div>

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
				</div>
				<!-- <div class="author_intro animation_up"> -->
			</div>
			<!-- <div class="tab_content" -->

			<!-- 카테고리 내용 -->
			<div class="tab_content" id="works">
				<div class="category_wrap_contents">
					<ul class="channel_category_list">
						<li class="channel_category_item">
							<a href="/usa/nasdaq/contents" class="channel_category_link" data-clk="chlh_category.listall"> <strong
								class="channel_category_name">전체</strong>
								<div class="channel_category_num">493</div>
							</a>
						</li>
						<li class="channel_category_item">
							<a href="/usa/nasdaq/contents?categoryId=17be87ffaa1000h5l" class="channel_category_link" data-clk="chlh_category.list">
								<strong class="channel_category_name">지난주 실적과 이슈</strong>
								<div class="channel_category_num">103</div>
							</a>
						</li>
						<li class="channel_category_item">
							<a href="/usa/nasdaq/contents?categoryId=17be8803899000vts" class="channel_category_link" data-clk="chlh_category.list">
								<strong class="channel_category_name">시장경제의 이해</strong>
								<div class="channel_category_num">113</div>
							</a>
						</li>
						<li class="channel_category_item">
							<a href="/usa/nasdaq/contents?categoryId=17be880c024000lq0" class="channel_category_link" data-clk="chlh_category.list">
								<strong class="channel_category_name">신기술과 테마</strong>
								<div class="channel_category_num">97</div>
							</a>
						</li>
						<li class="channel_category_item">
							<a href="/usa/nasdaq/contents?categoryId=17be8815662000j2x" class="channel_category_link" data-clk="chlh_category.list">
								<strong class="channel_category_name">개별회사 소개</strong>
								<div class="channel_category_num">66</div>
							</a>
						</li>
						<li class="channel_category_item">
							<a href="/usa/nasdaq/contents?categoryId=17be8812f2d000wzk" class="channel_category_link" data-clk="chlh_category.list">
								<strong class="channel_category_name">SEC공시분석 강좌</strong>
								<div class="channel_category_num">27</div>
							</a>
						</li>
						<li class="channel_category_item">
							<a href="/usa/nasdaq/contents?categoryId=17d75a3ca2d000mlo" class="channel_category_link" data-clk="chlh_category.list">
								<strong class="channel_category_name">투자 방법론</strong>
								<div class="channel_category_num">59</div>
							</a>
						</li>
						<li class="channel_category_item">
							<a href="/usa/nasdaq/contents?categoryId=17c68e9a677000nan" class="channel_category_link" data-clk="chlh_category.list">
								<strong class="channel_category_name">미주사 정보국</strong>
								<div class="channel_category_num">3</div>
							</a>
						</li>
						<li class="channel_category_item">
							<a href="/usa/nasdaq/contents?categoryId=17be86622ec000mfd" class="channel_category_link" data-clk="chlh_category.list">
								<strong class="channel_category_name">공지사항</strong>
								<div class="channel_category_num">23</div>
							</a>
						</li>
					</ul>
				</div>
				<!-- 	<div class="wrap_contents"> 카테고리 -->
			</div>
			<!-- <div class="tab_content"> -->
		</div>
		<!-- <div class="wrap_contents"> -->
	</main>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>