//= require jquery
//= require jquery_ujs
//= require jquery-tablesorter
//= require semantic-ui
//= require semantic-ui/modal
//= require semantic-ui/dropdown
//= require semantic-ui/tab
//= require_tree .

$(document).ready(function(){
  $('.menu .item').tab();
  $('select.dropdown').dropdown();

  $('#dropdownmenu').dropdown();


// ticket department select
  $('.ui.dropdown').dropdown();

// for notice and alerts
  $('.message .close').on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade');
  });

});
