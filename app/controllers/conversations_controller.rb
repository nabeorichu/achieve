class ConversationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).presernt?
      @comversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
    @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_massages_path(@conversation)
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
end
