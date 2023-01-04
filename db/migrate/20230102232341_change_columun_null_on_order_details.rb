class ChangeColumunNullOnOrderDetails < ActiveRecord::Migration[6.1]
  def change
    change_column_null :order_details, :item_id, false
    change_column_null :order_details, :customer_id, false
    change_column_null :order_details, :price_including_tax, false
    change_column_null :order_details, :amount, false
    change_column_null :order_details, :production_status, false
  end
end
