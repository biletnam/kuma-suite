//= require jquery
//= require jquery_ujs
//= require semantic-ui
//= require semantic-ui/modal
//= require semantic-ui/dropdown
//= require semantic-ui/tab
//= require_tree .

$(document).ready(function(){
  $('.menu .item').tab();
  $('select.dropdown').dropdown();
  $('.ui.selection.dropdown').dropdown();
  $('.dropdown').dropdown();
  

  $('.message .close').on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade');
  });

});
