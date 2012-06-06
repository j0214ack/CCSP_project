// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//=require jquery
//=require jquery.tools.min.js
//=require jquery_ujs
//require vendor
//require_tree .
//flashembed("flash", "/assets/swfs/Wami.swf");
var currentSlide = 0;   // The slide that the user is currently viewing
var totalSlides = 4;   // Total number of slides in the featured section
var stepSlide = 2;
var timeoutHandler = null;

function setupRecorder() {
  Wami.setup({
          id : "wami",
          onReady : setupGUI
  });
}

function setupGUI() {
  var gui = new Wami.GUI({
          id : "wami",
          recordUrl : "http://localhost:3000/record/wami.wav",
          playUrl : "http://localhost:3000/data/wami.wav"
  });

  gui.setPlayEnabled(false);
}

function record_answer_countdown(number) {
  $('.speech-new-record-timer').text(number);
  number--;
  if(number >= 0) {
    timeoutHandler = setTimeout(function() { record_answer_countdown(number); }, 1000);
  } else {
    $("#speech-new-answer-fourth").hide();
    $("#speech-new-answer-fifth").fadeIn('slow');
  }
}

function read_question_countdown(number) {
  $('.speech-new-read-timer').text(number);
  number--;
  if(number >= 0) {
    timeoutHandler = setTimeout(function() { read_question_countdown(number); }, 1000);
  } else {
    $("#speech-new-answer-third").hide();
    $("#speech-new-answer-fourth").fadeIn('slow');
    var recordTime = $('.speech-new-record-timer').attr('value');
    record_answer_countdown(recordTime);
  }
}

$(function() {

  //$('.tooltip-links').tipsy({delayIn: 500});

  // if the function argument is given to overlay,
  // it is assumed to be the onBeforeLoad event listener
  $("#masthead-signup-container a[rel]").overlay({
    effect: 'apple',
    mask: {color: '#ebebeb', loadSpeed: 200, opacity: 0.5},
    closeOnClick: false,
  });

  $("#speech-front-audio-container .pagination a").live("click", function() {
    $(".speech-front-progress-spinner").show();
    $.getScript(this.href);
    $("#speech-front-audio-container").ajaxComplete(function() {
      $(".speech-front-progress-spinner").hide();
    });
    return false;
  });

  $(".speech-front-tab-fltr li a").live("click", function() {
    // Tab select switching
    $(this).parents('ul').find('li.selected').removeClass("selected speech-tab-fltr-disabled").addClass("speech-tab-fltr-link");
    $(this).parents('li').removeClass("speech-tab-fltr-link").addClass("selected speech-tab-fltr-disabled");
    var tab_select = $(this).parents('li').attr('alt');
    $(".speech-front-progress-spinner").show();
    $.get("/answers.js", "&tab_select="+tab_select, null, "script");
    $("#speech-front-audio-container").ajaxComplete(function() {
      $(".speech-front-progress-spinner").hide();
    });
    return false;
  });

  $(".speech-front-audio-item").hover( 
    function() { $(this).find(".speech-question-info-link").show(); },
    function() { $(this).find(".speech-question-info-link").hide(); }
  );

  $(".s-previous").live("click", function() {
    if (currentSlide > 0) {
      currentSlide--;
      $(".speech-featured-slider").animate({left : -96*stepSlide*currentSlide}, 500);
      if (currentSlide == 0) { $(this).hide(); }
      if (currentSlide == totalSlides-1) { $(this).parents('div').find(".s-next").show(); }
    }
    return false;
  });

  $(".s-next").live("click", function() {
    if (currentSlide < totalSlides) {
      currentSlide++;
      $(".speech-featured-slider").animate({left : -96*stepSlide*currentSlide}, 500);
      if (currentSlide == totalSlides) { $(this).hide(); }
      if (currentSlide == 1) { $(this).parents('div').find(".s-previous").show(); }
    }
    return false;
  });

  $(".speech-top-featured-item").hover(
    function() {
      if (currentSlide > 0) { $(this).find(".s-previous").show(); }
      if (currentSlide < totalSlides) { $(this).find(".s-next").show(); }
    },
    function() { $(this).find(".slider-button").hide(); }
  );


  $("#speech-new-answer-third, #speech-new-answer-fourth, #speech-new-answer-fifth").hide();

  $("#try-it-btn").live("click", function(evt) {
    evt.preventDefault();
    clearTimeout( timeoutHandler );
    $("#speech-new-answer-third, #speech-new-answer-fourth, #speech-new-answer-fifth").hide();
    $("#speech-new-answer-first, #speech-new-answer-second").show();
    return false;
  });

  $("#new-answer-btn").live("click", function(evt) {
    evt.preventDefault();
    $("#speech-new-answer-first, #speech-new-answer-second").hide();
    $("#speech-new-answer-third").fadeIn('slow');
    var readTime = $('.speech-new-read-timer').attr('value');
    read_question_countdown(readTime);
    return false;
  });

  $("#answer-done-btn").live("click", function(evt) {
    evt.preventDefault();
    clearTimeout( timeoutHandler );
    $("#speech-new-answer-fourth").hide();
    $("#speech-new-answer-fifth").fadeIn('slow');
    return false;
  });

  setupRecorder();

});

