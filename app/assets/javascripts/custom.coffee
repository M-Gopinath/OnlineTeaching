$(document).on 'keyup', "#client_owner_orgination_name", ->
  orgName = $(this).val();
  $("#client_subdomain").val(orgName.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, ''));

$(document).on 'click', '.comments-reply-link', ->
  commentId = $(this).data('comment-id')
  if commentId != null
    $('.reply_form_' + commentId + '').toggle()
  return

$(document).ready ->
  $('.stripe-button-el').find('span').remove()
  $('.stripe-button-el').html 'choose'
  return

$(document).on 'click', '.reply-command-btn', ->
  postId = $(this).data('post-id')
  if postId != null
    $('.post-reply-form-' + postId + '').toggle()
  return

$(document).on 'keyup', '#user_search', ->
  value = $(this).val()
  $.ajax
    url: '/user_search'
    dataType: 'script'
    data: search: value
  return

$(document).on "click", ".course-clone-already", ->
  $(this).next().text("Already Cloned")

$(document).on "click", ".import-users", ->
  $(".import-file").click();

$(document).on "change", ".import-file", ->
  console.log(this.files[0])
  console.log("this.files[0]")
  if (this.files[0])
    $(".import-user-submit").click();

$(document).on 'click', '.course-reply-link', ->
  commentId = $(this).data("comment-id");
  if (commentId != null)
    $(".reply_course_form_"+commentId+"").show();
