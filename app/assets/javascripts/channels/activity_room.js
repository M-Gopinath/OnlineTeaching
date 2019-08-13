$(document).ready(function() {
  var messages, messages_to_bottom;
  messages = $('#activity-messages');
  if ($('#activity-messages').length > 0) {
    messages_to_bottom = function() {
      messages.scrollTop(messages.prop("scrollHeight"));
    };
    messages_to_bottom();
    App.activity_chat = App.cable.subscriptions.create({
      channel: "ActivityRoomChannel",
      chat_room_id: messages.data('chat-room-id')
    }, {
      connected: function() {console.log("activity chat connected")},
      disconnected: function() {},
      received: function(data) {
        if (data.msg.parent_id != null){
          $(".activity_reply_"+data.msg.parent_id+"").append(data.data)
          $(".reply_activity_form_"+data.msg.parent_id+"").hide()
        }else{ 
          messages.append(data.data);
          messages_to_bottom();
        }
      },
      send_message: function(message, chat_room_id, parentId, lesson_id) {
        this.perform('activity_received', {
          message: message,
          chat_room_id: chat_room_id,
          parent_id: parentId,
          lesson_id: lesson_id
        });
      }
    });
    $(document).on('click', '#new_activity_message', function(e) {
      var $this, textarea, parentId, lesson_id;
      $this = $(this);
      textarea = $this.find('#activity_message_body');
      lesson_id = $this.find('#activity_message_lesson_id').val();
      parentId = $this.find("#activity_message_parent_id").val()
      if ($.trim(textarea.val()).length > 1) {
        App.activity_chat.send_message(textarea.val(), messages.data('chat-room-id'), parentId, lesson_id);
        textarea.val('');
      }
      e.preventDefault();
      return false;
    });
  }
});