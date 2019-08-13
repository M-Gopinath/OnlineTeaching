$(document).ready(function(){  

   App.coruse_chat = App.cable.subscriptions.create({
    channel: "CourseChatChannel"
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
          $(".direct_chart_"+user_data[0]+"").html("<span class='notification-badge__badge'>"+user_data[1]+"</span>");
          $('.direct_charts_'+user_data[0]+"").html(user_data[2]);
        }
      })
    },
    coruse_chat_count: function(message_id) {
      this.perform('coruse_chat_count', {
        message_id: message_id
      });
    }
  });

});
