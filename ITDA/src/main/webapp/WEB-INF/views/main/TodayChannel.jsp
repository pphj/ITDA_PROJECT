<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(document).ready(function () {
        // 초기 카테고리 값을 설정합니다.
        let selectedCategoryId = 0;
        loadChannelList(selectedCategoryId);

        $(".channel_category").click(function () {
            const categoryId = $(this).attr("id");

            // 현재 선택된 카테고리와 클릭된 카테고리가 다를 때만 실행합니다.
            if (selectedCategoryId != categoryId) {
                selectedCategoryId = categoryId; // 선택된 카테고리 값을 업데이트합니다.
                loadChannelList(categoryId);
            }
        });
    });

      function loadChannelList(categoryNum) {
		var contextPath = '${pageContext.request.contextPath}'
        $.ajax({			//오늘의 채널
            type: "get",
            url: "main/ChannelListAction",
            data: {categoryNum: categoryNum},
            dataType: "json",
            success: function (data) {
                var channelTable = $(".row");
                channelTable.empty();

                $.each(data, function (index, item) {
                    var appendData = '<div class="col-md-4 col-sm-6">'
                    	+ '<div class="model_item m-top-30">'
                        + '<div class="model_img">';
                    // 이미지 URL을 동적으로 설정합니다.
                    var imageUrl = item.chprofile
                        ? contextPath + "/image/common/itda_logo3.png"
                        :contextPath + "/image/MemberUpload/" + item.ownerId + item.chProfile;
                    
                        //: contextPath + "/image/common/itda_logo3.png";
                        //: "${pageContext.request.contextPath}/resources/image/MemberUpload/${item.ownerId}${item.chprofile}"

                    appendData += '<img src="' + imageUrl + '" alt="...">'
                    + '<a href="channels/' + item.chNum +'?userid='+ item.ownerId +'">'
                    + '<div class="model_caption">'
                    + '<h5 class="text-white">' + item.chName + '</h5>'
                    + '<p class="card-text2">' + item.chInfo + '</p>'
                    + '</div>'
                    + '</div>'
                    + '</div>'
                    + '</div>';

                    channelTable.append(appendData);
                });
            },
            error: function () {
                alert("채널 목록을 불러오는 데 실패했습니다.");
            }
        });
    } 
 
</script>
<div style="display: flex; justify-content: center;">
<div class="ch_top">
    <h3 class="today_ch">오늘의 채널<img class="tv" alt="" src="${pageContext.request.contextPath}/resources/image/main/tv_icon.png"></h3>
    <p class="today_ch_sub">잇:다에서 추천하는 인기 채널</p>
</div>
</div>
<div class="chlist_area">
<div class="buttons-container">
    <div class="cate-button">
        <button class="channel_category btn bt-item bt-hover bt-2  on" id="0"><span>전체</span>
        </button>
        <button class="channel_category btn bt-item bt-hover bt-5" id="1"><span>경제/시사</span>
        </button>
        <button class="channel_category btn bt-item bt-hover bt-5" id="2"><span>문화/예술</span>
        </button>
        <button class="channel_category btn bt-item bt-hover bt-5" id="3"><span>IT트렌트</span>
        </button>
        <button class="channel_category btn bt-item bt-hover bt-2" id="4"><span>역사</span>
        </button>
        <button class="channel_category btn bt-item bt-hover bt-2" id="5"><span>과학</span>
        </button>
        <button class="channel_category btn bt-item bt-hover bt-2" id="6"><span>건강</span>
        </button>
        <button class="channel_category btn bt-item bt-hover bt-2" id="7"><span>요리</span>
        </button>
        <button class="channel_category btn bt-item bt-hover bt-3" id="8"><span>스포츠</span>
        </button>
        <button class="channel_category btn bt-item bt-hover bt-3" id="9"><span>재테크</span>
        </button>
        <button class="channel_category btn bt-item bt-hover bt-2" id="10"><span>취미</span>
        </button>
    </div>
</div>
</div>

<div class="container">
    <div class="row">
    
    </div><!-- End of the second row -->
</div>

    </div>
</div>
