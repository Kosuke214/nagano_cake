class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :peyment_method
      t.integer :amount
      t.integer :shipping_charge
      t.string :shipping_name
      t.string :shipping_postalcode
      t.string :shipping_address
      t.integer :order_status
      t.timestamps
    end
  end
end
