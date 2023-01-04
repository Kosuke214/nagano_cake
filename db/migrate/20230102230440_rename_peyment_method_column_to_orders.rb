class RenamePeymentMethodColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :peyment_method, :payment_method
  end
end
