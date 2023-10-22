$(function(){
	$('#btn-kakaopay').click(function(){
		let token = $("meta[name='_csrf']").attr("content");	
		let header = $("meta[name='_csrf_header']").attr("content");
		$.ajax({
			url : '/itda/product/subscriptions/info/order/kakaoPay.do',
			dataType : 'json',
			cache : false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data){
				var paybox = data.next_redirect_pc_url;
				//alert(data.tid);
				window.open(paybox);
			},
			error : function(error){
				alert("에러발생");
			}
		});
	});
});
