class ChatsController < ApplicationController

  before_action :find_chat, only: [:show, :edit, :update, :destroy]

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new chat_params
    @chat.first_user = current_user.id

    if @chat.save
      redirect_to @chat
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @messages = Message.where(chat_id: @chat.id).order(:updated_at)
  end

  def update
    if @chat.update chat_params
      redirect_to @chat
    else
      render 'new'
    end
  end

  def destroy
    @chat.destroy!
    redirect_to root_path
  end

  private

  def chat_params
    params.require(:chat).permit(:second_user, :name)
  end


  def find_chat
    @chat = Chat.find(params[:id])
  end

end
