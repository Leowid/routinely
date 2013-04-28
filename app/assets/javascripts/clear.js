$(document).ready(function(){
  	$("form#new_task").bind("ajax:success", function(event,xhr,status) {
    	$('.textfield input').val('');
	});
});
