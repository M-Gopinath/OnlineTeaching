# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'click', '.image-upload-btn', ->
  console.log($(this).parent().find(".image-upload"))
  $(this).parent().find(".image-upload").click()

$(document).on 'click', '.video-upload-btn', ->
  $(this).parent().find(".video-upload").click()
  
$(document).on 'click', '.audio-upload-btn', ->
  $(this).parent().find(".audio-upload").click()
