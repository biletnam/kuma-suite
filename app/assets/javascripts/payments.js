$(document).ready(function(){

  $('#cc-form').on('submit', function(event){
    event.preventDefault();

    // makes AJAX req to Stripe server with CC info. When we receieve a response back from server then callback function stripeResponseHandler will be caled.
    Stripe.card.createToken({
      number: $('#card_number').val(),
      cvc: $('#cvc').val(),
      exp_month: $('#date_month').val(),
      exp_year: $('#date_year').val(),
    }, stripeResponseHandler);
  });

  function stripeResponseHandler(status, response){
    if(status === 200){
      $('#stripe_token').val(response.id);
      $('#server-form').submit();
    } else {
      $('[type=submit]').removeAttr('disabled');
      $('#stripe-error').html(response.error.message)
    }

      console.log(status);
      console.log(response);

  }

})
