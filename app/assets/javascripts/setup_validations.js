$(document).on("click", ".th-next-btn, .th-tab-step", function(){
  var type = $(".th-tab-step.active").data("step-type");
  if(type == "course"){
    var desc = $("#organization_information_description").val();
    var landing = $(".landing-image-preview").text();
    var logo = $(".logo-image-preview").text()
    if (desc.length <= 0 && landing.length <= 0 && logo.length <= 0 ){
      $(".desc-validate").text(" Please Provide a valid description")
      $(".landing-page-validate").text("Please provide a valid landing page image")
      $(".logo-validate").text("Please provide a valid logo image")
      $(".char-textarea").addClass("border-error")
      $(".th-la-im").addClass("border-error")
      $(".th-log-im").addClass("border-error")
      $(".tab1").click();
    }else if(desc.length <= 0 && landing.length <= 0){
      $(".landing-page-validate").text("Please Provide a valid landing page image")
      $(".desc-validate").text(" Please Provide a valid description")
      $(".logo-validate").text("")
      $(".char-textarea").addClass("border-error")
      $(".th-la-im").addClass("border-error")
      $(".th-log-im").removeClass("border-error")
      $(".tab1").click();
    }else if(desc.length <= 0 && logo.length <= 0 ){
      $(".logo-validate").text("Please Provide a valid logo image")
      $(".desc-validate").text(" Please Provide a valid description")
      $(".landing-page-validate").text("")
      $(".char-textarea").addClass("border-error")
      $(".th-la-im").removeClass("border-error")
      $(".th-log-im").addClass("border-error")
      $(".tab1").click();
    }else if(landing.length <= 0 && logo.length <= 0 ){
      $(".logo-validate").text("Please Provide a valid logo image")
      $(".landing-page-validate").text("Please Provide a valid landing page image")
      $(".desc-validate").text("")
      $(".char-textarea").removeClass("border-error")
      $(".th-la-im").addClass("border-error")
      $(".th-log-im").addClass("border-error")
      $(".tab1").click();
    }else if(desc.length <= 0){
      $(".desc-validate").text(" Please Provide a valid description")
      $(".logo-validate").text("")
      $(".landing-page-validate").text("")
      $(".char-textarea").addClass("border-error")
      $(".th-la-im").removeClass("border-error")
      $(".th-log-im").removeClass("border-error")
      $(".tab1").click();
    }else if(landing.length <= 0){
      $(".landing-page-validate").text("Please Provide a valid landing page image")
      $(".desc-validate").text("")
      $(".logo-validate").text("")
      $(".char-textarea").removeClass("border-error")
      $(".th-la-im").addClass("border-error")
      $(".th-log-im").removeClass("border-error")
      $(".tab1").click();
    }else if(logo.length <= 0){
      $(".logo-validate").text("Please Provide a valid logo image")
      $(".landing-page-validate").text("")
      $(".desc-validate").text("")
      $(".char-textarea").removeClass("border-error")
      $(".th-la-im").removeClass("border-error")
      $(".th-log-im").addClass("border-error")
      $(".tab1").click();
    }
  }else if(type == "lesson"){
    // var teacher = $("#course_course_users_attributes_0_user_id").val();
    var teacher = "ss"//$("#course_course_users_attributes_0_user_id").val();
    var title = $("#course_name").val();
    var subtTitle = $("#course_subtitle").val();
    var startdate = $("#course_start_date").val();
    var enddate = $("#course_end_date").val();
    var image = $(".course-img-preview").text();
    var video = $(".course_att-preview").text();
    var is_image = $("#course_course_images_attributes_0_image").data("image-present");
    var is_video = $("#course_course_attachments_attributes_0_attachment").data("image-present");

    if(teacher.length <= 0 && title.length <= 0 && subtTitle <= 0 && startdate <= 0 && enddate <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("Can't be blank")
      $(".cu-name-validate").text("Please provide a valid course title")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $("#course_name").addClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").addClass("border-error")

      $(".tab2").click();
    }else if(teacher.length <= 0 && subtTitle.length <= 0 && startdate.length <= 0 && enddate.length <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("Can't be blank")
      $(".cu-name-validate").text("")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $("#course_name").removeClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }else if(teacher.length <= 0 && title.length <= 0 && startdate.length <= 0 && enddate.length <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("Can't be blank")
      $(".cu-name-validate").text("Please provide a valid course title")
      $(".cu-subtitle-validate").text("")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $(".course_name").addClass("border-error")
      $("#course_subtitle").removeClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }else if(teacher.length <= 0 && title.length <= 0 && subtTitle.length <= 0 && enddate.length <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("Can't be blank")
      $(".cu-name-validate").text("Please provide a valid course title")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $(".course_name").addClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").removeClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }else if(teacher.length <= 0 && title.length <= 0 && subtTitle.length <= 0 && startdate.length <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("Can't be blank")
      $(".cu-name-validate").text("Please provide a valid course title")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $(".course_name").addClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").removeClass("border-error")
      $(".tab2").click();
    }else if(teacher.length <= 0 && title.length <= 0 && subtTitle.length <= 0 && startdate.length <= 0 && enddate.length <= 0 ){
      $(".teacher-validate").text("Can't be blank")
      $(".cu-name-validate").text("Please provide a valid course title")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".cu-image-validate").text("")
      $(".course_name").addClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }else if(title.length <= 0 && subtTitle.length <= 0 && startdate.length <= 0 && enddate.length <= 0 && (image.length <= 0 && video.length <= 0) ){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("Please provide a valid course title")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $(".course_name").addClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }else if(title.length <= 0 && startdate.length <= 0 && enddate.length <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("Please provide a valid course title")
      $(".cu-subtitle-validate").text("")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $(".course_name").addClass("border-error")
      $("#course_subtitle").removeClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }else if(title.length <= 0 && subtTitle.length <= 0 && enddate.length <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("Please provide a valid course title")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $(".course_name").addClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").removeClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }else if(title.length <= 0 && subtTitle.length <= 0 && startdate.length <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("Please provide a valid course title")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $(".course_name").addClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").removeClass("border-error")
      $(".tab2").click();
    }
    else if(title.length <= 0 && subtTitle.length <= 0 && startdate.length <= 0 && enddate.length <= 0){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("Please provide a valid course title")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".cu-image-validate").text("")
      $(".course_name").addClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }else if(subtTitle.length <= 0 && startdate.length <= 0 && enddate.length <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("Please provide a valid course title")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $(".course_name").addClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }
    else if(subtTitle.length <= 0 && enddate.length <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $("#course_name").removeClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").removeClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }
    else if(subtTitle.length <= 0 && startdate.length <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $("#course_name").removeClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").removeClass("border-error")
      $(".tab2").click();
    }
    else if(subtTitle.length <= 0 && startdate.length <= 0 && enddate.length <= 0){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".cu-image-validate").text("")
      $("#course_name").removeClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }else if(startdate.length <= 0 && enddate.length <= 0&& (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $("#course_name").removeClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }
    else if(startdate.length <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("")
      $(".cu-subtitle-validate").text("")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $("#course_name").removeClass("border-error")
      $("#course_subtitle").removeClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").removeClass("border-error")
      $(".tab2").click();
    }
    else if(startdate.length <= 0 && enddate.length <= 0){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("")
      $(".cu-subtitle-validate").text("")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".cu-image-validate").text("")
      $("#course_name").removeClass("border-error")
      $("#course_subtitle").removeClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }else if(enddate.length <= 0 && (image.length <= 0 && video.length <= 0)){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("")
      $(".cu-subtitle-validate").text("")
      $(".cu-start-validate").text("")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".course-image-error").text("Image Can't be blank")
      $("#course_name").removeClass("border-error")
      $("#course_subtitle").removeClass("border-error")
      $("#course_start_date").removeClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }else if(teacher.length <= 0){
      $(".teacher-validate").text("Can't be blank")
      $(".cu-name-validate").text("")
      $(".cu-subtitle-validate").text("")
      $(".cu-start-validate").text("")
      $(".cu-end-validate").text("")
      $(".cu-image-validate").text("")
      $("#course_name").removeClass("border-error")
      $("#course_subtitle").removeClass("border-error")
      $("#course_start_date").removeClass("border-error")
      $("#course_end_date").removeClass("border-error")
      $(".tab2").click();
    }
    else if(title.length <= 0){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("Please provide a valid course title")
      $(".cu-subtitle-validate").text("")
      $(".cu-start-validate").text("")
      $(".cu-end-validate").text("")
      $(".cu-image-validate").text("")
      $("#course_name").addClass("border-error")
      $("#course_subtitle").removeClass("border-error")
      $("#course_start_date").removeClass("border-error")
      $("#course_end_date").removeClass("border-error")
      $(".tab2").click();
    }else if(subtTitle.length <= 0 ){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("")
      $(".cu-subtitle-validate").text("Please provide a valid subtitle")
      $(".cu-start-validate").text("")
      $(".cu-end-validate").text("")
      $(".cu-image-validate").text("")
      $("#course_name").removeClass("border-error")
      $("#course_subtitle").addClass("border-error")
      $("#course_start_date").removeClass("border-error")
      $("#course_end_date").removeClass("border-error")
      $(".tab2").click();
    }else if(startdate.length <= 0 ){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("")
      $(".cu-subtitle-validate").text("")
      $(".cu-start-validate").text("Please provide a valid course start date")
      $(".cu-end-validate").text("")
      $(".cu-image-validate").text("")
      $("#course_name").removeClass("border-error")
      $("#course_subtitle").removeClass("border-error")
      $("#course_start_date").addClass("border-error")
      $("#course_end_date").removeClass("border-error")
      $(".tab2").click();
    }else if(enddate.length <= 0 ){
      $(".teacher-validate").text("")
      $(".cu-name-validate").text("")
      $(".cu-subtitle-validate").text("")
      $(".cu-start-validate").text("")
      $(".cu-end-validate").text("Please provide a valid course end date")
      $(".cu-image-validate").text("")
      $("#course_name").removeClass("border-error")
      $("#course_subtitle").removeClass("border-error")
      $("#course_start_date").removeClass("border-error")
      $("#course_end_date").addClass("border-error")
      $(".tab2").click();
    }else if (is_image == false && is_video == false){
      $(".course-image-error").text("Image Can't be blank")
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".tab2").click();
    }else if (image.length <= 0 && is_image == false){
      $(".course-image-error").text("Image Can't be blank")
      $(".tab2").click();
    }else if (video.length <= 0 && is_video == false){
      $(".course-attach-error").text("Attachment Can't be blank")
      $(".tab2").click();
    }
  }
  if(type == "activity"){
    var exist = $(".exit-lesson").data("exit-lesson")
    var name = $("#lesson_name").val();
    var startdate = $("#lesson_start_date").val();
    var enddate = $("#lesson_end_date").val()
    if (!exist){
      if (name.length <= 0 && startdate.length <= 0 && enddate.length <= 0 ){
        $(".le-end-validate").text("Please provide a valid lesson end date")
        $(".le-start-validate").text("Please provide a valid lesson start date")
        $(".le-name-validate").text("Please provide a valid lesson title")
        $("#lesson_name").addClass("border-error")
        $("#lesson_start_date").addClass("border-error")
        $("#lesson_end_date").addClass("border-error")
        $(".tab3").click();
        return false;
      }else if(name.length <= 0 && startdate.length){
        $(".le-start-validate").text("Please provide a valid lesson start date")
        $(".le-name-validate").text("Please provide a valid lesson title")
        $(".le-end-validate").text("")
        $("#lesson_name").addClass("border-error")
        $("#lesson_start_date").addClass("border-error")
        $("#lesson_end_date").removeClass("border-error")
        $(".tab3").click();
        return false;
      }else if(name.length <= 0 && enddate.length <= 0 ){
        $(".le-end-validate").text("Please provide a valid lesson end date")
        $(".le-name-validate").text("Please provide a valid lesson title")
        $(".le-start-validate").text("")
        $("#lesson_name").addClass("border-error")
        $("#lesson_start_date").removeClass("border-error")
        $("#lesson_end_date").addClass("border-error")
        $("#lesson_end_date").addClass("border-error")
        $(".tab3").click();
        return false;
      }else if(startdate.length <= 0 && enddate.length <= 0 ){
        $(".le-end-validate").text("Please provide a valid lesson end date")
        $(".le-start-validate").text("Please provide a valid lesson start date")
        $(".le-name-validate").text("")
        $("#lesson_name").removeClass("border-error")
        $("#lesson_start_date").addClass("border-error")
        $("#lesson_end_date").addClass("border-error")
        $(".tab3").click();
        return false;
      }else if(name.length <= 0){
        $(".le-name-validate").text("Please provide a valid lesson title")
        $(".le-end-validate").text("")
        $(".le-start-validate").text("")
        $("#lesson_name").addClass("border-error")
        $("#lesson_start_date").removeClass("border-error")
        $("#lesson_end_date").removeClass("border-error")
        $(".tab3").click();
        return false;
      }else if(startdate.length <= 0){
        $(".le-start-validate").text("Please provide a valid lesson start date")
        $(".le-name-validate").text("")
        $(".le-end-validate").text("")
        $("#lesson_name").removeClass("border-error")
        $("#lesson_start_date").addClass("border-error")
        $("#lesson_end_date").removeClass("border-error")
        $(".tab3").click();
        return false;
      }else if(enddate.length <= 0){
        $(".le-end-validate").text("Please provide a valid lesson end date")
        $(".le-start-validate").text("")
        $(".le-name-validate").text("")
        $("#lesson_name").addClass("border-error")
        $("#lesson_start_date").removeClass("border-error")
        $("#lesson_end_date").addClass("border-error")
        $(".tab3").click();
        return false;
      }
    }
  }
  if (type == "template"){
    var activityExist = $(".activity-exist").data("exist-activity")
    if(activityExist==false || activityExist=="false"){
      $(".all-activities-error").text("Please Should have atleast one activity");
      $(".tab4").click();
      return false;
    }
  }

  if (type == "plan"){
    var templateExist = $(".template-exists").data("template-exist")
    if(templateExist==false || templateExist=="false"){
      $(".template-validate").text("Please Should have atleast Template");
      $(".tab5").click();
      return false;
    }
  }

  if (type == "final"){
    
  }
});


