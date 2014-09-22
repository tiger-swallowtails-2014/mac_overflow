var ready;
ready = function() {

var responseController = {
	bindEvents: function(){
		$('body').on('ajax:success', '#new_response', responseView.renderResponse)
		$('.responselink a').on('ajax:success', responseView.renderResponseForm)
	}
}

var responseView = {
	renderResponseForm: function(e, data){
		var responseIdLink = $(this).attr("class")
		console.log(data)
		$('.responselink.' + responseIdLink).append(data)
		$('.responselink ' + responseIdLink).off('ajax:success', responseView.renderResponseForm)
		$(this).toggle()
	},
	renderResponse: function(e,data){
		var responseAnswerId = $(this).attr("class")
		$('#' + responseAnswerId + ' .response_container').append(data)
		$(this).remove()
		responseView.renderResponseLink(responseAnswerId)
	},
	renderResponseLink: function(responseAnswerId){
		$('#' + responseAnswerId + " .responselink a").toggle()
	}
}



  responseController.bindEvents();

};


$(document).ready(ready);
$(document).on('page:load', ready);

