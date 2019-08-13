class LiveMessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @conversation = LiveConversation.find(params[:live_conversation_id])
    @message = @conversation.live_messages.build(message_params)
    @message.user_id = current_user.id
    @message.save
    @path = live_conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:live_message).permit(:body)
  end
end
