// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require materialize-sprockets
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .
//= require_materialize.min
//= require_materialize
//= require_masonry.pkgd.min


//= require masonry/jquery.masonry

//= require masonry/masonry.min

//= require masonry/jquery.event-drag
//= require masonry/jquery.imagesloaded.min
//= require masonry/jquery.infinitescroll.min
//= require masonry/modernizr-transitions

//= require masonry/box-maker
//= require masonry/jquery.loremimages.min

//= require isotope/jquery.isotope


document.addEventListener('turbolinks:load', function(){
  $('.collapsible').collapsible();
  $('ul.tabs').tabs();
  $('.carousel').carousel();
  $('.carousel.carousel-slider').carousel({fullWidth: true});

  // $('selector').masonry()
  $('.grid').masonry({
    itemSelector: '.grid-item',
    percentPosition: true,
  });

  $('.slider').slider({
    // width: 500,
    height: 700,
    interval: 2000
  });

});
//
// $(document).on('ready page:load', function () {
//     $('.collapsible').collapsible();
//     $('ul.tabs').tabs();
//     $('.carousel').carousel();
//     $('.carousel.carousel-slider').carousel({fullWidth: true});
//
//     //  user.js
//     $('selector').masonry()
//     $('.grid').masonry({
//       itemSelector: '.grid-item',
//       percentPosition: true,
//     });
//
//     // $('.collapsible').collapsible();
//     $('.slider').slider({
//       // width: 500,
//       height: 700,
//       interval: 2000
//     });
// });
