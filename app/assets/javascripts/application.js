// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require bootstrap-sprockets
//= require bootstrap-fileupload
//= require bootstrap.min
//= require tinymce
//= require best_in_place
//= require chosen-jquery
//= require schools/courses
//= require schools/lessons
//= require fullcalendar
//= require jquery.mousewheel
//= require main
//= require setup_validations
//= require steps
//= require users
//= require custom
//= require fullcalendar
//= require daterangepicker
//= require dragula.min
//= require app
//= require full_calendar
//= require event_attendee_group
//= require cable
//= require rooms
//= require chat
//= require live_chatting
//= require dashboard
//= require conversations
//= require bootstrap3-wysihtml5.all.min
//= require jquery.remotipart
//= require cocoon
//= require jquery.rateyo.min

$(document).ready(function() {
  $(".best_in_place").best_in_place();
});


$(document).ready(function(){
  if (typeof tinyMCE != 'undefined') {
    tinyMCE.init({
      selector: "textarea.tinymce",
      toolbar: [
        "styleselect | bold italic | alignleft aligncenter alignright alignjustify",
        "bullist numlist outdent indent | link image | code | codesample"
      ],
      plugins: "image,link,code,codesample,autoresize,imagetools,media,table,insertdatetime,charmap,print,preview,anchor,searchreplace,visualblocks,fullscreen"
    });
  } else {
    setTimeout(arguments.callee, 50);
  }
});



/* Panel minimize js */

$(document).on('click', '.panel-heading span.clickable', function(e){
    var $this = $(this);
  if(!$this.hasClass('panel-collapsed')) {
    $this.parents('.panel').find('.panel-body').slideUp();
    $this.addClass('panel-collapsed');
    $this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
  } else {
    $this.parents('.panel').find('.panel-body').slideDown();
    $this.removeClass('panel-collapsed');
    $this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
  }
})


$(document).ready(function(){
  $(document).on('click', '.new-registraion-form', function(e){
    var first_name = $('#user_first_name').val();
    var last_name = $('#user_last_name').val();
    var email = $('#user_email').val();
    var password = $('#user_password').val();
    var password_confirmation = $('#user_password_confirmation').val();
    $(".error-span").remove();
    $('#user_first_name').removeClass('border-error');
    $('#user_last_name').removeClass('border-error');
    $('#user_email').removeClass('border-error');
    $('#user_password').removeClass('border-error');
    $('#user_password_confirmation').removeClass('border-error');
    if (first_name.length < 1) {
      $('#user_first_name').after('<span class="error-span">Please provide a valid first name</span>');
      $('#user_first_name').addClass('border-error');
    }

    if (last_name.length < 1) {
      $('#user_last_name').after('<span class="error-span">Please provide a valid last name</span>');
      $('#user_last_name').addClass('border-error');
    }

    if (email.length < 1) {
      $('#user_email').after('<span class="error-span">Please provide a valid email</span>');
      $('#user_email').addClass('border-error');
    } 
    else {
      var regEx = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;
      var validEmail = regEx.test(email);
      if (!validEmail) {
        $('#user_email').after('<span class="error-span">Please provide a valid email</span>');
        $('#user_email').addClass('border-error');
      }
    }
    if (password.length < 8) {
      $('#user_password').after('<span class="error-span">Please provide a valid Password</span>');
      $('#user_password').addClass('border-error');
    }

    if (password_confirmation.length < 8) {
      $('#user_password_confirmation').after('<span class="error-span">Please provide a valid Password confirmatin</span>');
      $('#user_password_confirmation').addClass('border-error');
    }

    if ($('#user_password').val() == $('#user_password_confirmation').val()) {
      $('#user_password_confirmation').removeClass('border-error');
    } else
      $('#user_password_confirmation').after('<span class="error-span">Passwrod not matching</span>');
      $('#user_password_confirmation').addClass('border-error');
  });
});
  


