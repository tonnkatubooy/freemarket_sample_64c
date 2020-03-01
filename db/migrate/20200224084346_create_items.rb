class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :item_name,      null: false
      t.integer   :price,           null: false
      t.text       :discription,    null: false
      t.references :user,           null: false, foreign_key: true
      t.integer   :size,            null: false
      t.integer   :status,          null: false
      t.integer   :delivery_charge, null: false
      t.integer   :area,            null: false
      t.integer   :shipping_date,   null: false
      t.integer   :shipping_method, null: false
      t.timestamps
    end
  end
end
