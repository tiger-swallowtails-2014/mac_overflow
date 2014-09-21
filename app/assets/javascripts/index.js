
$(document).ready(function(){
	$('#signup').bind("ajax:success", function(e, data, status, xhr){
		// $('.login').toggle("up");
		$('.signup').toggle("down");
	});

	$('#login').bind("ajax:success", function(e, data, status, xhr){
		// $('.signup').toggle("up");
		$('.login').toggle("down");
	});

});