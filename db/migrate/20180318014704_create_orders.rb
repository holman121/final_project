class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :product_name
      t.integer :quantity
      t.decimal :total_price
      t.references :customer, foreign_key: true
      t.references :size, foreign_key: true

      t.timestamps
    end
  end
end
