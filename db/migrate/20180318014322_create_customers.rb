class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
