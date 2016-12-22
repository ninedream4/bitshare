$(function(){
	$("#loginButton").on('click', function(){
		if($("#inputEmail").val() != null && $("#inputEmail").val().length>0){
			if($("#inputPassword").val() !=null && $("#inputPassword").val().length>0){
				document.loginForm.submit();   			
			}else{			
				 $("#nullEmail").hide();
				  $("#nullPwd").show();
			}
		}else{
			 $("#nullEmail").show();
	        $("#nullPwd").show();
		}	   	 
	});
	
});

