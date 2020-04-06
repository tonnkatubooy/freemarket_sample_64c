class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :item_name,          null: false
      t.integer    :price,              null: false
      t.text       :discription,        null: false
      t.references :user,               null: false, foreign_key: true
      t.references :category,           foreign_key: true
      t.references :brand,              foreign_key: true
      t.integer    :size             
      t.integer    :status_id,          null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :area_id,            null: false
      t.integer    :shipping_date_id,   null: false
      t.integer    :shipping_method_id
      t.timestamps

      # :category,:shipping_method_id  null: false 一時的にはずす
    end
  end
end
