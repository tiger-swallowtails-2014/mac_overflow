var ready;
ready = function() {

  // Controller

  $('.signin_link').click(function() {
    showSignin();
  })
  $('.login_link').click(function() {
    showLogin();
  });

  $('.background').click(function() {
    hideSignin();
    hideLogin();
  })


  // View

  var showSignin = function() {
    $('.background, .signin_lightbox').fadeIn('slow');
  }

  var hideSignin = function() {
    $('.background, .signin_lightbox').hide();
  }

  var showLogin = function() {
    $('.background, .login_lightbox').fadeIn('slow');
  }

  var hideLogin = function() {
    $('.background, .login_lightbox').hide();
  }

  hideSignin();
  hideLogin();

};

$(document).ready(ready);
$(document).on('page:load', ready)
