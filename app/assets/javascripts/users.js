// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('turbolinks:load', function(){
  // $('.carousel').carousel();
  // $('.carousel.carousel-slider').carousel({fullWidth: true});
  $('.collapsible').collapsible();
  $('.slider').slider({
    height: 700,
    interval: 2000
  });
  $('.grid').masonry({
    itemSelector: '.grid-item',
    percentPosition: true,
    // columnWidth: '.grid-sizer'
  });
});

// $grid.imagesLoaded().progress( function() {
//   $grid.masonry();
// });
