//= require moment
//= require bootstrap-datetimepicker


$(document).on("change", ".upload-file", function(){
  var limit = $(this).data("limit");
  if ($(this).size > 102400) {
  var thisSize = $(this)[0].files[0].size/1024/1024;
  if (limit < thisSize){
    $(this).parent().parent().parent().find(".fileupload-preview").text("")
    $(this).parent().parent().find('.file-size-error').show();
    $(this).parent().parent().find(".file-size-error").text("The file size can not exceed "+limit+"MB")
    $(this).val("");
    $(this).parent().parent().parent().parent().addClass("fileupload-new")
    $(this).parent().parent().parent().parent().removeClass("fileupload-exists")
    return false;
  }
 }
});

$(document).ready(function() {
  courseDatePicker();
});

function courseDatePicker(){
  var startDate = $('#course_start_date').val();
  var endDate = $('#course_end_date').val();

  $('#datetimepicker11').datetimepicker({
    useCurrent: false,
    format: 'LL',
    minDate: moment()
  });

  endDatePicker();

  if (typeof startDate != "undefined" && startDate != "") {
    $("#course_start_date").val(moment(new Date(startDate)).format("LL"))
  }


  if (typeof endDate != "undefined" && endDate != "") {
    $("#course_end_date").val(moment(new Date(endDate)).format("LL"))
  }

}

function endDatePicker(){
  $('#datetimepicker22').datetimepicker({
    useCurrent: false,
    format: 'LL',
    minDate: moment()
  });
}



// $('#datetimepicker11').on('dp.change', function(e) {
  $(document).on("dp.change", "#datetimepicker11", function(e){
    if ($('#course_start_date').val() != ""){
      endDatePicker();
      $('#datetimepicker22').data('DateTimePicker').minDate(e.date);
      $(".cu-start-validate").text("")
      var oldDate = new Date(e.oldDate)
      var newDate = new Date(e.date)
      if ((oldDate.getDate() != newDate.getDate()) || (oldDate.getMonth() != newDate.getMonth()) || (oldDate.getFullYear() != newDate.getFullYear())){
        // $(".course-submit").click();
      }
      // $('.datetimepicker33').data('DateTimePicker').minDate(e.date);

      startDate = $("#course_start_date").val();
      endDate = $('#course_end_date').val();
      sDate = new Date(startDate)
      eDate = new Date(endDate)

      if ((sDate.getDate() > eDate.getDate()) || (sDate.getMonth() > eDate.getMonth()) || (sDate.getFullYear() > eDate.getFullYear())){
        $('#course_end_date').val("") 
      }
    }
  });
  
  // $('#datetimepicker22').on('dp.change', function(e) {
  $(document).on("dp.change", "#datetimepicker22", function(e){

    if ($('#course_start_date').val() == ""){
      $('#course_end_date').val("")
      alert(" Please fill the course start date before filling end date.")
    } else {
      // $('.datetimepicker33').data('DateTimePicker').maxDate(e.date);
      // $('.datetimepicker44').data('DateTimePicker').maxDate(e.date);
      $(".cu-end-validate").text("")
      var oldDate = new Date(e.oldDate)
      var newDate = new Date(e.date)

      if ((oldDate.getDate() != newDate.getDate()) || (oldDate.getMonth() != newDate.getMonth()) || (oldDate.getFullYear() != newDate.getFullYear())){
        // $(".course-submit").click();
      }
    }
    // $('#datetimepicker6').data('DateTimePicker').maxDate(e.date);
  });

  $(document).on('blur', "#course_end_date",function(){
    var startDate = $('#course_start_date').val();
    if(startDate != "" && $(this).val() != ""){
      $(".course-submit").click();
    }
  })

$(document).on("change", ".setup-course", function(){
  $(".course-submit").click();
});

$(document).ready(function() {
  $(".char-textarea-description").on("keyup",function(event){
    checkTextAreaMaxLength(this,event);
  });
  function checkTextAreaMaxLength(textBox, e) { 
    var maxLength = parseInt($(textBox).data("length"));
    if (!checkSpecialKeys(e)) { 
      if (textBox.value.length > maxLength - 1) textBox.value = textBox.value.substring(0, maxLength); 
   } 
    $(".char-count").html(maxLength - textBox.value.length);
    return true; 
  } 
  function checkSpecialKeys(e) { 
    if (e.keyCode != 8 && e.keyCode != 46 && e.keyCode != 37 && e.keyCode != 38 && e.keyCode != 39 && e.keyCode != 40) 
      return false; 
    else 
      return true; 
  }
});


