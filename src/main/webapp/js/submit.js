function addUserSubmit(){  
	
	$('#signup').modal('toggle');
	$('#successSignUp').modal();
	document.addUserForm.submit();
}

function updateUserSubmit(){
	document.updateUserForm.submit();	
}

function loginSubmit(){
	document.loginForm.submit();			 
}
function logoutUserSubmit(){
	document.logoutForm.submit();
}

function addContentSubmit() {
	document.addContentForm.submit();
}

function getContentListSubmit() {
	document.getContentListForm.submit();
}
