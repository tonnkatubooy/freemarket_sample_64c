class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :destination_first_name, null:false
      t.string :destination_last_name, null:false
      t.string :destination_first_name_kana, null:false
      t.string :destination_last_name_kana, null:false
      t.string :post_number, null:false
      t.integer :prefecture, null:false
      t.string :city, null:false
      t.string :house_number, null:false
      t.string :building
      t.string :destination_phone_number
      t.references :user, foreign_key: true
      t.timestamps

    end
  end
end
