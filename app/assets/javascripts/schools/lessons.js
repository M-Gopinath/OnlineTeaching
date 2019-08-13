$(document).ready(function() {
  lessonDatePicker()
});
function lessonDatePicker() {
  var cDate = $('#course_start_date').val()
  var courseStart = cDate == "undefined" || cDate == ""  ? new Date() : cDate;
  var courseEnd = $('#course_end_date').val();
  var startDate = $('#lesson_start_date').val();
  var endDate = $('#lesson_end_date').val();
  if (courseEnd == "undefined" || courseEnd == ""){
    $('#lesson-start-datetimepicker').datetimepicker({
      useCurrent: false,
      format: 'LL',
      minDate: courseStart
    });

    $('#lesson-end-datetimepicker').datetimepicker({
      useCurrent: false,
      format: 'LL',
      minDate: courseStart
    });
  }else{

    $('#lesson-start-datetimepicker').datetimepicker({
      useCurrent: false,
      format: 'LL',
      minDate: courseStart,
      maxDate: courseEnd
    });

    $('#lesson-end-datetimepicker').datetimepicker({
      useCurrent: false,
      format: 'LL',
      minDate: courseStart,
      maxDate: courseEnd
    });
  }


  //Assigning Stored Values to Date Field
  if (typeof startDate != "undefined" && startDate != "") {
    // $('#lesson-start-datetimepicker').data('DateTimePicker').date(new Date(startDate));
    $("#lesson_start_date").val(moment(new Date(startDate)).format("LL"))
  }

  if (typeof endDate != "undefined" && endDate != "") {
    // $('#lesson-end-datetimepicker').data('DateTimePicker').date(new Date(endDate));
    $("#lesson_end_date").val(moment(new Date(endDate)).format("LL"))
  }

  $('#lesson-start-datetimepicker').on('dp.change', function(e) {
    if ($('#lesson_start_date').val() != ""){
      $('#lesson-end-datetimepicker').data('DateTimePicker').minDate(e.date);
      $(".le-start-validate").text();
      // $('.datetimepicker33').data('DateTimePicker').minDate(e.date);
      startDate = $("#lesson_start_date").val();
      endDate = $('#lesson_end_date').val();
      sDate = new Date(startDate)
      eDate = new Date(endDate)

      if ((sDate.getDate() > eDate.getDate()) || (sDate.getMonth() > eDate.getMonth()) || (sDate.getFullYear() > eDate.getFullYear())){
        $('#lesson_end_date').val("") 
      }
    }
  });
  
  $('#lesson-end-datetimepicker').on('dp.change', function(e) {
    if ($('#lesson_start_date').val() == ""){
      $('#lesson_end_date').val("")
      alert(" Please fill the course start date before filling end date.")
    } else {
      $(".le-end-validate").text();
      // $('.datetimepicker33').data('DateTimePicker').maxDate(e.date);
      // $('.datetimepicker44').data('DateTimePicker').maxDate(e.date);
    }
    // $('#datetimepicker6').data('DateTimePicker').maxDate(e.date);
  });
}

