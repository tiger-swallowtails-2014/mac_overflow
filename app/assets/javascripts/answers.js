$(document).on('page:load', function() {

  // Controller
  var bindEvents = function() {
    $('.answer_container').on('click', '.vote', voteAjax)
  }

  var voteAjax = function(event) {
    event.preventDefault();
    var button = $(this);
    console.log("clicked")
    $.ajax({
      url: button.attr('href'),
      type: 'GET'
    }).done(function(vote_count) {
      View.updateVoteCount(button, vote_count);
    })
  }

  // View
  var View = {
    updateVoteCount: function(element, num) {
      element.siblings('.vote_count').html(num)
    }
  }

  bindEvents();

})