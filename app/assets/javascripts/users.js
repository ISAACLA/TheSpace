// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('turbolinks:load', function(){

  // $('selector').masonry()
  // $('.grid').masonry({
  //   itemSelector: '.grid-item',
  //   percentPosition: true,
  // });
  //
  // $('.collapsible').collapsible();
  // $('.slider').slider({
  //   // width: 500,
  //   height: 700,
  //   interval: 2000
  // });
  //
// });

// $(document).on('ready page:load', function () {
  $('.slider').slider({
    // width: 500,
    height: 700,
    interval: 2000
  });
// }

// $(document).on('ready page:load', function () {
  // $('selector').masonry()
  $('.grid').masonry({
    itemSelector: '.grid-item',
    percentPosition: true,
  });
}
