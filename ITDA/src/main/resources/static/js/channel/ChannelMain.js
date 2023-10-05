// 페이지 로드시 기본 탭 설정 (예: 게시글 탭이 기본으로 보이게 설정)
document.addEventListener("DOMContentLoaded", function() {
    showTab("articles");
});

// 탭을 보여주는 함수
function showTab(tabId) {
    // 모든 탭 컨텐츠를 숨깁니다.
    var tabContents = document.getElementsByClassName("tab_content");
    for (var i = 0; i < tabContents.length; i++) {
        tabContents[i].style.display = "none";
    }

    // 클릭한 탭 컨텐츠만 보여줍니다.
    document.getElementById(tabId).style.display = "block";

    // 탭 버튼 스타일을 설정합니다 (예: 선택된 탭은 활성화 스타일로 변경)
    var tabButtons = document.getElementsByClassName("tab_button");
    for (var i = 0; i < tabButtons.length; i++) {
        tabButtons[i].classList.remove("active");
    }
    document.getElementById(tabId + "_button").classList.add("active");

    // 주소 뒤에 # 뒤에 붙는 값을 수정
    window.location.hash = tabId; // 탭의 ID를 주소 뒤에 추가
}

// 탭 클릭 이벤트를 처리하는 함수
function onTabClick(tabId) {
    showTab(tabId);
}