$(document).ready(function() {
  $(".char-textarea-object").on("keyup",function(event){
    checkTextAreaMaxLength(this,event);
  });
  function checkTextAreaMaxLength(textBox, e) { 
    var maxLength = parseInt($(textBox).data("length"));
    if (!checkSpecialKeys(e)) { 
      if (textBox.value.length > maxLength - 1) textBox.value = textBox.value.substring(0, maxLength); 
   } 
    $(".object-char-count").html(maxLength - textBox.value.length);
    return true; 
  } 

  function checkSpecialKeys(e) { 
    if (e.keyCode != 8 && e.keyCode != 46 && e.keyCode != 37 && e.keyCode != 38 && e.keyCode != 39 && e.keyCode != 40) 
      return false; 
    else 
      return true; 
  }
});



$(document).ready(function() {
  var maxLength = 1000;
  $(document).on('keyup', '.char-textarea-2', function(event){
    var length = $(this).val().length;
    var length = maxLength-length;
    $('.char-count-2').text(length);
  });
});



$(document).ready(function() {
  var maxLength = 1000;
  $(document).on('keyup', '.char-textarea-3', function(event){
    var length = $(this).val().length;
    var length = maxLength-length;
    $('.char-count-3').text(length);
  });
});



var _validFileExtensions = [".avi", ".flv", ".mp4", ".mov", ".wmv"];    
function VideofileInput(oInput) {  
  if (oInput.type == "file") {
    var sFileName = oInput.value;
    if (sFileName.length > 0) {
      var blnValid = false;
      for (var j = 0; j < _validFileExtensions.length; j++) {
        var sCurExtension = _validFileExtensions[j];
        if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
         $('.file-remove-video').removeClass('hide')
          blnValid = true;
          $(".course-submit").click();
          break;
        }
      }
      if (!blnValid) {
        alert("File Name Is Invalid, Allowed Extensions Are: " + _validFileExtensions.join(", "));
        $('.file-remove-video').addClass('hide')
        oInput.value = "";
        return false;
      }
    }
  }
  return true;
}


$(document).ready(function(){
  var _URL = window.URL || window.webkitURL;
  var _validFileExtensions = [".jpg", ".jpeg",".png"];   
  $(document).on("change", ".check-image-size", function(e){
    var file, img;
    var check_limit = $(this).data("check");
    var inp = $(this)
    if ((file = this.files[0])) {
      img = new Image();
      var imgwidth = 0;
      var imgheight = 0;
      var maxwidth = 1500;
      var maxheight = 1500;
      img.onload = function() {
        imgwidth = this.width;
        imgheight = this.height;
        if(imgwidth <= maxwidth && imgheight <= maxheight){
          if(check_limit == "logo-image" ){
            $('.fil-remove-file-logo').removeClass('hide')
            $(".school-submit").click();
          }else if(check_limit == "landing-image"){
            $('.fil-remove-file').removeClass('hide')
            $(".school-submit").click();
          }else if(check_limit == "course-att-logo"){
            $('.fil-remove-course-at').removeClass('hide')
            $(".course-submit").click();
          }else if(check_limit == "course-image"){
            $('.fil-remove-course').removeClass('hide')
            $(".course-submit").click();
          }
        }else{
          if(check_limit == "logo-image" ){
            $('.check-image-size').parent().parent().parent().find(".logo-image-preview").text("")
            $("#organization_information_logo").val("")
            $('.fil-remove-file-logo').addClass('hide')
          }else if(check_limit == "landing-image"){
            $('.fil-remove-file').addClass('hide')
            $('.check-image-size').parent().parent().parent().find(".landing-image-preview").text("")
          }else if(check_limit == "course-att-logo"){
            $('.fil-remove-course-at').addClass('hide')
            $('.check-image-size').parent().parent().parent().find(".course_att-preview").text("")
          }else if(check_limit == "course-image"){
            $('.fil-remove-course').addClass('hide')
            $('.check-image-size').parent().parent().parent().find(".course-img-preview").text("")
          }
          alert("Image size must be" +maxwidth+"X"+maxheight);
          return false;
        }
      };
      img.onerror = function() {
        alert("File Name Is Invalid, Allowed Extensions Are: " + _validFileExtensions.join(", "));
        if(check_limit == "logo-image" ){
            $('.check-image-size').parent().parent().parent().find(".logo-image-preview").text("")
            $("#organization_information_logo").val("")
            $('.fil-remove-file-logo').addClass('hide')
          }else if(check_limit == "landing-image"){
            $('.fil-remove-file').addClass('hide')
            $('.check-image-size').parent().parent().parent().find(".landing-image-preview").text("")
          }else if(check_limit == "course-att-logo"){
            $('.fil-remove-course-at').addClass('hide')
            $('.check-image-size').parent().parent().parent().find(".course_att-preview").text("")
          }else if(check_limit == "course-image"){
            $('.fil-remove-course').addClass('hide')
            $('.check-image-size').parent().parent().parent().find(".course-img-preview").text("")
          }
        return false;
      };
      img.src = _URL.createObjectURL(file);
    }
  });
});

