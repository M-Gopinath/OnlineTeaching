$(document).ready(function(){
  App.chat_count = App.cable.subscriptions.create({
    channel: "MailChatChannel"
    // chat_room_id: messages.data('chat-room-id')
  }, {
    connected: function() {
      return console.log('connected');
    },
    disconnected: function() {
      return console.log('disconnected auction');
    },
    received: function(data) {
      console.log(data.message);
      $(data.message).each(function(index, user_data){
        console.log(user_data);
        $(".mail_count_"+user_data[0]+"").text(user_data[1]);
        $('.mailboxes_user_'+user_data[0]+"").html("<span class='th-badge__badge'>"+user_data[1]+"</span>");
        $('.message_notification_'+user_data[0]+"").html(user_data[2]);

        console.log(".mail_count_"+user_data[0]+"")
      })
    },
    message_count: function(users) {
      this.perform('message_count', {
        users: users
      });
    }
  });
  $(document).on('click', '.send-message', function(e){
    $('.modal_loading').show();
    $.ajax({
      url: '/schools/conversations',
      type: 'POST',
      data: $('#conversations-form').serialize(),
    });
    return false;
  });

   App.notification_count = App.cable.subscriptions.create({
    channel: "NotificationChannel"
    // chat_room_id: messages.data('chat-room-id')
  }, {
    connected: function() {
      return console.log('connected');
    },
    disconnected: function() {
      return console.log('disconnected auction');
    },
    received: function(data) {
      console.log(data.message);
      $(data.message).each(function(index, user_data){
        console.log(user_data[0]);
        console.log(user_data[1]);
        if (user_data[1] != 0 && user_data[1] != '0'){
          $(".notification_user_"+user_data[0]+"").html("<span class='notification-badge__badge'>"+user_data[1]+"</span>");
          console.log(".notification_user_"+user_data[0]+"");
          $('.announcement_notification_'+user_data[0]+"").html(user_data[2]);
        }
      })
    },
    message_count: function(type) {
      this.perform('message_count', {
        type: type
      });
    }
  });

});