$(document).on("click", ".new-activity", function(){
  var activity = $(this).find('p').text();
  if (activity == "Video"){
    $(".video_activities").removeClass("hide");
    $(".quiz_activities").addClass("hide");
    $(".essay_activities").addClass("hide");
    $(".reading_activities").addClass("hide");
    $(".page_activities").addClass("hide");
    $(".writing_activities").addClass("hide");
    $(".document_activities").addClass("hide");
    $(".presentation_activities").addClass("hide");
    $(".audio_activities").addClass("hide");
    $(".discussion_activities").addClass("hide");
  }else if(activity == "Quiz"){
    $(".video_activities").addClass("hide");
    $(".quiz_activities").removeClass("hide");
    $(".reading_activities").addClass("hide");
    $(".essay_activities").addClass("hide");
    $(".page_activities").addClass("hide");
    $(".writing_activities").addClass("hide");
    $(".document_activities").addClass("hide");
    $(".presentation_activities").addClass("hide");
    $(".audio_activities").addClass("hide");
    $(".discussion_activities").addClass("hide");
  }else if(activity == "Reading"){
    $(".reading_activities").removeClass("hide");
    $(".video_activities").addClass("hide");
    $(".quiz_activities").addClass("hide");
    $(".essay_activities").addClass("hide");
    $(".page_activities").addClass("hide");
    $(".writing_activities").addClass("hide");
    $(".document_activities").addClass("hide");
    $(".presentation_activities").addClass("hide");
    $(".audio_activities").addClass("hide");
    $(".discussion_activities").addClass("hide");
  }else if(activity == "Essay"){
    $(".reading_activities").addClass("hide");
    $(".video_activities").addClass("hide");
    $(".quiz_activities").addClass("hide");
    $(".page_activities").addClass("hide");
    $(".essay_activities").removeClass("hide");
    $(".writing_activities").addClass("hide");
    $(".document_activities").addClass("hide");
    $(".presentation_activities").addClass("hide");
    $(".audio_activities").addClass("hide");
    $(".discussion_activities").addClass("hide");
  }else if(activity == "Page"){
    $(".reading_activities").addClass("hide");
    $(".video_activities").addClass("hide");
    $(".quiz_activities").addClass("hide");
    $(".essay_activities").addClass("hide");
    $(".page_activities").removeClass("hide");
    $(".writing_activities").addClass("hide");
    $(".document_activities").addClass("hide");
    $(".presentation_activities").addClass("hide");
    $(".audio_activities").addClass("hide");
    $(".discussion_activities").addClass("hide");
  }else if(activity == "Writing"){
    $(".writing_activities").removeClass("hide");
    $(".reading_activities").addClass("hide");
    $(".video_activities").addClass("hide");
    $(".quiz_activities").addClass("hide");
    $(".essay_activities").addClass("hide");
    $(".page_activities").addClass("hide");
    $(".document_activities").addClass("hide");
    $(".presentation_activities").addClass("hide");
    $(".audio_activities").addClass("hide");
    $(".discussion_activities").addClass("hide");
  }else if(activity == "Document"){
    $(".document_activities").removeClass("hide");
    $(".writing_activities").addClass("hide");
    $(".reading_activities").addClass("hide");
    $(".video_activities").addClass("hide");
    $(".quiz_activities").addClass("hide");
    $(".essay_activities").addClass("hide");
    $(".page_activities").addClass("hide");
    $(".presentation_activities").addClass("hide");
    $(".audio_activities").addClass("hide");
    $(".discussion_activities").addClass("hide");
  }else if(activity == "Presentation"){
    $(".presentation_activities").removeClass("hide");
    $(".document_activities").addClass("hide");
    $(".writing_activities").addClass("hide");
    $(".reading_activities").addClass("hide");
    $(".video_activities").addClass("hide");
    $(".quiz_activities").addClass("hide");
    $(".essay_activities").addClass("hide");
    $(".page_activities").addClass("hide");
    $(".audio_activities").addClass("hide");
    $(".discussion_activities").addClass("hide");
  }else if(activity == "Audio"){
    $(".audio_activities").removeClass("hide");
    $(".presentation_activities").addClass("hide");
    $(".document_activities").addClass("hide");
    $(".writing_activities").addClass("hide");
    $(".reading_activities").addClass("hide");
    $(".video_activities").addClass("hide");
    $(".quiz_activities").addClass("hide");
    $(".essay_activities").addClass("hide");
    $(".page_activities").addClass("hide");
    $(".discussion_activities").addClass("hide");
  }else if(activity == "Discussion"){
    $(".discussion_activities").removeClass("hide");
    $(".audio_activities").addClass("hide");
    $(".presentation_activities").addClass("hide");
    $(".document_activities").addClass("hide");
    $(".writing_activities").addClass("hide");
    $(".reading_activities").addClass("hide");
    $(".video_activities").addClass("hide");
    $(".quiz_activities").addClass("hide");
    $(".essay_activities").addClass("hide");
    $(".page_activities").addClass("hide");
  }
});

$(document).on("click", ".th-add-less", function(){
  var lessonId = $(this).data("id")
  var startDate = $(this).data("start-date")
  var endDate = $(this).data("end-date")
  // $(".activity-lesson-id").val(lessonId)
  $(".th-add-less").css("background-color", "#1EC09F")
  $(this).css("background-color", "#337ab7")
  $(".th-vido-ac-area").data("start-date", startDate)
  $(".th-vido-ac-area").data("end-date", endDate)
  $('.datetimepicker-video').datetimepicker({
    useCurrent: false,
    format: 'LL',
    minDate: startDate,
    maxDate: endDate
  });
  
});

