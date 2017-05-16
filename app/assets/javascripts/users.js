/* global $, Stripe */
//Document Ready.
$(document).on('turbolinks:load', function(){
  var theForm = $('#pro_form');
  var submitBtn = $('#form-submit-btn');

//Set Stripe Public Key
Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') );

//When user clicks form submit button
submitBtn.click(function(event){
  //We will prevent the default submission behavior.
  event.preventDefault();
  
  //Collect the credit card fields.
  var ccNum = $('#card_number').val(),
      cvcNum = $('#card_code').val(),
      expMonth = $('card_month').val(),
      expYear = $('card_year').val();
  
  //Send card information to Stripe.
  Stripe.createToken({
    number: ccNum,
    cvc: cvcNum,
    exp_month: expMonth,
    exp_year: expYear
  }, stripeResponseHandler);
  //Stripe.createToken({number: ccNum, cvc: cvcNum, exp_month: expMonth, exp_year: expYear}, stripeResponseHandler);
});


12:58 minutes

//Stripe will return a card token.
//Inject Card Token as Hidden Field into Form
//Submit form to our Rails app.
});