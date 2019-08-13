$(document).ready(function(){
  App.live_chat = App.cable.subscriptions.create({
    channel: "LiveChatChannel"
    // chat_room_id: messages.data('chat-room-id')
  }, {
    connected: function() {
      return console.log('connected live');
    },
    disconnected: function() {
      return console.log('disconnected auction');
    },
    received: function(data) {
      var reciever_id = $('meta[name=user-id]').attr("content");
      if (reciever_id != data.message['sender_id']) {
        var chbox = $("#chatbox_" + data.message['id'] + " .chatboxcontent")
        chatBox.chatWith(data.message['id']);
        chbox.append(data.message['message'])        
        chbox.children().last().removeClass("self").addClass("other");
        chbox.scrollTop(chbox[0].scrollHeight);
        chatBox.notify();
      }
    },
    received_data: function(id, message, sender_id, recipient_id) {
      this.perform('received_data', {
        id: id,
        message: message,
        sender_id: sender_id,
        recipient_id: recipient_id
      });
    }
  });
})