var ready;
ready = function() {

  var bindEvents = function() {
    $('.question_container').on('click', '.vote', voteAjax);
    $('.answer_container').on('click', '.vote', voteAjax);
  }

  var voteAjax = function() {
    event.preventDefault();
    var button = $(this);
    console.log("clicked");
    $.ajax({
      url: button.attr('href'),
      type: 'GET'
    }).done(function(vote_count) {
      View.updateVoteCount(button, vote_count);
    });
  }

  // View
  var View = {
    updateVoteCount: function(element, num) {
      element.siblings('.vote_count').html(num)
    }
  }

  bindEvents();

};

$(document).ready(ready);
$(document).on('page:load', ready)