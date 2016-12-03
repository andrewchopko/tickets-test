class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :name, :string, default: ""
    add_column :profiles, :last_name, :string, default: ""
    add_column :profiles, :phone, :integer, default: nil
    add_column :profiles, :email, :string, default: ""
    add_column :profiles, :birth, :date, default: nil
  end
end
