// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.addEventListener('turbolinks:load', function(){

  $('#image_header_pioneer').click(function(){
    $('#image_body_pioneer').toggle('slow')
  })
  $('#image_header_title').click(function(){
    $('#image_body_title').toggle('slow')
  })
  $('#image_header_detail').click(function(){
    $('#image_body_detail').toggle('slow')
  })
  $('#image_header_like').click(function(){
    $('#image_body_like').toggle('slow')
  })
  
  var nasaurl = "https://api.nasa.gov/planetary/apod";
  var key = "&api_key=uupOQAQKOCvrpRJ87aNIiAKESnvZYnFdNTdgkHvx";

  var infoBox = document.querySelector('#information');
  var infoBtn = document.querySelector('#showinfo');


  function show(){
    function random (min, max){
      return num = Math.floor(Math.random()* (max - min + 1)) + min;
    }

    var year = random (2005,2017);
    var month = random (1,12);
    var day = random (1,28)
    var newdate = year + '-' + month + '-' + day;

    $.ajax({
      url: nasaurl + '?date=' + newdate + key,
    }).done(function(result){
        $(".imageshow").css('background-image','url(' + result.url + ')');
        $("#show_title").text(result.title);
        $("#show_explanation").text(result.explanation);
    }).fail(function(error){
      console.log(error)
    })
  }

  show();

  $('#nextone').on('click',function(){
    show()
  })

  infoBtn.addEventListener('click',function(){
    if (infoBox.classList.contains('hide') == true) {
      infoBox.classList.remove('hide');
      infoBox.classList.add('show');
      infoBtn.innerText = 'Close Info';
    }else{
      infoBox.classList.remove('show');
      infoBox.classList.add('hide');
      infoBtn.innerText = 'Show Info';
    }
  })


})
