// JavaScript 코드 시작
function onTabClick(tabId) {
    // 모든 탭 콘텐츠를 숨기기
    $(".tab_content").hide();
    
    // 클릭한 탭 콘텐츠만 보이도록 설정
    $("#" + tabId).show();
    
    // 모든 탭 메뉴 스타일 초기화
    $(".list_tab li").removeClass("on");
    
    // 클릭한 탭 메뉴에 'on' 클래스 추가
    $("#" + tabId + "_tab").parent().addClass("on");
}

$(document).ready(function() {
    // 초기에는 'articles' 탭을 보이도록 설정
    onTabClick('articles');
});