class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :city
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end
