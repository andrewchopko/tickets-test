class ProfilesController < ApplicationController

  before_action :find_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :destroy, :update, :edit]
  before_action :show_user_chats, only: [:show, :unread_messages]

  def show
    @chats.each do |chat|
      find_unread_messages chat
    end
  end

  def edit
  end

  def update
    if @profile.update profile_params
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def unread_messages
    @chats.each do |chat|
      find_unread_messages chat
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def find_profile
    user = current_user
    @profile ||= user.profile if user != nil
  end

  def profile_params
    params.require(:profile).permit(:name, :last_name, :phone, :email, :birth)
  end

  def show_user_chats
    @chats = Chat.find_by_sql(["SELECT * FROM chats WHERE (first_user = :id OR second_user = :id)", {id: current_user.id.to_s}])
  end

  def find_unread_messages(chat)
    @messages = Message.find_by_sql(["SELECT * FROM messages WHERE (chat_id = :chat_id AND user_id != :user_id)", {chat_id: chat.id, user_id: current_user.id.to_s}])
    @unread = 0
    @messages.each do |m|
      if m.created_at.to_i > current_user.last_sign_in_at.to_i
        @unread += 1
      end
    end
  end
end