$(document).on("change", ".setup-school", function(){
  $(".school-submit").click();
});

$(document).on("click", ".fil-remove-file", function(){
  var infoId = $(this).data("id")
  if (infoId){
    $.ajax({
      url: '/schools/update_organization_files',
      type: 'POST',
      dataType: 'json',
      data: {landing_page: "", id: infoId}
    });
  }
  $(".landing-image-preview").text("");
  $(".fil-remove-file").addClass("hide");
});

$(document).on("click", ".fil-remove-file-logo", function(){
  var infoId = $(this).data("id")
  if (infoId){
    $.ajax({
      url: '/schools/update_organization_files',
      type: 'POST',
      dataType: 'json',
      data: {logo: "", id: infoId}
    });
  }
  $(".logo-image-preview").text("");
  $(".fil-remove-file-logo").addClass("hide");
});

$(document).on("click", ".fil-remove-course-at", function(){
  var courseId = $(this).data("id");
  $.ajax({
    url: '/schools/courses/update_course_files',
    type: 'POST',
    dataType: 'json',
    data: {id: courseId, type: "attachment"},
  });
  $(".course_att-preview").text("");
  $(".fil-remove-course-at").addClass("hide");
  $("#course_course_attachments_attributes_0_attachment").data("image-present",false);
});


$(document).on("click", ".fil-remove-course", function(){
  var courseId = $(this).data("id");
  $.ajax({
    url: '/schools/courses/update_course_files',
    type: 'POST',
    dataType: 'json',
    data: {id: courseId, type: "image"},  
  });
  $(".course-img-preview").text("");
  $(".fil-remove-course").addClass("hide");
  $("#course_course_images_attributes_0_image").data("image-present",false);
});

$(document).on("click", ".file-remove-video", function(){
  var courseId = $(this).data("id");
  $.ajax({
    url: '/schools/courses/update_course_files',
    type: 'POST',
    dataType: 'json',
    data: {id: courseId, type: "video"},  
  });
  $(".course-video-preview").text("");
  $(".file-remove-video").addClass("hide");
});



function readURL(input) {
  if (input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $('#imagePreview').css('background-image', 'url('+e.target.result +')');
      $('#imagePreview').hide();
      $('#imagePreview').fadeIn(650);
    }
    reader.readAsDataURL(input.files[0]);
  }
}
$(document).on("change", "#imageUpload", function(){
  readURL(this);
});


function creadURL(input) {
  if (input.files) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $('#CoverimagePreview').css('background-image', 'url('+e.target.result +')');
      $('#CoverimagePreview').hide();
      $('#CoverimagePreview').fadeIn(650);
    }
    reader.readAsDataURL(input.files[0]);
  }
}
$(document).on("change", "#CoverImageUpload", function(){
  creadURL(this);
});


