// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('turbolinks:load', function(){
  $('.collapsible').collapsible();

  $('#event_date_header').click(function(){
    $('#event_date_body').toggle('slow')
  })
  $('#event_time_header').click(function(){
    $('#event_time_body').toggle('slow')
  })
  $('#event_location_header').click(function(){
    $('#event_location_body').toggle('slow')
  })
  $('#event_hoster_header').click(function(){
    $('#event_hoster_body').toggle('slow')
  })
  $('#event_detail_header').click(function(){
    $('#event_detail_body').toggle('slow')
  })
  $('#event_action_header').click(function(){
    $('#event_action_body').toggle('slow')
  })
  $('#event_attendees_header').click(function(){
    $('#event_attendees_body').toggle('slow')
  })
});

// $(document).ready(function(){
// document.addEventListener('turbolinks:load', function(){
//   $('.collapsible').collapsible();
//   $('ul.tabs').tabs();
// });
