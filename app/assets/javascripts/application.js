//= require jquery
//= require jquery_ujs
//= require jquery-tablesorter
//= require semantic-ui
//= require semantic-ui/modal
//= require semantic-ui/dropdown
//= require semantic-ui/tab
//= require cocoon
//= require Chart.bundle
//= require chartkick
//= require_tree .

$(document).ready(function(){

  $('select.dropdown').dropdown();
  $('#dropdownmenu').dropdown();

// user profile_pic
  $('.special.cards .image').dimmer({
    on: 'hover'
  });

// data tabs
  $('.menu .item').tab();

// ticket department select
  $('.ui.dropdown ').dropdown();
  $('.ui.dropdown .menu').dropdown();

// for notice and alerts
  $('.message .close').on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade');
  });

});
