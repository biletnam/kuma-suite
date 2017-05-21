$(document).ready(function(){

  $('.modalclientbtn').click(function(){
    var cid = this.dataset.uid
    $('#modalclient_' + cid).modal('show');
  });

  $('.modalstaffbtn').click(function(){
    var id = this.dataset.uid
    $('#modalstaff_' + id).modal('show');
  });

  // $('.ui.dropdown').dropdown();



});
