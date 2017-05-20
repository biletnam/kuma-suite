$(document).ready(function(){

  $('#modaluserbtn').click(function(){
    $('#modaluser').modal('show');
  });
  $('.modalstaffbtn').click(function(){
    var id = this.dataset.uid
    $('#modalstaff_' + id).modal('show');
  });

  // $('.ui.dropdown').dropdown();



});
