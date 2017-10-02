// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// My NASA API KEY 1 : uXqmjM0msVrct0xz2zlvTkvCbyxieJ4pywOkBZMI
// My NASA API KEY 2 : uupOQAQKOCvrpRJ87aNIiAKESnvZYnFdNTdgkHvx

document.addEventListener('turbolinks:load', function(){
  $(".dropdown-button").dropdown({hover: false} );
  $('select').material_select();
  $('.collapsible').collapsible();

  var url = "https://api.nasa.gov/planetary/apod?api_key=uupOQAQKOCvrpRJ87aNIiAKESnvZYnFdNTdgkHvx"

  $(function apod(){
    $.ajax({
      url: url,
      success: function(result){

        if("copyright" in result) {
          $("#copyright").text("Image Credits: " + result.copyright);
        }
        else {
          $("#copyright").text("Image Credits: " + "Public Domain");
        }

        if(result.media_type == "video") {
          $("#apod_img_id").css("display", "none");
          $("#apod_vid_id").attr("src", result.url);
        }
        else {
          $("#apod_vid_id").css("display", "none");
          $("#apod_img_id").attr("src", result.url);
        }
        $("#reqObject").text(url);
        $("#apod_explaination").text(result.explanation);
        $("#apod_title").text(result.title);
        $("#apod_date").text(result.date);
      }
    });
  })

  $('#apod_header').click(function(){
    $('#apod_body').toggle('slow')
  })
});
