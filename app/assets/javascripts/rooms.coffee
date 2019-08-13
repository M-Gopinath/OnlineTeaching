$(document).ready ->
  messages = $('#messages')
  if $('#messages').length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))
    messages_to_bottom()
    App.global_chat = App.cable.subscriptions.create {
        channel: "ChatRoomsChannel"
        chat_room_id: messages.data('chat-room-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        console.log(data.msg.parent_id)
        console.log("data.msg.parent_id")
        if data.msg.parent_id != null
          $(".reply_" + data.msg.parent_id + "").append data.data
          $(".reply_form_" + data.msg.parent_id + "").hide()
        else
          messages.append data.data
          messages_to_bottom()

      send_message: (message, chat_room_id, parentId) ->
        @perform 'send_message', message: message, chat_room_id: chat_room_id, parent_id: parentId

    $(document).on 'click', '#new_chat_message', (e) ->
      $this = $(this)
      textarea = $this.find('#chat_message_body')
      parentId = $this.find("#chat_message_parent_id").val()
      console.log(parentId)
      if $.trim(textarea.val()).length > 1
        console.log(textarea.val())
        App.global_chat.send_message textarea.val(), messages.data('chat-room-id'), parentId
        textarea.val('')
      e.preventDefault()
      return false