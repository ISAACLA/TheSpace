// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('turbolinks:load', function(){
  // $('.carousel').carousel();
  // $('.carousel.carousel-slider').carousel({fullWidth: true});
  $('selector').masonry()
  $('.grid').masonry({
    itemSelector: '.grid-item',
    percentPosition: true,
    // columnWidth: '.grid-sizer'
  });

  $('.collapsible').collapsible();
  $('.slider').slider({
    // width: 500,
    height: 700,
    interval: 2000
  });
  // $(".button-collapse").sideNav();
});

// $grid.imagesLoaded().progress( function() {
//   $grid.masonry();
// });
