$(document).ready ->
  App.personal_chat = App.cable.subscriptions.create {
    channel: "AppearanceChannel"
  },
  connected: ->
    console.log("Appearance connected")
  disconnected: ->
    console.log("Appearance disconnected")

  received: (data) ->
    user = $(".user-#{data['user_id']}")
    if data['online'] == true
      $(".user-#{data['user_id']}").removeClass 'fa fa-circle-o'
      $(".user-#{data['user_id']}").addClass 'fa fa-circle text-success'
    else
      $(".user-#{data['user_id']}").removeClass 'fa fa-circle text-success'
      $(".user-#{data['user_id']}").addClass 'fa fa-circle-o'
