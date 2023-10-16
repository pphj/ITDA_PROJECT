$(function(){

let token = $("meta[name='_csrf']").attr("content");	
let header = $("meta[name='_csrf_header']").attr("content");

$("#comment table").hide();
let page = 1;		//더 보기에서 보여줄 페이지를 기억할 변수
const count = parseInt($("#count").text());
if (count != 0){	//댓글 갯수가 0이 아니면
	getList(1);		//첫 페이지의 댓글을 구해 온다.
}else {				//댓글이 없는 경우
	$("#message").text("등록된 댓글이 없습니다.");
}


let num = 0;
let url = "";
let data = {};

function getList(currentPage){
		$.ajax({
			type : "post",
			url : "../comment/list",
			data : {"board_num" : $("#board_num").val(), "page" : currentPage},
			dataType : "json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(rdata){
				$('#count').text(rdata.listcount).css('font-family', 'Lucida Console');
				
			 	if(rdata.listcount > 0){
				   	$('#comment table').show();					//로딩될 때 hide()했던 부분을 보이게
					$("#comment tbody").empty();				//더보기를 클릭하면 기존에 있던 댓글 3개는 없에고 전부 가져옴
					
					$(rdata.list).each(function(){
						let output = '';
						let img = '';
						if ($('#loginid').text() == this.id) {
							img = "<img src='../resources/image/pencil2.png' width='15px' class='update'>"
								+ "<img src='../resources/image/delete.png' width='15px' class='remove'>"
								+ "<input type='hidden' value='" + this.num + "'>";
						}
						output += "<tr><td>" + this.id + "</td>";
						//XSS : 권한이 없는 사용자가 웹 사이드에 스크립트를 삽입하는 공격 기법으로
						//XSS를 방지하기 위해 <td></td> 영역을 만든 뒤 text()안에 this.content를 넣어 스크립트를 문자열로 만든다.
						output += "<td></td>";
						output += "<td>" + this.reg_date.substring(0,19) + img + "</td></tr>";
						$("#comment tbody").append(output);
						//append를 한 마지막 tr의 2번째 자식 td를 찾아 text()메소드로 content를 넣는다.
						$("#comment tbody tr:last").find("td:nth-child(2)").text(this.content);
					});
					
					if(rdata.listcount > rdata.list.length){
						$("#message").text("더보기");
					}else {
						$("#message").text("");
					}
				}else {
					$("#message").text("등록된 댓글이 없습니다.");
					$("#comment table").hide();
				}
			}//success end
		});//ajax end
	}//function(getList) end


	$('#content').on('input', function() {		//댓글의 글자수 실시간 반영
		let content = $(this).val();
		let length = content.length;
		if (length > 50) {
			length = 50;
			content = content.substring(0,length);
			$(this).val(content);
		}
		$(".float-left").text(length + '/50');
		
	});

	
	$("#message").click(function() {			//더보기를 클릭한 경우
		getList(++page);
	})//message end


	$('#write').click(function() {			//댓글 등록 클릭시
		const content = $('#content').val().trim();
		if(!content){							//내용없이 등록 클릭한 경우
			alert("댓글을 입력하세요");
			return false;
		}
		const buttonText = $("#write").text();	//버튼의 라벨로 add할지 update할지 결정됨
		$(".float-left").text('총 50자까지 가능합니다.');
		if (buttonText == "등록") {
			url = "../comment/CommentAdd";
			data = {
				"id" : $('#loginid').text(),				//comment.java에서 설정한 이름과 동일하게하면 편하게 data설정 가능
				"content" : content,
				"board_num" : $('#board_num').val()	
			};
		}else {
			url = "../comment/CommentUpdate";
			data = {
				"num" : num,
				"content" : content
			};
			$("#write").text("등록");			//다시 등록으로 변경
			$("#comment .cancel").remove();		//취소 버튼 삭제
		}

		$.ajax({
			type : 'post',
			url : url,  					//댓글 등록, 수정 둘중 하나의 url
			data : data,					//댓글 등록, 수정 둘중 하나의 data
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(rdata) {
				$("#content").val('');
				if (url == '../comment/CommentAdd') {
					if (rdata == 1) {
						alert("댓글이 등록되었습니다.");
						getList(page);
					} else {
						alert("댓글 등록 실패");
					}
				} else if (url == '../comment/CommentUpdate') {
					if (rdata == 1) {
						alert("댓글이 수정되었습니다.");
						getList(page);
					} else {
						alert("댓글 수정 실패");
					}
				}
			}
		})//ajax
	})//write click end


	$('#comment').on('click','.update',function(){
		const before = $(this).parent().prev().text();	//선택한 내용을 변수 before에 저장
		$("#content").focus().val(before);				//$("#content")에 before의 내용을 보여줌
		num = $(this).next().next().val();				//수정할 글 번호를 num(전역변수)이라는 변수에 저장
		$("#write").text("수정완료");					//$("#write")의 "등록" 라벨을 "수정완료"로 변경
		if (!$("#write").prev().is(".cancel"))			// "수정완료" 옆에 "취소"버튼을 생성
			$("#write").before('<button class="btn btn-danger float-right cancel">취소</button>');
		$('#comment tr').css("background", "white");				//선택한  행의 배경색은   'lightgray'로
		$(this).parent().parent().css("background", "lightgray");	//선택하지 않은 행의 배경색은 'white'
		$('.remove').prop('disabled', true);						//수정을 클릭한 경우에는 삭제를 클릭할 수 없도록 함
	})
	
	$('#comment').on('click', '.cancel', function(){
		$('#comment tr').removeAttr('style');		//style 속성을 제거해줌
		$(this).remove();
		$("#content").val('');
		$("#write").text("등록");
		$('.remove').prop('disabled', false);
		$('.float-left').text('총 50자까지 가능합니다.');
	})


	$("#comment").on('click', '.remove', function(){
		if(!confirm('정말 삭제하시겠습니까')){
			return;
		}
		const deleteNum = $(this).next().val();		//댓글번호	
		$.ajax({
			type: 'post',
			url:'../comment/CommentDelete',
			data:{"num" : deleteNum},
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success:function(rdata){
				if (rdata == 1){
					alert("댓글 삭제 성공");
					getList(page);
				}else {
					alert("댓글 삭제 실패");
				}
			}
		});
	})



})//ready end