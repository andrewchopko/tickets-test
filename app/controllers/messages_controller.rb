class MessagesController < ApplicationController

  before_action :set_chat
  before_action :set_message, only: [:update, :destroy]

  def create
    @message = Message.new message_params
    @message.user_id = current_user.id
    @message.chat_id = @chat.id

    if @message.save
      redirect_to @chat
    else
      render 'new'
    end
  end

  def new
    @message = Message.new
  end

  def destroy
    @message.destroy!
    redirect_to @chat
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
