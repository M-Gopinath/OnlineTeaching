$(document).ready(function() {
  $(document).on("click", ".course-chat-activity", function(){
    var messages, messages_to_bottom;
    messages = $('#enroll-messages');
    course = $('.course-chat-activity');
    console.log(course.data('course-id'))
    console.log("course.data('course-id')")
      messages_to_bottom = function() {
        messages.scrollTop(messages.prop("scrollHeight"));
      };
      messages_to_bottom();
      App.course_chat = App.cable.subscriptions.create({
        channel: "CourseRoomChannel",
        chat_room_id: course.data('course-id')
      }, {
        connected: function() {console.log("course chat connected")},
        disconnected: function() {console.log("course chat disconnected")},
        received: function(data) {
          // if (data.msg){
          //   App.coruse_chat_notify.coruse_chat_count(data.msg.id,domain);
          // }
          messages = $('#enroll-messages');
          if ($('#enroll-messages').length > 0) {
            if (data.msg.parent_id != null){
              $(".course_reply_"+data.msg.parent_id+"").append(data.data)
              $(".reply_course_form_"+data.msg.parent_id+"").hide()
            }else{ 
              messages.append(data.data);
              messages_to_bottom();
            }
          }
        },
        send_message: function(message, chat_room_id, parentId,domain) {
          this.perform('course_received', {
            message: message,
            chat_room_id: chat_room_id,
            parent_id: parentId,
            domain: domain
          });
        }
      });
  });
  $(document).on('click', '.post-message', function(e) {
    e.preventDefault();
    e.stopPropagation();
    var $this, textarea, parentId;
    $this = $(this).parent();
    messages = $('#enroll-messages');
    textarea = $this.find('#enroll_course_message_body');
    parentId = $this.find("#enroll_course_message_parent_id").val()
    domain = $('.current_domain').data("domain")
    if ($.trim(textarea.val()).length > 1) {
      App.course_chat.send_message(textarea.val(), messages.data('chat-room-id'), parentId,domain);
      textarea.val('');
    }
    return false;
  });
});