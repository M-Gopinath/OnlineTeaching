# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', "#user_option", ->
  select = $(this).val();
  if (select == "courses")
    $(".enrolled-users").removeClass("hide")
    $(".all-users-event").addClass("hide")
    $(".all-students-event").addClass("hide")
    $(".all-teachers-event").addClass("hide")
  else if (select == "all")
    $(".all-users-event").removeClass("hide")
    $(".enrolled-users").addClass("hide")
    $(".all-students-event").addClass("hide")
    $(".all-teachers-event").addClass("hide")
  else if(select == "students")
    $(".all-students-event").removeClass("hide")
    $(".all-teachers-event").addClass("hide")
    $(".enrolled-users").addClass("hide")
    $(".all-users-event").addClass("hide")
  else if(select == "teachers")
    $(".all-teachers-event").removeClass("hide")
    $(".all-students-event").addClass("hide")
    $(".enrolled-users").addClass("hide")
    $(".all-users-event").addClass("hide")
  else if(select == "courses")
    $(".enrolled-users").removeClass("hide")
    $(".all-users-event").addClass("hide")
    $(".all-students-event").addClass("hide")
    $(".all-teachers-event").addClass("hide")
  else
    $(".enrolled-users").addClass("hide")
    $(".all-users-event").addClass("hide")
    $(".all-students-event").addClass("hide")
    $(".all-teachers-event").addClass("hide")

$(document).on "change", "#courses", ->
  course = $(this).val()
  if course.length > 0
    $.ajax(
      url: '/course_enrolled_users'
      dataType: 'script'
      data: course: course)

$(document).on "click", "#select_deselect", ->
  select = $(this).data("select")
  checked = $(this).is(':checked')
  if(select == "all-user")
    if checked
      $('.all-users-event').find('.all-user-check').prop("checked", true);
    else
      $('.all-users-event').find('.all-user-check').prop("checked", false);
  else if(select == "all-teacher")
    if checked
      $('.all-teachers-event').find('.all-teach-check').prop("checked", true);
    else
      $('.all-teachers-event').find('.all-teach-check').prop("checked", false);
  else if(select == "all-student")
    if checked
      $('.all-students-event').find('.all-stud-check').prop("checked", true);
    else
      $('.all-students-event').find('.all-stud-check').prop("checked", false);
  else if(select == "all-course")
    if checked
      $('.event-enrolled-users').find('.all-course-check').prop("checked", true);
    else
      $('.event-enrolled-users').find('.all-course-check').prop("checked", false);
