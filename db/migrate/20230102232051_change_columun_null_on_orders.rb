class ChangeColumunNullOnOrders < ActiveRecord::Migration[6.1]
  def change
    change_column_null :orders, :customer_id, false
    change_column_null :orders, :payment_method, false
    change_column_null :orders, :amount, false
    change_column_null :orders, :shipping_charge, false
    change_column_null :orders, :shipping_name, false
    change_column_null :orders, :shipping_postalcode, false
    change_column_null :orders, :shipping_address, false
    change_column_null :orders, :order_status, false
  end
end