$(document).ready(function() {
  video_datepicker();
});

function video_datepicker(){
  var startDate = $(".th-vido-ac-area").data("start-date");
  var endDate = $(".th-vido-ac-area").data("end-date");
  mindate = startDate == "undefined" || startDate == ""  ? new Date() : startDate;
  maxdate = endDate == "undefined" || endDate == ""  ? new Date() : endDate;
  
  if (maxdate == "undefined" || maxdate == ""){
    $('.datetimepicker-video').datetimepicker({
      useCurrent: false,
      format: 'LL',
      minDate: moment(new Date(mindate)).format("LL"),
      sideBySide: true,
      widgetPositioning: {
          horizontal: 'right',
          vertical: 'bottom'
      }
    });
  }else{
    $('.datetimepicker-video').datetimepicker({
      useCurrent: false,
      format: 'LL',
      minDate: moment(new Date(mindate)).format("LL"),
      maxDate: moment(new Date(maxdate)).format("LL"),
      sideBySide: true,
      widgetPositioning: {
          horizontal: 'right',
          vertical: 'bottom'
      }
    });
  }
}

$(document).on("click", ".datetimepicker-video", function(e){
  video_datepicker();
  var startDate = $(".th-vido-ac-area").data("start-date");
  var endDate = $(".th-vido-ac-area").data("end-date");
  // if (startDate != ""){
  //   $('.datetimepicker-video').each(function(){
  //     $(this).data('DateTimePicker').minDate(new Date(startDate));
  //   });
  //   // $('.datetimepicker33').data('DateTimePicker').minDate(e.date);
  // }
  // if(endDate != ""){
  //   $('.datetimepicker-video').each(function(){
  //     $(this).data('DateTimePicker').maxDate(new Date (endDate));
  //   });
  // }
});

$(document).on("click", ".activity-new-lesson", function(){
  $(".th-prev-btn").click();
});

$(document).on("click", ".th-thum-sec", function(){
  $('.th-thum-sec').removeClass("template-highlight");
  var tempId = $(this).data("temp-id");
  $(".temp-high-"+tempId).addClass("template-highlight");
  $.ajax({
    url: '/schools/lessons/update_template',
    type: 'POST',
    dataType: 'script',
    data: {temp_id: tempId},
  });
  
});

$(document).on("click", ".th-plan-sec-signup", function(){
  $(".th-plan-sec").removeClass("plan-selected");
  var planId = $(this).data("plan-id");
  $(".plan-select-"+planId).addClass("plan-selected");
  $.ajax({
    url: '/schools/lessons/client_subscription',
    type: 'POST',
    dataType: 'json',
    data: {plan_id: planId},
  });
  
});

$(document).on("click", ".th-next-btn, .th-prev-btn, .th-tab-step", function(){
  var tab = $("#last-step").hasClass("active");
  if (tab == true)
    $(".finish-btn").removeClass("hidden")
  else
    $(".finish-btn").addClass("hidden")
});

$(document).on("click", ".lesson-list-btn", function(){
  var lessonId = $(this).data("id");
  var course = $(this).data("course");
  $.ajax({
    url: '/schools/lessons/lesson_update',
    dataType: 'script',
    data: {id: lessonId,course: course},
  });
});


$(document).on("click", ".edit-activity-btn", function(){
  var activityName = $(this).data("activity-name");
  var activityId = $(this).data("activity-id");
  $.ajax({
    url: '/schools/lessons/edit_activity',
    dataType: 'script',
    data: {activity_name: activityName, activity_id: activityId},
  });
});

$(document).ready(function() {
  $('.lesson-update-title').addClass('hide');
  $(document).on("click", ".lesson-edit-items", function(){
    $('.lesson-create-title').addClass('hide');
    $('.lesson-update-title').removeClass('hide');
    $('.course-overview-title').addClass('hide');
  });

  $(document).on("click", ".less-back-create", function(){
    $('.form_loaders').removeClass('hide');
    $('.lesson-create-title').removeClass('hide');
    $('.lesson-update-title').addClass('hide');
    $('.course-overview-title').addClass('hide');
  });
});

