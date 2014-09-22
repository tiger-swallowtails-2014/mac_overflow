var ready;
ready = function() {

  $("#accordion").accordion({ header: "h3", collapsible: true, active: false, heightStyle: 'content' });

};


$(document).ready(ready);
$(document).on('page:load', ready)