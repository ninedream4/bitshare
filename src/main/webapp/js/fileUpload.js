$(function(){
     $("#contentUpload").click(function(){
    	 	var progressbox     = $('#progressbox');
    	    var progressbar     = $('#myBar');
    	    var statustxt   = $('#statustxt');
    	    var submitbutton    = $("#contentUpload");
    	    var output  = $("#output");
    	    var completed   = '0%';
    	    var status = $('#statustxt');

         $('#addContentForm').ajaxForm({
             beforeSubmit: function(arr, $form, options) { 
            	 submitbutton.attr('disabled','');
            	 status.empty();
                 var percentVal = '0%';
                 progressbar.width(percentVal);
                 statustxt.html(percentVal).css('text-align', 'center');
            	 return true;
             },
             uploadProgress: function(event, position, total, percentComplete) { 
            	 percentVal = percentComplete.toString() + '%';
            	 var percentVal = percentComplete + '%';
            	 progressbar.width(percentVal);
            	 statustxt.html(percentVal).css('text-align', 'center');
             },
             success: function(response,status){
                 submitbutton.removeAttr('disabled');
                 $('#upload').modal('toggle');
                 $('#successCheck').modal();
             },
             error: function(){
             }                               
         });   
         
     });
})