$(document).on("click", ".marketing-temp", function(){
  $('.marketing-temp').removeClass("template-highlight");
  var tempId = $(this).data("temp-id");
  $(".temp-high-"+tempId).addClass("template-highlight");
  $("#template_id").val(tempId)
});


$(document).on("click",".activity-edit-process",function(){
  var lesson = $(this).data("lesson");
  var activity = $(this).data("activity");
  $('.tab4').click();
  $('.activity_edit_'+activity).click();
});

$(document).on("click",".lesson-edit-process",function(){
  var id = $(this).data("id");
  $('.tab3').click();
  $(".lesson_list_"+id).trigger("click");
});

$(document).on("click",'.through-course-overview-btn',function(){
  $('.tab3').click();
  var course = $(this).data("course");
  $.ajax({
    url: "/schools/courses/course_edit",
    dataType: "script",
    data: {course: course}
  })
})

$(document).on('click','.less-back-update',function(){
  var lesson = $(this).data("lesson");
  $(".video_activities form input").val("");
  $('.video_activities form :checkbox').attr("checked",false);
  $(".video_activities form :submit").val("CREATE ACTIVITY");
  $(".quiz_activities form input").val("");
  $('.quiz_activities form :checkbox').attr("checked",false);
  $(".quiz_activities form :submit").val("CREATE ACTIVITY");
  $(".reading_activities form input").val("");
  $('.reading_activities form :checkbox').attr("checked",false);
  $(".reading_activities form :submit").val("CREATE ACTIVITY");
  $(".essay_activities form input").val("");
  $('.essay_activities form :checkbox').attr("checked",false);
  $(".essay_activities form :submit").val("CREATE ACTIVITY");
  $(".page_activities form input").val("");
  $('.page_activities form :checkbox').attr("checked",false);
  $(".page_activities form :submit").val("CREATE ACTIVITY");
  $(".writing_activities form input").val("");
  $('.writing_activities form :checkbox').attr("checked",false);
  $(".writing_activities form :submit").val("CREATE ACTIVITY");
  $(".document_activities form input").val("");
  $('.document_activities form :checkbox').attr("checked",false);
  $(".document_activities form :submit").val("CREATE ACTIVITY");
  $(".presentation_activities form input").val("");
  $('.presentation_activities form :checkbox').attr("checked",false);
  $(".presentation_activities form :submit").val("CREATE ACTIVITY");
  $(".audio_activities form input").val("");
  $('.audio_activities form :checkbox').attr("checked",false);
  $(".audio_activities form :submit").val("CREATE ACTIVITY");
  $(".disscusion_activities form input").val("");
  $('.disscusion_activities form :checkbox').attr("checked",false);
  $(".disscusion_activities form :submit").val("CREATE ACTIVITY");
  $('.activity-lesson-id').val(lesson);
  $('.tab4').click();
});

$(document).on("click",".check_question_answer",function(){
  var id = $(this).data("question");
  var val = [];
  $(".check_question_answer_"+id).each(function(){
    if ($(this).is(":checked")){
      val.push($(this).val());
      $("#check_question_answer_"+id).val(val.join(','));
    }
  });
})

$(document).on("click", ".answer_submit", function(e){
  $(this).attr("disabled",true);
  e.preventDefault();
  e.stopPropagation();
  var form = $(this).form();
  var field_type = $(this).data("field_type");
  var id = $(this).data("answer");
  var val = $(".answer_input_"+id).val();
  var inp = $(this)
  if (field_type == "option"){
    op_answer = false;
    $(".answer_input_"+id).each(function(){
      if ($(this).is(":checked")){
        op_answer = true;
      }
      if (op_answer){
        $.ajax({
          url: form.attr("action"),
          type: 'post',
          dataType: "script",
          data: form.serialize()
        });
      }else{
        inp.attr("disabled",false);
        $('.error_'+id).text("Cannot be empty!");
      }
    })
  }else{
    if (val != "" && val != undefined){
      $.ajax({
        url: form.attr("action"),
        type: 'post',
        dataType: "script",
        data: form.serialize()
      });
    }else{
      inp.attr("disabled",false);
      $('.error_'+id).text("Cannot be empty!");
    }
  }
});

$(document).on("click", ".activity-documents-show, .activity-gradebook-show", function(){
  $('.tab3').click();
  $(".activity-gradebook-show").removeClass("active");
  $(".activity-documents-show").removeClass("active");
  $(this).addClass("active");
});
