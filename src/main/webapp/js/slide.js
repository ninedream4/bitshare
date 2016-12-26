var content;

$.ajax({
	dataType:"json",
	type:"POST",
	url:"/content/getContentList",
	async:false,
	success:function(data) {
		
        if (data != null) {
        	content = data;
        } else {
            alert("불러오기 실패");
        }
    }   
});

$(function(){
	var length;
	if(content.length >= 6) {
		length = 6;
	}
	else {
		length = content.length;
	}
	
	console.log(content);
	for(var j=0; j<=length-1; j++){		
		var $mainRow = $("#mainRow");
		mainRow.className = "row";

		var slideDiv = document.createElement("div");
				slideDiv.className = "col-md-4 slidelist-item";
				
				var aTag = document.createElement("a");
				aTag.href = "javascript:fn()";
				aTag.className = "portfolio-link";
				$("aTag").data("toggle", "modal");
					var outerDiv = document.createElement("div");
					outerDiv.className = "caption";
					
					var innerDiv = document.createElement("div");
					innerDiv.className = "caption-content";
						
					var iTag = document.createElement("i");
					iTag.className = "fa fa-search-plus fa-3x";
							
					var img = document.createElement("img");
					
					img.src = "/content/download/?src="+content[j].title+"/1.png";
					
					img.className = "img-responsive";
					img.alt="";
							
			innerDiv.appendChild(iTag);
			outerDiv.appendChild(innerDiv);
			
			aTag.appendChild(outerDiv);
			aTag.appendChild(img);
			slideDiv.appendChild(aTag);
			
			mainRow.appendChild(slideDiv);
			var title = document.createElement('h3');
			title.innerHTML = content[j].title;
			title.align = "center";
			aTag.after(title);
			
			
		$("#mainRow").on("click",function(){
			$("#modalView").modal(function() {
				$("#aab").text(content[j].title);
			});
		});			
	}
});
