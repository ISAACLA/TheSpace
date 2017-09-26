// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('turbolinks:load', function(){
  $('.carousel').carousel();
  $('.carousel.carousel-slider').carousel({fullWidth: true});
  $('.slider').slider();
  $('.collapsible').collapsible();
});

// $(document).ready(function(){
//   $('.carousel').carousel();
//   $('.carousel.carousel-slider').carousel({fullWidth: true});
// });
