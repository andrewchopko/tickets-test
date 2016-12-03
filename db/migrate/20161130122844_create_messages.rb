class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :chat_id
      t.text :text

      t.timestamps null: false
    end
  end
end
