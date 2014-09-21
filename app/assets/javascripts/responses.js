var responseView = {
	renderResponseForm: function(e, data){
		var responseIdLink = $(this).attr("class")
		$('#' + responseIdLink).append(data)
		$('.responselink .' + responseIdLink).off('ajax:success', responseView.renderResponseForm)
		$(this).remove()
	}
}















$(document).ready(function(){

	$('.responselink a').on('ajax:success', responseView.renderResponseForm)
});