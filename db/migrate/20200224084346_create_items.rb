class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.references :user, null: false, foreign_key: true
      t.text :discription
      t.integer :price, null: false
      t.timestamps
    end
  end
end
