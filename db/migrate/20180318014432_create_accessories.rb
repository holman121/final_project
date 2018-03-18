class CreateAccessories < ActiveRecord::Migration[5.1]
  def change
    create_table :accessories do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
