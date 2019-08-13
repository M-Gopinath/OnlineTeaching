$(document).on("keyup", ".search_user", function(){
  $(".user-search-btn").click();
});


$(document).ready(function(){
  $(document).on('click', '.click-show-spin', function(e){
    $('.display-spin').removeClass('hide')
  });
});

$(document).on("change", ".per-page-align", function(){
  var userType = $(this).data("user-type");
  var list = $(this).val();
  $.ajax({
    url: '/sort_users',
    dataType: 'script',
    data: {type: userType, list: list},
  });
  
});


$(document).on("change", ".per-anno-page-align", function(){
  var userType = $(this).data("anno-type");
  var list = $(this).val();
  $.ajax({
    url: '/schools/sort_announcements',
    dataType: 'script',
    data: {type: userType, list: list},
  });
  
});

$(document).on("click", ".submit-rating-btn", function(){
  var courseId = $(this).data("course-id")
  var rating = $(".course-rating-point").val();
  $.ajax({
    url: '/students/update_rating',
    dataType: 'script',
    data: {course_id: courseId, rating: rating},
  });
  
});