$(document).ready(function(){
  $(document).on('click', '.btn-client', function(e){
    var email = $('#client_owner_email').val();
    var first_name = $('#client_owner_first_name').val();
    var last_name = $('#client_owner_last_name').val();
    var password = $('#client_owner_password').val();
    var password_confirmation = $('#client_owner_password_confirmation').val();
    var client_owner_orgination_name = $('#client_owner_orgination_name').val();
    var client_subdomain = $('#client_subdomain').val();

    $(".error-span").remove();
    $('#client_owner_first_name').removeClass('border-error');
    $('#client_owner_last_name').removeClass('border-error');
    $('#client_owner_email').removeClass('border-error');
    $('#client_owner_password').removeClass('border-error');
    $('#client_owner_password_confirmation').removeClass('border-error');
    $('#client_subdomain').removeClass('border-error');
    $('#client_owner_orgination_name').removeClass('border-error');
    if (first_name.length < 1) {
      $('#client_owner_first_name').after('<span class="error-span">Please provide a valid first name</span>');
      $('#client_owner_first_name').addClass('border-error');
    }
    if (last_name.length < 1) {
      $('#client_owner_last_name').after('<span class="error-span">Please provide a valid last name</span>');
      $('#client_owner_last_name').addClass('border-error');
    }
    if (email.length < 1) {
      $('#client_owner_email').after('<span class="error-span">Please provide a valid email</span>');
      $('#client_owner_email').addClass('border-error');
    } 
    else {
      var regEx = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;
      var validEmail = regEx.test(email);
      if (!validEmail) {
        $('#client_owner_email').after('<span class="error-span">Please provide a valid email</span>');
        $('#client_owner_email').addClass('border-error');
      }
    }
    if (password.length < 8) {
      $('#client_owner_password').after('<span class="error-span">Please provide a valid Password</span>');
      $('#client_owner_password').addClass('border-error');
    }
    if (password_confirmation < 8) {
      $('#client_owner_password_confirmation').after('<span class="error-span">Please provide a valid Password confirmation</span>');
      $('#client_owner_password_confirmation').addClass('border-error');
    }

    if ($('#client_owner_password').val() == $('#client_owner_password_confirmation').val()) {
      $('#client_owner_password_confirmation').removeClass('border-error');
    } else {
      $('#client_owner_password_confirmation').after('<span class="error-span">Passwrod not matching</span>');
      $('#client_owner_password_confirmation').addClass('border-error');
    }
    if (client_owner_orgination_name < 1) {
      $('#client_owner_orgination_name').after('<span class="error-span">Please provide a valid school name</span>');
      $('#client_owner_orgination_name').addClass('border-error');
    }else {
        $('.loading-image').removeClass('hide');
    }

    if (client_subdomain < 1) {
      $('.sub-domain-validation').after('<span class="error-span">Please provide a valid subdomain</span>');
      $('#client_subdomain').addClass('border-error');
    }
  });
})


$(document).ready(function(){
  $(document).on('click', '.login-submit', function(e){
    var email = $('#user_email').val();
    var password = $('#user_password').val();
    $(".error-span").remove();
    $('#user_email').removeClass('border-error');
    $('#user_password').removeClass('border-error');

    if (email.length < 1) {
      $('#user_email').after('<span class="error-span">Please provide a valid email</span>');
      $('#user_email').addClass('border-error');
    } 
    else {
      var regEx = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;
      var validEmail = regEx.test(email);
      if (!validEmail) {
        $('#user_email').after('<span class="error-span">Please provide a valid email</span>');
        $('#user_email').addClass('border-error');
      }
    }
    if (password.length < 8) {
      $('#user_password').after('<span class="error-span">Please provide a valid Password</span>');
      $('#user_password').addClass('border-error');
    }
  });
});

$(document).ready(function(){
  $(document).on('click', '.replay-message', function(e){
    e.stopPropagation();
    $(".replay-message-1").toggle()
  });

  $(document).on('click', '.font-format', function(e){
    e.stopPropagation();
    $(".wysihtml5-toolbar").toggle()
  });
});
$(document).ready(function(){
  $(function() { 
    $(document).on('click', '.new-activity', function(e){
      e.preventDefault();
      $(".menu-active").removeClass("menu-active");
      $(this).addClass('menu-active');
    });
  });
});


