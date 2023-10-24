<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" data-useragent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36">
<head>
	<title>채널 및 콘텐츠 검색</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/premium_service3.css">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/image/main/tv_icon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script>
	 
</script>

	<script src="${pageContext.request.contextPath}/resources/js/search/itda_common.js"></script>
</head>
<body class="">
<div class="u_skip"><a href="#ct">본문 바로가기</a></div>
<div id="_CONTENT_INDICATOR_WRAP" style="display:none;">
	<label for="_CONTENT_INDICATOR" class="blind">페이지 스크롤 진행률</label>
	<progress id="_CONTENT_INDICATOR" class="progress" max="100" value="0"></progress>
</div>
<hr>
<script>
 
	
</script>
<div class="premium_search_page">
    <div class="psp_main">
        <div class="psp_head">
            <div class="psp_head_inner">
                <div class="psp_head_content">
                    <a href="#" class="psp_back_button _BACK" data-clk="pch_search.back"><span class="blind">뒤로가기</span></a>
                  <div class="psp_input_wrap _SEARCH_INPUT_WRAP non_searching">
				    <input id="_SEARCH_INPUT" type="text" class="psp_search_input" value="<%= request.getParameter("searchQuery") %>" data-url="/main/search" data-search-query="<%= request.getParameter("searchQuery") %>" autocomplete="off">
				    <button id="_SEARCH_RESET_BTN" type="button" class="psp_input_cancel_button" data-clk="pch_search.close">삭제</button>
				    
				</div>
                    <button type="button" class="psp_search_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.search" data-url="${pageContext.request.contextPath}/main/search" data-search-value="true"><span class="blind">검색</span></button>
                </div>
            </div>
        </div>
        
        
    <!-- 이 부분부터는 변경 없이 유지됩니다. -->
		<div class="psp_nav _SEARCH_RESULT_AREA">
			<div class="psp_nav_inner">
				<ul class="psp_nav_list" role="tablist">
					<li class="psp_nav_item" role="tab" aria-selected="true">
						<a href="#" class="psp_nav_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.taball" data-url="/search/result">전체</a>
					</li>
					<li class="psp_nav_item" role="tab" aria-selected="false">
						<a href="#" class="psp_nav_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.tabch" data-url="/search/ch/channel">채널</a>
					</li>
					<li class="psp_nav_item" role="tab" aria-selected="false">
						<a href="#" class="psp_nav_button _SEARCH_SUBMIT_BTN" data-clk="pch_search.tabcont" data-url="/search/ch/content">콘텐츠</a>
					</li>
				</ul>
			</div>
		</div>

        
        
        
        
        
        
      
    </div>
</div>



    



<script src="${pageContext.request.contextPath}/resources/js/search/itda_read.js"></script> 
<script>

$(document).ready(function() {
    $('.psp_nav_button').click(function(e) {
        e.preventDefault();

        // 클릭된 탭의 data-tab 값을 가져옴
        var tabId = $(this).attr('data-tab');

        // 이동할 URL 생성
        var newURL = "";
        if (tabId === 'taball') {
            newURL = "/ch/search";
        } else if (tabId === 'tabch') {
            newURL = "/itda/main/search/result?/channel"; // 변경된 URL
        } else if (tabId === 'tabcont') {
            newURL = "/itda/main/search/result?/content"; // 변경된 URL
        }

        // 페이지 이동
        window.location.href = newURL;
    });
});
</script>



 






<!-- 이하의 코드는 변경 없이 유지됩니다. -->
</body>
</html>
