class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :pound
      t.string :blessing
      t.string :note

      t.timestamps null: false
    end
  end
end