$(document).ready(function(){
    //jQuery plugin
(function( $ ) {
   $.fn.uploader = function( options ) {
     var settings = $.extend({
       MessageAreaText: "No files selected.",
       MessageAreaTextWithFiles: "File List:",
       DefaultErrorMessage: "Unable to open this file.",
       BadTypeErrorMessage: "We cannot accept this file type at this time.",
       acceptedFileTypes: ['pdf', 'jpg', 'gif', 'jpeg', 'bmp', 'tif', 'tiff', 'png', 'xps', 'doc', 'docx',
        'fax', 'wmp', 'ico', 'txt', 'cs', 'rtf', 'xls', 'xlsx']
     }, options );
  
     var uploadId = 1;
     //update the messaging 
      $('.file-uploader__message-area p').text(options.MessageAreaText || settings.MessageAreaText);
     
     //create and add the file list and the hidden input list
     var fileList = $('<ul class="file-list"></ul>');
     var hiddenInputs = $('<div class="hidden-inputs hidden"></div>');
     $('.file-uploader__message-area').before(fileList);
     $('.file-list').before(hiddenInputs);
     
    //when choosing a file, add the name to the list and copy the file input into the hidden inputs
     $('.file-chooser__input').on('change', function(){
        var file = $('.file-chooser__input').val();
        var fileName = (file.match(/([^\\\/]+)$/)[0]);

       //clear any error condition
       $('.file-chooser').removeClass('error');
       $('.error-message').remove();
       
       //validate the file
       var check = checkFile(fileName);
       if(check === "valid") {
         
         // move the 'real' one to hidden list 
         $('.hidden-inputs').append($('.file-chooser__input')); 
       
         //insert a clone after the hiddens (copy the event handlers too)
         $('.file-chooser').append($('.file-chooser__input').clone({ withDataAndEvents: true})); 
       
         //add the name and a remove button to the file-list
         $('.file-list').append('<li style="display: none;"><span class="file-list__name">' + fileName + '</span><button class="removal-button" data-uploadid="'+ uploadId +'"></button></li>');
         $('.file-list').find("li:last").show(100);
        
         //removal button handler
         $('.removal-button').on('click', function(e){
           e.preventDefault();
         
           //remove the corresponding hidden input
           $('.hidden-inputs input[data-uploadid="'+ $(this).data('uploadid') +'"]').remove(); 
         
           //remove the name from file-list that corresponds to the button clicked
           $(this).parent().remove();
           
           //if the list is now empty, change the text back 
           if($('.file-list li').length === 0) {
             $('.file-uploader__message-area').text(options.MessageAreaText || settings.MessageAreaText);
           }
         });
       
         //so the event handler works on the new "real" one
         $('.hidden-inputs .file-chooser__input').removeClass('file-chooser__input').attr('data-uploadId', uploadId); 
       
         //update the message area
         $('.file-uploader__message-area').text(options.MessageAreaTextWithFiles || settings.MessageAreaTextWithFiles);
         
         uploadId++;
         
       } else {
         //indicate that the file is not ok
         $('.file-chooser').addClass("error");
         var errorText = options.DefaultErrorMessage || settings.DefaultErrorMessage;
         
         if(check === "badFileName") {
           errorText = options.BadTypeErrorMessage || settings.BadTypeErrorMessage;
         }
         
         $('.file-chooser__input').after('<p class="error-message">'+ errorText +'</p>');
       }
     });
     
     var checkFile = function(fileName) {
       var accepted          = "invalid",
           acceptedFileTypes = this.acceptedFileTypes || settings.acceptedFileTypes,
           regex;

       for ( var i = 0; i < acceptedFileTypes.length; i++ ) {
         regex = new RegExp("\\." + acceptedFileTypes[i] + "$", "i");

         if ( regex.test(fileName) ) {
           accepted = "valid";
           break;
         } else {
           accepted = "badFileName";
         }
       }

       return accepted;
    };
  }; 
}( jQuery ));

  //init 
  $(document).ready(function(){
    $('.fileUploader').uploader({
      MessageAreaText: "  "
    });
  });
});



$(document).ready(function(){
  $(document).on('click', '.toggl-click-question', function(e){
    $(this).parents('.nested-fields').find('.toggle-question').slideToggle();
     $(this).toggleClass("expanded");
  });
});

$(document).ready(function(){
  $(document).on('click', '.toggl-click-answer', function(e){
    $(this).parents('.answer-nestes-field').find('.toggle-answer').slideToggle();
  });

  $(document).on("click",".new-activity, .edit-activity-btn",function(){
    $('.activity-gradebook-show').removeClass("active");
    $('.activity-lessons-show').removeClass("active");
  })
});



$(document).on("click", ".activity-gradebook-show", function(){
  var dataURL = $(this).data("url");
  $.ajax({
    url: dataURL,
    type: 'get',
    dataType: 'script', 
  });
});

$(document).on("click", ".activity-documents-show", function(){
  var dataURL = $(this).data("url");
  $.ajax({
    url: dataURL,
    type: 'get',
    dataType: 'script', 
  });
});

$(document).on("click", ".course-chat-activity", function(){
  $(".setup-chat-tabs").html('<p class="text-center"><img src="/assets/loading.gif"></p>');
  var dataURL = $(this).data("url");
  $.ajax({
    url: dataURL,
    type: 'post',
    dataType: 'script',
  });
});


$(document).on("click", ".studnt-child-click", function(){
  var dataURL = $(this).data("url");
  $.ajax({
    url: dataURL,
    type: 'get',
    dataType: 'script',
  });
});

$(document).on("keyup",".course_search_input",function(){
  var val = $(this).val();
  $.ajax({
    url: "/schools/courses",
    type: "get",
    dataType: "script",
    data: {search: val}
  })
})