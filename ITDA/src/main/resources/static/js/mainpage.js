$(function () {

	var appendData = "";
	var selectCategory = "";
	
    card = $('.reco_card')
    count = 1;

    function card_translate() {							//인기 게시글 로테이션
        for (let i = 0; i < card.length; i++) {
            rate = (i + count) % card.length;
            if (rate < 0) rate += card.length;
            card[i].style.transform = 'translate(' + rate + '00%,0px)'
        }
    }

    function rotate() {
        card_translate();
        count++;
    }

    function rotateReverse() {
        card_translate();
        count--;
    }

    rotate();
    setInterval(rotate, 3000);

    $('.left-area').click(rotate);
    $('.right-area').click(rotateReverse);

    $(".bt-item").click(function () {
        $(".bt-item.on").removeClass('on');
        $(this).addClass('on').css("box-shadow", "none");
    });

    function formatDate(timestampString) {
        var dateObject = new Date(timestampString);
        var year = dateObject.getFullYear();
        var month = (dateObject.getMonth() + 1).toString().padStart(2, '0');
        var day = dateObject.getDate().toString().padStart(2, '0');
        return year + '-' + month + '-' + day;
    }

    function callContents_ajax(categoryNum) {
        if (isCategoryButtonOn != categoryNum) {
            pageCount = FIRST_PAGE;
            isCategoryButtonOn = categoryNum;
            $(".popular-list-ul").html("");
        }
        $.ajax({
            type: "get",
            url: "main/contentByCategory",
            data: {
                categoryNum: categoryNum,
                pageCount: pageCount
            },
            dataType: "json",
            success: function (data) {
            
            
                $(data).each(function () {
                    if (data.length != 10) {					//로딩표시
                        $(".loader").css('display', 'none');
                    } else {
                        $(".loader").css('display', 'flex');
                    }
                    if (this.intro.length > 100) {
                        this.intro = this.intro.substring(0, 100) + "...";
                    }
                    if (this.boardTitle.length > 17) {
                        this.boardTitle = this.boardTitle.substring(0, 17) + "...";
                    }

                    
                    appendData += '<a href="contents/' + this.chNum + '/' + this.boardNum + '" class="popular-list-card">'
                        + '<li class="popular-list-content"><span class="popular-list-title">' + this.boardTitle + '</span><br>'
                        + '<p class="popular-list-text">' + this.intro + '</p></li>'
                        + '<li class="popular-list-imgframe">';
                    if (this.thumbNail == null) {
                        appendData += '<img src="resources/image/common/itda_logo3.png" class="popular-list-img"></li></a>'
                    } else {
                        appendData += '<img src="resources/image/contents/' + this.chNum
                         + this.thumbNail + '" class="popular-list-img"></li></a>'
                    }
                    
                });
                    $(".popular-list-ul").html(appendData);
            }
        });
    }

    let isCategoryButtonOn = $('.contents_category.on').prop('id')
    let isLoading = false; // 로딩 중인지 여부를 나타내는 변수 추가

    $('.contents_category').click(function () {					//오늘의 콘텐츠의 카테고리 버튼 클릭시
        if (isCategoryButtonOn == $(this).prop('id')) return;
        const categoryNum = $(this).prop('id');
        pageCount = FIRST_PAGE;
        isCategoryButtonOn = categoryNum;
        //$(".popular-list-ul").html("");
        // "더 보기" 버튼을 클릭한 것으로 처리하기 위해 isLoading 변수를 false로 설정
        isLoading = false;
        selectCategory = $(this);
        appendData = "";
        callContents_ajax(categoryNum);
    });

    const FIRST_PAGE = 1;
    let pageCount = FIRST_PAGE;
    let isExecuted = false;

    $('.load-more-button').click(function () {                  //"더 보기" 버튼 클릭 이벤트
        if (isLoading) return; // 이미 로딩 중인 경우 무시
        isLoading = true; // 로딩 시작
        pageCount++;
        selectCategory.addClass("on");
        callContents_ajax(isCategoryButtonOn);
        isLoading = false; // 로딩 종료
    });

    let firstEntrance = 0;
    callContents_ajax(firstEntrance);
});