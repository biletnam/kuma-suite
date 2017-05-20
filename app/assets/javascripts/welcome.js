$(document).ready(function(){

  $('.brandlogo').on('mouseover', function(){
    $(this).transition('pulse')
  });

})


$(document).scroll(function () {
var y = $(this).scrollTop();

var x = $("#myDiv").position();

if (y > (x.top - 50)) { // -50 so things don't overlap
    $(".magic").addClass(
        "bounceInRight");
}
else {
    $(".magic").removeClass(
        "bounceInRight");
}
});
