class CreateCustomer < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :full_address

      t.timestamps
    end
  end
end