$(document).on("click", ".new-lesson-btn", function(){
  $('.form_loaders').removeClass('hide');
  var name = $("#lesson_name").val();
  var startdate = $("#lesson_start_date").val();
  var enddate = $("#lesson_end_date").val();
  if (name.length <= 0 && startdate.length <= 0 && enddate.length <= 0 ){
    $(".le-end-validate").text("Please provide a valid lesson end date")
    $(".le-start-validate").text("Please provide a valid lesson start date")
    $(".le-name-validate").text("Please provide a valid lesson title")
    $("#lesson_name").addClass("border-error")
    $("#lesson_start_date").addClass("border-error")
    $("#lesson_end_date").addClass("border-error")
    form_loader();
    $(".tab3").click();
    return false;
  }else if(name.length <= 0 && startdate.length <= 0){
    $(".le-start-validate").text("Please provide a valid lesson start date")
    $(".le-name-validate").text("Please provide a valid lesson title")
    $(".le-end-validate").text("")
    $("#lesson_name").addClass("border-error")
    $("#lesson_start_date").addClass("border-error")
    $("#lesson_end_date").removeClass("border-error")
    form_loader();
    $(".tab3").click();
    return false;
  }else if(name.length <= 0 && enddate.length <= 0 ){
    $(".le-end-validate").text("Please provide a valid lesson end date")
    $(".le-name-validate").text("Please provide a valid lesson title")
    $(".le-start-validate").text("")
    $("#lesson_name").addClass("border-error")
    $("#lesson_start_date").removeClass("border-error")
    $("#lesson_end_date").addClass("border-error")
    form_loader();
    $(".tab3").click();
    return false;
  }else if(startdate.length <= 0 && enddate.length <= 0 ){
    $(".le-end-validate").text("Please provide a valid lesson end date")
    $(".le-start-validate").text("Please provide a valid lesson start date")
    $(".le-name-validate").text("")
    $("#lesson_name").removeClass("border-error")
    $("#lesson_start_date").addClass("border-error")
    $("#lesson_end_date").addClass("border-error")
    form_loader();
    $(".tab3").click();
    return false;
  }else if(name.length <= 0){
    $(".le-name-validate").text("Please provide a valid lesson title")
    $(".le-end-validate").text("")
    $(".le-start-validate").text("")
    $("#lesson_name").addClass("border-error")
    $("#lesson_start_date").removeClass("border-error")
    $("#lesson_end_date").removeClass("border-error")
    form_loader();
    $(".tab3").click();
    return false;
  }else if(startdate.length <= 0){
    $(".le-start-validate").text("Please provide a valid lesson start date")
    $(".le-name-validate").text("")
    $(".le-end-validate").text("")
    $("#lesson_name").removeClass("border-error")
    $("#lesson_start_date").addClass("border-error")
    $("#lesson_end_date").removeClass("border-error")
    form_loader();
    $(".tab3").click();
    return false;
  }else if(enddate.length <= 0){
    $(".le-end-validate").text("Please provide a valid lesson end date")
    $(".le-start-validate").text("")
    $(".le-name-validate").text("")
    $("#lesson_name").removeClass("border-error")
    $("#lesson_start_date").removeClass("border-error")
    $("#lesson_end_date").addClass("border-error")
    form_loader();
    $(".tab3").click();
    return false;
  }
});


