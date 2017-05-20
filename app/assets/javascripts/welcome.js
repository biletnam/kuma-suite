$(document).ready(function(){

  $('.brandlogo').on('mouseover', function(){
<<<<<<< HEAD
    $(this).transition()
  });

})
=======
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
>>>>>>> 3db3b4d2b5842fee837f89c6196573389c3fe9dc
