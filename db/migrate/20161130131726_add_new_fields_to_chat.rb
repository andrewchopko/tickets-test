class AddNewFieldsToChat < ActiveRecord::Migration
  def change
    remove_column :chats, :first_user
    remove_column :chats, :integer

    add_column :chats, :first_user, :integer
    add_column :chats, :name, :string, default: "ChatName"
  end
end
