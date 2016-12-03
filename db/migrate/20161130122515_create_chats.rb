class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :first_user
      t.string :integer
      t.integer :second_user

      t.timestamps null: false
    end
  end
end
