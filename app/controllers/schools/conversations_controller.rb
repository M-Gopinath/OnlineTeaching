class Schools::ConversationsController < ApplicationController
  layout "sub_domain"
  before_action :authenticate_user!

  def new
  end

  def create
    recipients = User.where(id: conversation_params[:recipients])
    @recipients_ids = recipients.collect(&:id)
    # conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    # ConversationJob.perform(current_user, @recipients_ids, conversation_params[:body], conversation_params[:subject])
    if @recipients_ids.count > 3
      Resque.enqueue_at(30.seconds.from_now, ConversationJob, current_user, @recipients_ids, conversation_params[:body], conversation_params[:subject], Apartment::Tenant.current)
    else
      @conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    end



    flash[:success] = "Your message was successfully sent!"
    # redirect_to schools_conversation_path(conversation)
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to schools_conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to schools_mailbox_inbox_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to schools_mailbox_inbox_path
  end


  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end
end
