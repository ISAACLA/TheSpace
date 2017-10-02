// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('turbolinks:load', function(){

  $('.slider').slider({
    // width: 500,
    height: 700,
    interval: 2000
  });

  $('.grid').masonry({
    itemSelector: '.grid-item',
    percentPosition: true,
  });

  $('#container').imagesLoaded( function() {
    $('.grid').masonry({
      itemSelector: '.grid-item',
      percentPosition: true,
    });
  });

  $('#my_profile_link').on("click",function(){
    $('#my_profile').css('display','initial');
    $('#my_events').css('display','none');
    $('#my_images').css('display','none');
    $('#my_friends').css('display','none');
  })


  $('#my_events_link').on("click",function(){
    $('#my_events').css('display','initial');
    $('#my_profile').css('display','none');
    $('#my_images').css('display','none');
    $('#my_friends').css('display','none');
  })

  $('#my_images_link').on("click",function(){
    $('#my_images').css('display','initial');
    $('#my_events').css('display','none');
    $('#my_profile').css('display','none');
    $('#my_friends').css('display','none');
  })

  $('#my_friends_link').on("click",function(){
    $('#my_friends').css('display','initial');
    $('#my_images').css('display','none');
    $('#my_events').css('display','none');
    $('#my_profile').css('display','none');
  })

})
