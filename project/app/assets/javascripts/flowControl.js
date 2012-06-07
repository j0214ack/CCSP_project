$(function(){
  $(".item_thumb").click(function(){
     var imgId = parseInt($(this).attr('id'));
     var newBG = $("canvas").css("background-image").replace(/\d.jpg/,imgId+".jpg");
     $("canvas").css({"background-image":newBG});
  });

  $(".control_change").click(function(){
    //check recording or not
    //if not, simply changes the background image
    //if yes, create coursecontent and then changes the background image
  });

  $("#nextBtn").click(function(){
  });

  $("#prevBtn").click(function(){
  });

  $("#playBtn").toggle(function(){
  },function(){});

  var startRecordSlide = function(){
  }
  
  var stopRecordSlide = function(){
    
  }

  var setupGUI = function(options){
  }

  function post_to_url(path, params, method) {
     method = method || "post"; // Set method to post by default, if not specified.

     // The rest of this code assumes you are not using a library.
     // It can be made less wordy if you use one.
     var form = document.createElement("form");
     form.setAttribute("method", method);
     form.setAttribute("action", path);

     for(var key in params) {
        if(params.hasOwnProperty(key)) {
           var hiddenField = document.createElement("input");
           hiddenField.setAttribute("type", "hidden");
           hiddenField.setAttribute("name", key);
           hiddenField.setAttribute("value", params[key]);

           form.appendChild(hiddenField);
        }
     }

     document.body.appendChild(form);
     form.submit();
  }


});
