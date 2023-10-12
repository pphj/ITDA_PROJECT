// 탭 클릭 이벤트 처리 함수
function onTabClick(tabId) {
    // 모든 탭 콘텐츠를 숨김
    $(".tab_content").hide();

    // 클릭한 탭 콘텐츠를 fade 애니메이션으로 보이도록 설정
    $("#" + tabId).css('opacity', 0).show().animate({ opacity: 1 }, 400); // 400 밀리초 동안 애니메이션
    
    // 모든 탭 메뉴 스타일 초기화
    $(".list_tab li").removeClass("on");

    // 클릭한 탭 메뉴에 'on' 클래스 추가
    $("#" + tabId + "_tab").parent().addClass("on");
}

// 드롭다운 버튼 클린 이벤트 처리 함수
function onDropdownButtonClick() {
	$(".layer_action_ctrl").toggle();
}

$(document).ready(function() {
	// 초기에는 'articles' 탭을 보이도록 설정
	onTabClick('articles');

	// 드롯다운 버튼에 이벤트 핸들러 연결
	$("#settingButton").click(onDropdownButtonClick);
});