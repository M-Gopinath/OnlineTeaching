$(document).ready(function() {
  var messages, messages_to_bottom;
  messages = $('#lesson-messages');
  if ($('#lesson-messages').length > 0) {
    messages_to_bottom = function() {
      messages.scrollTop(messages.prop("scrollHeight"));
    };
    messages_to_bottom();
    App.lesson_chat = App.cable.subscriptions.create({
      channel: "LessonRoomChannel",
      chat_room_id: messages.data('chat-room-id')
    }, {
      connected: function() {console.log("lesson chat connected")},
      disconnected: function() {},
      received: function(data) {
        if (data.msg.parent_id != null){
          $(".lesson_reply_"+data.msg.parent_id+"").append(data.data)
          $(".reply_lesson_form_"+data.msg.parent_id+"").hide()
        }else{ 
          messages.append(data.data);
          messages_to_bottom();
        }
      },
      send_message: function(message, chat_room_id, parentId, lesson_id) {
        this.perform('lesson_received', {
          message: message,
          chat_room_id: chat_room_id,
          parent_id: parentId,
          lesson_id: lesson_id
        });
      }
    });
    $(document).on('click', '#new_lesson_message', function(e) {
      var $this, textarea, parentId, lesson_id;
      $this = $(this);
      textarea = $this.find('#lesson_message_body');
      lesson_id = $this.find('#lesson_message_lesson_id').val();
      parentId = $this.find("#lesson_message_parent_id").val();
      if ($.trim(textarea.val()).length > 1) {
        App.lesson_chat.send_message(textarea.val(), messages.data('chat-room-id'), parentId, lesson_id);
        textarea.val('');
      }
      e.preventDefault();
      return false;
    });
  }
});