$(document).on("click", ".submit-video-btn", function(){
  $('.form_loaders').removeClass('hide');
  var name = $("#video_activity_name").val();
  var duedate = $("#video_activity_due_date").val();
  if(name.length <= 0 && duedate.length <= 0){
    $(".vid-name-validate").html("Please provide a valid name")
    $(".vid-date-validate").html("Please provide a valid due date")
    $("#video_activity_name").addClass("border-error")
    $("#video_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }else if(name.length <= 0){
    $(".vid-name-validate").html("Please provide a valid name")
    $(".vid-date-validate").html("")
    $("#video_activity_name").addClass("border-error")
    $("#video_activity_due_date").removeClass("border-error")
    form_loader();
    return false;
  }else if(duedate.length <= 0){
    $(".vid-name-validate").html("")
    $(".vid-date-validate").html("Please provide a valid due date")
    $("#video_activity_name").removeClass("border-error")
    $("#video_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }
});

$(document).on("click", ".submit-quiz-btn", function(){
  $('.form_loaders').removeClass('hide');
  var name = $("#quiz_activity_name").val();
  var duedate = $("#quiz_activity_due_date").val();
  if(name.length <= 0 && duedate.length <= 0){
    $(".qui-name-validate").html("Please provide a valid name")
    $(".qui-date-validate").html("Please provide a valid due date")
    $("#quiz_activity_name").addClass("border-error")
    $("#quiz_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }else if(name.length <= 0){
    $(".qui-name-validate").html("Please provide a valid name")
    $(".qui-date-validate").html("")
    $("#quiz_activity_name").addClass("border-error")
    $("#quiz_activity_due_date").removeClass("border-error")
    form_loader();
    return false;
  }else if(duedate.length <= 0){
    $(".qui-name-validate").html("")
    $(".qui-date-validate").html("Please provide a valid due date")
    $("#quiz_activity_name").removeClass("border-error")
    $("#quiz_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }
});


$(document).on("click", ".submit-reading-btn", function(){
  $('.form_loaders').removeClass('hide');
  var name = $("#reading_activity_name").val();
  var duedate = $("#reading_activity_due_date").val();
  if(name.length <= 0 && duedate.length <= 0){
    $(".read-name-validate").html("Please provide a valid name")
    $(".read-date-validate").html("Please provide a valid due date")
    $("#reading_activity_name").addClass("border-error")
    $("#reading_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }else if(name.length <= 0){
    $(".read-name-validate").html("Please provide a valid name")
    $(".read-date-validate").html("")
    $("#reading_activity_name").addClass("border-error")
    $("#reading_activity_due_date").removeClass("border-error")
    form_loader();
    return false;
  }else if(duedate.length <= 0){
    $(".read-name-validate").html("")
    $(".read-date-validate").html("Please provide a valid due date")
    $("#reading_activity_name").removeClass("border-error")
    $("#reading_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }
});

$(document).on("click", ".submit-essay-btn", function(){
  $('.form_loaders').removeClass('hide');
  var name = $("#essay_activity_name").val();
  var duedate = $("#essay_activity_due_date").val();
  if(name.length <= 0 && duedate.length <= 0){
    $(".esy-name-validate").html("Please provide a valid name")
    $(".esy-date-validate").html("Please provide a valid due date")
    $("#essay_activity_name").addClass("border-error")
    $("#essay_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }else if(name.length <= 0){
    $(".esy-name-validate").html("Please provide a valid name")
    $(".esy-date-validate").html("")
    $("#essay_activity_name").addClass("border-error")
    $("#essay_activity_due_date").removeClass("border-error")
    form_loader();
    return false;
  }else if(duedate.length <= 0){
    $(".esy-name-validate").html("")
    $(".esy-date-validate").html("Please provide a valid due date")
    $("#essay_activity_name").removeClass("border-error")
    $("#essay_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }
});

$(document).on("click", ".submit-page-btn", function(){
  $('.form_loaders').removeClass('hide');
  var name = $("#page_activity_name").val();
  var duedate = $("#page_activity_due_date").val();
  if(name.length <= 0 && duedate.length <= 0){
    $(".page-name-validate").html("Please provide a valid name")
    $(".page-date-validate").html("Please provide a valid due date")
    $("#page_activity_name").addClass("border-error")
    $("#page_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }else if(name.length <= 0){
    $(".page-name-validate").html("Please provide a valid name")
    $(".page-date-validate").html("")
    $("#page_activity_name").addClass("border-error")
    $("#page_activity_due_date").removeClass("border-error")
    form_loader();
    return false;
  }else if(duedate.length <= 0){
    $(".page-name-validate").html("")
    $(".page-date-validate").html("Please provide a valid due date")
    $("#page_activity_name").removeClass("border-error")
    $("#page_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }
});

$(document).on("click", ".submit-writing-btn", function(){
  $('.form_loaders').removeClass('hide');
  var name = $("#writing_activity_name").val();
  var duedate = $("#writing_activity_due_date").val();
  if(name.length <= 0 && duedate.length <= 0){
    $(".wrt-name-validate").html("Please provide a valid name")
    $(".wrt-date-validate").html("Please provide a valid due date")
    $("#writing_activity_name").addClass("border-error")
    $("#writing_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }else if(name.length <= 0){
    $(".wrt-name-validate").html("Please provide a valid name")
    $(".wrt-date-validate").html("")
    $("#writing_activity_name").addClass("border-error")
    $("#writing_activity_due_date").removeClass("border-error")
    form_loader();
    return false;
  }else if(duedate.length <= 0){
    $(".wrt-name-validate").html("")
    $(".wrt-date-validate").html("Please provide a valid due date")
    $("#writing_activity_name").removeClass("border-error")
    $("#writing_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }
});

$(document).on("click", ".submit-document-btn", function(){
  $('.form_loaders').removeClass('hide');
  var name = $("#document_activity_name").val();
  var duedate = $("#document_activity_due_date").val();
  if(name.length <= 0 && duedate.length <= 0){
    $(".doc-name-validate").html("Please provide a valid name")
    $(".doc-date-validate").html("Please provide a valid due date")
    $("#document_activity_name").addClass("border-error")
    $("#document_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }else if(name.length <= 0){
    $(".doc-name-validate").html("Please provide a valid name")
    $(".doc-date-validate").html("")
    $("#document_activity_name").addClass("border-error")
    $("#document_activity_due_date").removeClass("border-error")
    form_loader();
    return false;
  }else if(duedate.length <= 0){
    $(".doc-name-validate").html("")
    $(".doc-date-validate").html("Please provide a valid due date")
    $("#document_activity_name").removeClass("border-error")
    $("#document_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }
});

$(document).on("click", ".submit-present-btn", function(){
  $('.form_loaders').removeClass('hide');
  var name = $("#presentation_activity_name").val();
  var duedate = $("#presentation_activity_due_date").val();
  if(name.length <= 0 && duedate.length <= 0){
    $(".pre-name-validate").html("Please provide a valid name")
    $(".pre-date-validate").html("Please provide a valid due date")
    $("#presentation_activity_name").addClass("border-error")
    $("#presentation_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }else if(name.length <= 0){
    $(".pre-name-validate").html("Please provide a valid name")
    $(".pre-date-validate").html("")
    $("#presentation_activity_name").addClass("border-error")
    $("#presentation_activity_due_date").removeClass("border-error")
    form_loader();
    return false;
  }else if(duedate.length <= 0){
    $(".pre-name-validate").html("")
    $(".pre-date-validate").html("Please provide a valid due date")
    $("#presentation_activity_name").removeClass("border-error")
    $("#presentation_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }
});

$(document).on("click", ".submit-audio-btn", function(){
  $('.form_loaders').removeClass('hide');
  var name = $("#audio_activity_name").val();
  var duedate = $("#audio_activity_due_date").val();
  if(name.length <= 0 && duedate.length <= 0){
    $(".aud-name-validate").html("Please provide a valid name")
    $(".aud-date-validate").html("Please provide a valid due date")
    $("#audio_activity_name").addClass("border-error")
    $("#audio_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }else if(name.length <= 0){
    $(".aud-name-validate").html("Please provide a valid name")
    $(".aud-date-validate").html("")
    $("#audio_activity_name").addClass("border-error")
    $("#audio_activity_due_date").removeClass("border-error")
    form_loader();
    return false;
  }else if(duedate.length <= 0){
    $(".aud-name-validate").html("")
    $(".aud-date-validate").html("Please provide a valid due date")
    $("#audio_activity_name").removeClass("border-error")
    $("#audio_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }
});

$(document).on("click", ".submit-discussion-btn", function(){
  $('.form_loaders').removeClass('hide');
  var name = $("#discussion_activity_name").val();
  var duedate = $("#discussion_activity_due_date").val();
  if(name.length <= 0 && duedate.length <= 0){
    $(".dis-name-validate").html("Please provide a valid name")
    $(".dis-date-validate").html("Please provide a valid due date")
    $("#discussion_activity_name").addClass("border-error")
    $("#discussion_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }else if(name.length <= 0){
    $(".dis-name-validate").html("Please provide a valid name")
    $(".dis-date-validate").html("")
    $("#discussion_activity_name").addClass("border-error")
    $("#discussion_activity_due_date").removeClass("border-error")
    form_loader();
    return false;
  }else if(duedate.length <= 0){
    $(".dis-name-validate").html("")
    $(".dis-date-validate").html("Please provide a valid due date")
    $("#discussion_activity_name").removeClass("border-error")
    $("#discussion_activity_due_date").addClass("border-error")
    form_loader();
    return false;
  }
});


$(document).on("keyup", "#organization_information_description", function(){
  $(this).removeClass("border-error");
  $(".desc-validate").text("")
});

$(document).on("change", "#organization_information_landing_page_image", function(){
  $(".th-la-im").removeClass("border-error");
  $(".landing-page-validate").text("")
});

$(document).on("change", "#organization_information_logo", function(){
  $(".th-log-im").removeClass("border-error");
  $(".logo-validate").text("")
});

$(document).on("keyup", "#course_name", function(){
  $(this).removeClass('border-error');
  $(".cu-name-validate").text("")
});

$(document).on("keyup", "#course_subtitle", function(){
  $(this).removeClass('border-error');
  $(".cu-subtitle-validate").text("")
});

$(document).on("keyup", "#lesson_name", function(){
  $(this).removeClass('border-error');
  $(".le-name-validate").text("")
});

$(document).on("click", ".th-prev-btn, .th-next-btn, .th-tab-step", function(){
  $(".th-tab-step").each(function(){
    var inp = $(this)
    if (!inp.hasClass('active')){
      var type = inp.data("step-type");
      if(type == "organization"){
        var desc = $("#organization_information_description").val();
        var landing = $(".landing-image-preview").text();
        var logo = $(".logo-image-preview").text()
        if (desc.length >= 0 && landing.length >= 0 && logo.length >= 0 ){
          inp.addClass("done");
        }
      }else if(type == "course"){
        // var teacher = $("#course_course_users_attributes_0_user_id").val();
        var teacher = "ss"//$("#course_course_users_attributes_0_user_id").val();
        var title = $("#course_name").val();
        var subtTitle = $("#course_subtitle").val();
        var startdate = $("#course_start_date").val();
        var enddate = $("#course_end_date").val();
        var image = $("#course_course_images_attributes_0_image").val();
        var video = $("#course_course_attachments_attributes_0_attachment").val();
        var is_image = $("#course_course_images_attributes_0_image").data("image-present");
        var is_video = $("#course_course_attachments_attributes_0_attachment").data("image-present");
        if(teacher.length >= 0 && title.length >= 0 && subtTitle.length >= 0 && startdate.length >= 0 && enddate.length >= 0 && (is_image == true && is_video == true)){
         inp.addClass("done");
        }
      }
      else if(type == "lesson"){
        var exist = $(".exit-lesson").data("exit-lesson")
        var name = $("#lesson_name").val();
        var startdate = $("#lesson_start_date").val();
        var enddate = $("#lesson_end_date").val()
        var filled = inp.hasClass('filled');
        if (filled){
          inp.addClass("done");
        }
      }
      else if (type == "activity"){
        var activityExist = $(".activity-exist").data("exist-activity")
        if(activityExist==true || activityExist=="true"){
          // inp.addClass("done");
        }
        var filled = inp.hasClass('filled');
        if (filled){
          inp.addClass("done");
        }
      }

      else if (type == "template"){
        var templateExist = $(".template-exists").data("template-exist")
        if(templateExist==true || templateExist=="true"){
         // inp.addClass("done");
        }
      }

      else if (type == "plan"){
        
      }
    }
  });
});


function form_loader(){
  setTimeout(function(){
    $('.form_loaders').addClass('hide');
  },600)
}

$(document).on("click", ".enroll-btn", function(){
  var course = $(this).data('course-id')
  search = []
  $('.enroll_student:checked').each(function () {
    search.push($(this).val());
   });
  $.ajax({
    url: '/schools/courses/enroll_students',
    dataType: 'script',
    data: {student_ids: search, course_id: course, type: "enroll"},
  });
  
});


$(document).on("click", ".enroll-cancel-btn", function(){
  var course = $(this).data('course-id')
  search = []
  $('.cancel_enroll_student:checked').each(function () {
    search.push($(this).val());
   });
  $.ajax({
    url: '/schools/courses/enroll_students',
    dataType: 'script',
    data: {student_ids: search, course_id: course, type: "cancel"},
  });
  
});
