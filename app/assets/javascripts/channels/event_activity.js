$(document).ready(function(){
  App.event_activity = App.cable.subscriptions.create({
    channel: "EventActivityChannel"
    // chat_room_id: messages.data('chat-room-id')
  }, {
    connected: function() {
      return console.log('connected');
    },
    disconnected: function() {
      return console.log('disconnected auction');
    },
    received: function(data) {
      $(data.users).each(function(key, val){
        console.log(data.user_notifies)
        var path = '../../event/'+data.notification.notificable_id+"/"+data.user_notifies[key]
        var old_count = $(".top_header_notify_"+val).text();
        var new_count = parseInt(old_count) + 1
        $(".top_header_notify_"+val).text(new_count)
        $(".header_notify_count_"+val).text("You have "+new_count+" notifications")
        $(".body_notify_"+val).prepend("<li><a href='"+path+"'><p><b>"+data.notification.title+"</b></p><p>"+data.notification.note+"</p></a></li>")
      });
      $(data.notify_data).each(function(index, user_data){
        console.log
        if (user_data[1] != 0 && user_data[1] != '0'){
          $('.events_user_'+user_data[0]+"").html("<span class='th-badge__badge'>"+user_data[1]+"</span>");
          $('.event_notification_'+user_data[0]+"").html(user_data[2]);
        }
      });
    },
    event_message: function(event) {
      console.log("event results")
      this.perform('event_message', {
        event: event
      });
    }
  });

  $(document).on("submit", "#new_event", function(e){
    $.ajax({
      url: '/events',
      type: 'POST',
      data: $(this).serialize(),
    });
    return false;
  });

})
