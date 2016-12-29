function toggleFullScreen(elem) {
	if (elem.requestFullscreen) {
	  elem.requestFullscreen();
	} else if (elem.mozRequestFullScreen) {
	  elem.mozRequestFullScreen();
	} else if (elem.webkitRequestFullscreen) {
	  elem.webkitRequestFullscreen();
	}
}

// 키코드
//$(document).keyup(function(e){
//	if(e.keyCode==27){
//		$("#slideimg").attr("style","width:100%");
//	}else if(e.keyCode==37){
//		$("#prev").on("click")
//	}else if(e.keyCode==39){
//		
//	}
//});