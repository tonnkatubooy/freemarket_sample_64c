class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string     :card_id
      t.references :user,        null: false, foreign_key: true
      t.string     :customer_id
      t.timestamps
    end
  end
end
