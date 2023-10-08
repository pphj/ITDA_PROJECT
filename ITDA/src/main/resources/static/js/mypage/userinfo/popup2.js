



  $(document).keypress(function(e) { 
    if (e.keyCode == 13) e.preventDefault(); 
  });


	
	

function showAddressChangePopUp() {
    displayObj('dimmed'); 
    displayObj('addressChangePopUpLayer');
       document.getElementById("wrap").classList.add("is_fixed");
        resetInternationalCode();
    var popupLayer = document.getElementById("addressChangePopUpLayer");
    popupLayer.style.display = "block";
}

// 팝업 숨김 함수
function hideAddressChangePopUp() {
    displayObj('addressChangePopUpLayer');
    document.getElementById("wrap").classList.remove("is_fixed");
    resetInternationalCode();
    var popupLayer = document.getElementById("addressChangePopUpLayer");
    popupLayer.style.display = "none";
    document.getElementById("dimmed").style.display = "none";
}

