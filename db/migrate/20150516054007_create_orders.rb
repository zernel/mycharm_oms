class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :state
      t.string :contact_name
      t.string :contact_phone
      t.string :verification_code
      t.string :takeout_time
      t.integer :takeout_store_id
      t.string :shipping_address
      t.float :amount
      t.string :note

      t.timestamps null: false
    end
  end
end
