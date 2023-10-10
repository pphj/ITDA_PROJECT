$(function(){

	let token = $("meta[name='_csrf']").attr("content");	
	let header = $("meta[name='_csrf_header']").attr("content");

	$("#qnaReply table").hide();
	let page = 1;											//더 보기에서 보여줄 페이지를 기억할 변수
	const count = parseInt($("#count").text());

	if (count != 0){										//댓글 갯수가 0이 아니면
		getList(1);											//첫 페이지의 댓글을 구해 온다.
	}else {													//댓글이 없는 경우
		$("#message").text("답변 대기중입니다.");
	}


	let num = 0;
	let url = "";
	let data = {};

	function getList(currentPage){
		console.log("getList");
		$.ajax({
			type : "post",
			url : "../QnaReplyList",
			data : {"adNum" : $("#adNum").val(), "page" : currentPage},
			dataType : "json",
			//beforeSend : function(xhr) {
			//	xhr.setRequestHeader(header, token);
			//},
			success : function(rdata){
			 	if(rdata.listcount > 0){
				   	$('#qnaReply table').show();				//로딩될 때 hide()했던 부분을 보이게
					$("#qnaReply tbody").empty();				//더보기를 클릭하면 기존에 있던 댓글 3개는 없에고 전부 가져옴
					
					$(rdata.list).each(function(){
						let output = '';
						let img = '';
						if ($('#loginId').text() == this.adminId) {
							img = "<img src=" + contextPath + "/resources/image/pencil2.png width='15px' class='update'>"
								+ "<img src=" + contextPath + "/resources/image/delete.png width='15px' class='remove'>"
								+ "<input type='hidden' value='" + this.qnaReplyNum + "'>";
						}
						output += "<tr>";
						output += "<td colspan='1' class='text-center'>" + this.qnaReplyNum + "</td>";
						output += "<td colspan='1'>" + this.adminId + "</td>";
						output += "<td colspan='2'></td>";
						output += "<td colspan='1' class='text-right'>" + this.qnaReplyDate.substring(0,10) + img + "</td>";
						output += "</tr>";
						$("#qnaReply tbody").append(output);
						$("#qnaReply tbody tr:last").find("td:nth-child(3)").text(this.qnaReplyContent);
					});
					
					if(rdata.listcount > rdata.list.length){
						$("#message").text("더보기");
					}else {
						$("#message").text("");
					}
				}else {
					$("#message").text("등록된 댓글이 없습니다.");
					$("#qnaReply table").hide();
				}
			}//success end
		});//ajax end
	}//function(getList) end


	$('#qnaReplyContent').on('input', function() {		//댓글의 글자수 실시간 반영
		let content = $(this).val();
		let length = content.length;
	    if (length > 1000) {
	        length = 1000;
	        content = content.substring(0, length);
	        $(this).val(content);
	    }
    	$(".float-left").text(length + '/1000');
	});

	
	$("#message").click(function() {					//더보기를 클릭한 경우
		getList(++page);
	})//message end


	$('#qnaWrite').click(function() {					//답변 등록 클릭시
		const qnaReplyContent = $('#qnaReplyContent').val().trim();
		if(!qnaReplyContent){							//내용없이 답변 등록 클릭한 경우
			alert("답변을 입력하세요");
			return false;
		}
		const buttonText = $("#qnaWrite").text();		//버튼의 라벨로 insert할지 update할지 결정됨
		$(".float-left").text('총 1000자까지 가능합니다.');
		if (buttonText == "답변 등록") {
			url = "../QnaReplyInsert";
			data = {
				"adminId" : $('#loginId').text(),
				"qnaReplyContent" : qnaReplyContent,
				"adNum" : $('#adNum').val()	
			};
		}else {
			url = "../QnaReplyUpdate";
			data = {
				"qnaReplyNum" : num,					//img의 <input type='hidden' value='" + this.qnaReplyNum + "'> 에서 가져온다
				"qnaReplyContent" : qnaReplyContent
			};
			$("#qnaWrite").text("답변 등록");			 	//다시 답변 등록으로 변경
			$("#qnaReply .cancel").remove();			//취소 버튼 삭제
		}
		$.ajax({
			type : 'post',
			url : url,  								//답변 등록, 수정 둘중 하나의 url
			data : data,								//답변 등록, 수정 둘중 하나의 data
			//beforeSend : function(xhr) {
			//	xhr.setRequestHeader(header, token);
			//},
			success : function(rdata) {
				$("#qnaReplyContent").val('');
				if (url == '../QnaReplyInsert') {
					if (rdata == 1) {
						alert("답변이 등록되었습니다.");
						getList(page);
					} else {
						alert("답변 등록 실패");
					}
				} else if (url == '../QnaReplyUpdate') {
					if (rdata == 1) {
						alert("답변이 수정되었습니다.");
						getList(page);
					} else {
						alert("답변 수정 실패");
					}
				}
			}
		})//ajax
	})//click end


	$('#qnaReply').on('click','.update',function(){
		const before = $(this).parent().prev().text();			//선택한 내용을 변수 before에 저장
		$("#qnaReplyContent").focus().val(before);				//$("#qnaReplyContent")에 before의 내용을 보여줌
		
		num = $(this).next().next().val();						//수정할 글 번호를 num(전역변수)이라는 변수에 저장
		$("#qnaWrite").text("수정완료");							//$("#write")의 "등록" 라벨을 "수정완료"로 변경
		
		if (!$("#qnaWrite").prev().is(".cancel"))					// "수정완료" 옆에 "취소"버튼을 생성
			$("#qnaWrite").before('<button class="btn btn-danger float-right cancel">취소</button>');
		
		$('#qnaReply tr').css("background", "white");				//선택한  행의 배경색은   'lightgray'로
		$(this).parent().parent().css("background", "lightgray");	//선택하지 않은 행의 배경색은 'white'
		$('.remove').prop('disabled', true);						//수정을 클릭한 경우에는 삭제를 클릭할 수 없도록 함
	})
	
	$('#qnaReply').on('click', '.cancel', function(){				//취소 클릭시
		$('#qnaReply tr').removeAttr('style');						//style 속성을 제거해줌
		$(this).remove();
		$("#qnaReplyContent").val('');
		$("#qnaWrite").text("답변 등록");
		$('.remove').prop('disabled', false);
		$('.float-left').text('총 100자까지 가능합니다.');
	})


	$("#qnaReply").on('click', '.remove', function(){
		if(!confirm('정말 삭제하시겠습니까')){
			return;
		}
		const deleteNum = $(this).next().val();					//댓글번호	
		$.ajax({
			type: 'post',
			url:'../QnaReplyDelete',
			data:{"qnaReplyNum" : deleteNum},
			//beforeSend : function(xhr) {
			//	xhr.setRequestHeader(header, token);
			//},
			success:function(rdata){
				if (rdata == 1){
					alert("답변 삭제 성공");
					getList(page);
				}else {
					alert("답변 삭제 실패");
				}
			}
		});
	})



})//ready end