$(document).on("change", ".image-upload", function(){
  var input = this;
  var thisUpload = $(this)
  if (this.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      thisUpload.parent().parent().next().find(".image-preview").html('<div class="col-md-12 close-prewiew"><span aria-hidden="true" class="image-close-span">×</span><h4 class="preview-title">Image Preview</h4><iframe width="100%" frameborder="0" style="border:0" src="'+ e.target.result +'" allowfullscreen></iframe></div>')
    }
    reader.readAsDataURL(input.files[0]);
  }
});

$(document).on("change", ".video-upload", function(){
  var input = this;
  var thisUpload = $(this);
  if (this.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      thisUpload.parent().parent().next().find(".video-preview").html('<div class="col-md-12 close-prewiew"><span aria-hidden="true"  class="video-close-span">×</span> <h4 class="preview-title">Video Preview</h4><iframe width="100%" frameborder="0" style="border:0" src="'+ e.target.result +'" allowfullscreen></iframe></div>')
    }
    reader.readAsDataURL(input.files[0]);
  }
});

$(document).on("change", ".audio-upload", function(){
  var input = this;
  var thisUpload = $(this);
  if (this.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      thisUpload.parent().parent().next().find(".audio-preview").html('<div class="col-md-12 close-prewiew"><span aria-hidden="true"  class="audio-close-span">×</span><h4 class="preview-title">Audio Preview</h4><iframe width="100%" frameborder="0" style="border:0" src="'+ e.target.result +'" allowfullscreen></iframe></div>')
    }
    reader.readAsDataURL(input.files[0]);
  }
});

var _validpdfExtensions = [".jpg", ".jpeg",".png", ".pdf"];  
function PdffileInput(oInput) {
  if (oInput.type == "file") {
    var sFileName = oInput.value;
    if (sFileName.length > 0) {
      var blnValid = false;
      for (var j = 0; j < _validpdfExtensions.length; j++) {
        var sCurExtension = _validpdfExtensions[j];
        if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) { 
         $('.fil-remove-course-at').removeClass('hide')
          blnValid = true;
          $(".course-submit").click();
          break;
        }
      }
      if (!blnValid) {
        alert("File Name Is Invalid, Allowed Extensions Are: " + _validpdfExtensions.join(", "));
        $('.fil-remove-course-at').addClass('hide')
        oInput.value = "";
        return false; 
      }
    }
  }
  return true;
}

var expanded = false;

function showCheckboxes() {
  // var checkboxes = $("#checkboxes");
  var checkboxes = document.getElementById("checkboxes");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}

$(document).on("click", ".select-all_teachers", function(){
  if ($(this).is(":checked")){
    console.log("true")
    $(".teacher-checkbox").prop("checked", true)
    $("#selected-teachers").html("")
    $(".teacher-checkbox:checked").each(function(){
      var id = $(this).val();
      var name = $(this).data("teacher-name")
      if (id.length > 0)
        $("#selected-teachers").append("<span class='teacher_"+id+"'>"+name+", </span>")
    })
  }else{
    console.log("false")
    $(".teacher-checkbox").prop("checked", false)
    $("#selected-teachers").html("")
  }
})

$(window).click(function(event) {
  event.stopPropagation();
  if (document.getElementById("checkboxes") != null){
    var checkboxes = document.getElementById("checkboxes");
    checkboxes.style.display = "none";
  }
});

$(document).on("click", "#checkboxes, .selectBox, #checkboxes label", function(event){
    event.stopPropagation();
});

$(document).on("click", ".teacher-checkbox", function(){
  var isChecked = $(this).is(":checked");
  var id = $(this).val();
  var name = $(this).data("teacher-name")
  if (isChecked){
    $("#selected-teachers").append("<span class='teacher_"+id+"'>"+name+", </span>")
  }else{
    $("teacher_"+id).remove();
  }
});


$( document ).ready(function() {
  $('iframe').load(function() {
    $(this).contents().find('img').css({'width': '140px', 'height': '95px'});
  })

  $(document).on("click", ".image-close-span", function(){
    $( ".image-preview" ).remove();
  });
  $(document).on("click", ".video-close-span", function(){
    $( ".video-preview" ).remove();
  });
  $(document).on("click", ".audio-close-span", function(){
    $( ".audio-preview" ).remove();
  });
});

$(document).on("click", ".grade-back-btn", function(){
  $(".activity-gradebook-show").click();
});
