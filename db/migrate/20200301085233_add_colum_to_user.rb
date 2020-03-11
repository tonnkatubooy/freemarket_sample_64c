class AddColumToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name,      :string, null:false
    add_column :users, :last_name,       :string, null:false
    add_column :users, :first_name_kana, :string, null:false
    add_column :users, :last_name_kana,  :string, null:false
    add_column :users, :birthday,        :date,   null:false
    add_column :users, :phone_number,    :string
    add_column :users, :introduction,    :text
  end
end
