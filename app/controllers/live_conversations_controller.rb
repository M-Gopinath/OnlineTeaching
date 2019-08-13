class LiveConversationsController < ApplicationController
  before_action :authenticate_user!

  layout false

  def create
    if LiveConversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = LiveConversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = LiveConversation.create!(conversation_params)
    end
    @conversation.live_messages.where.not(user_id: current_user.id).update_all(is_read: true)
    render json: { conversation_id: @conversation.id }
  end

  def show
    @conversation = LiveConversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.live_messages.order('created_at ASC')
    @messages.where.not(user_id: current_user.id).update_all(is_read: true)
    @message = LiveMessage.new
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end
