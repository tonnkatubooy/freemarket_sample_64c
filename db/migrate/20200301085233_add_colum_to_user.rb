class AddColumToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name,      :string
    add_column :users, :last_name,       :string
    add_column :users, :first_name_kana, :string
    add_column :users, :last_name_kana,  :string
    add_column :users, :birthday,        :date
    add_column :users, :phone_number,    :string
    add_column :users, :introduction,    :text
  end
  #first_name,last_name,first_name_kana,last_name_kana,birthday  null:falseを外してます
end
